Sub Rutina_Facturas()
    Dim MiHoja As Worksheet
    Dim Fila As Long, colInicial As Long, colTipoFactura As Long, colMonto As Long, colSubTotal As Long, colIva As Long, colTotal As Long, UltimaFila As Long
    Dim valorBuscador As String
    Dim filaHeaders As Integer
        
    ' Verificar si hay una hoja activa antes de asignarla a la variable
    On Error Resume Next
    Set MiHoja = ThisWorkbook.Sheets(ActiveSheet.Name)
    On Error GoTo 0
    
    If MiHoja Is Nothing Then
        MsgBox "No hay una hoja activa. El proceso se ha detenido.", vbExclamation
        Exit Sub
    End If
    
    'VARIABLES
    filaHeaders = 5
    colInicial = BuscarPalabraEnFila(filaHeaders, "NombreEmisor")
    colTipoFactura = BuscarPalabraEnFila(filaHeaders, "Tipo Factura")
    colMonto = BuscarPalabraEnFila(filaHeaders, "Monto")
    colSubTotal = BuscarPalabraEnFila(filaHeaders, "SUBTOTAL")
    colIva = BuscarPalabraEnFila(filaHeaders, "IVA")
    colTotal = BuscarPalabraEnFila(filaHeaders, "Total")
    UltimaFila = MiHoja.Cells(MiHoja.Rows.Count, colInicial).End(xlUp).Row
       
    For Fila = filaHeaders + 1 To UltimaFila
        valorBuscador = UCase(MiHoja.Cells(Fila, colInicial).Value)
        
        Select Case True
            Case InStr(1, valorBuscador, "BBVA") > 0, InStr(1, valorBuscador, "SANTANDER") > 0, _
                 InStr(1, valorBuscador, "UNIVERSIDAD NACIONAL") > 0, InStr(1, valorBuscador, "DE GOBERNACION") > 0
                
                MiHoja.Cells(Fila, colTipoFactura) = "NOMINA"
                MiHoja.Cells(Fila, colTipoFactura).Interior.ColorIndex = 15
                          
            Case InStr(1, valorBuscador, "7-ELEVEN") > 0, InStr(1, valorBuscador, "RESTAURANTE") > 0
                MiHoja.Cells(Fila, colTipoFactura) = "GASTOS EN GENERAL"
                MiHoja.Cells(Fila, colTipoFactura).Interior.Color = RGB(21, 159, 187)
        End Select

        'Se añade formula
        MiHoja.Cells(Fila, colSubTotal).Formula = "=FSUBTOTAL(" & MiHoja.Cells(Fila, colMonto).Address & "," & MiHoja.Cells(Fila, colTipoFactura).Address & ")"
    Next

    'Se coloca la formula al ser una tabla se aplica en todas las celdas
    'quitamos el simbolo $
    init_table = filaHeaders + 1
    celda_monto = MiHoja.Cells(init_table, colMonto).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    celda_subtotal = MiHoja.Cells(init_table, colSubTotal).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    celda_iva = MiHoja.Cells(init_table, colIva).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    celda_tipo_factura = MiHoja.Cells(init_table, colTipoFactura).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    'formula SUBTOTAL
    MiHoja.Cells(init_table, colSubTotal).Formula = "=FSUBTOTAL(" & celda_monto & "," & celda_tipo_factura & ")"
    'formula IVA
    MiHoja.Cells(init_table, colIva).Formula = "=FOBTENERIVA(" & celda_subtotal & "," & celda_tipo_factura & ")"
    
    'formula Total
    'MiHoja.Cells(init_table, colTotal).Formula = "=SUMA(" & celda_subtotal & "," & celda_iva & ")"
     
    'Opcional: Para activar
    'Application.Calculation = xlCalculationAutomatic
    'Application.Calculation = xlManual
    
    MsgBox "Cambios Aplicados"
End Sub



