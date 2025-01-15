Sub Rutina_Facturas()
    ' Declara la variable `rango` en el ámbito global
    Dim Fila As Integer
    Dim columna_int, columna_out As String
    Dim rango As Range

    'Sheets("Hoja4").Activate

    columna_int = "C"
    columna_out = "M"
    
    For Fila = 1 To Range(columna_int & Rows.Count).End(xlUp).Row
        Value = UCase(Cells(Fila, columna_int))

        If InStr(1, Value, "SANTANDER") > 0 Then
            Cells(Fila, columna_out) = "NOMINA"
            Cells(Fila, columna_out).Interior.ColorIndex = 15
        End If
        
        If InStr(1, Value, "UNIVERSIDAD NACIONAL") > 0 Then
            Cells(Fila, columna_out) = "NOMINA"
            Cells(Fila, columna_out).Interior.ColorIndex = 15
        End If
        
        If InStr(1, Value, "DE GOBERNACION") > 0 Then
            Cells(Fila, columna_out) = "NOMINA"
            Cells(Fila, columna_out).Interior.ColorIndex = 15
        End If
        
         If InStr(1, Value, "7-ELEVEN") > 0 Then
            Cells(Fila, columna_out) = "GASTOS EN GENERAL"
            Cells(Fila, columna_out).Interior.Color = RGB(21, 159, 187)
        End If
        
         If InStr(1, Value, "RESTAURANTE") > 0 Then
            Cells(Fila, columna_out) = "GASTOS EN GENERAL"
            Cells(Fila, columna_out).Interior.Color = RGB(21, 159, 187)
        End If
        
        'Debug.Print Value
    Next

    MsgBox "Cambios Aplicados"
End Sub

Private Sub AplicarFecha()
'
    Range("Tabla65[FechaEmision]").Select
    Selection.NumberFormat = "m/d/yyyy"
    Range("G6").Select
End Sub

 Private Sub BuscarPalabraEnFila()
    Dim Busqueda As String
    Dim Fila As Range
    Dim Celda As Range
    Dim Columna As Integer
    
    ' Definir la palabra a buscar
    Busqueda = "libro"
    
    ' Definir la fila donde buscar (por ejemplo, fila 1)
    
    Set Fila = ThisWorkbook.ActiveSheet.Select.Rows(1)
    ' Inicializar la variable de columna
    Columna = 0
    
    ' Iterar a través de las celdas en la fila
    For Each Celda In Fila.Cells
        ' Comprobar si la celda contiene la palabra buscada (sin distinción entre mayúsculas y minúsculas)
        If InStr(1, Celda.Value, Busqueda, vbTextCompare) > 0 Then
            ' Si se encuentra la palabra, obtener el número de columna
            Columna = Celda.Column
            Exit For ' Salir del bucle una vez que se encuentra la primera coincidencia
        End If
    Next Celda
    
    ' Mostrar el resultado
    If Columna > 0 Then
        MsgBox "La palabra '" & Busqueda & "' se encuentra en la columna " & Columna
    Else
        MsgBox "La palabra '" & Busqueda & "' no se encontró en la fila especificada."
    End If
End Sub

Private Sub TestEmpleado()
    ' Crear un nuevo objeto de empleado
    Dim Empleado1 As New clsEmpleado
    
    ' Asignar valores a las propiedades
    Empleado1.Nombre = "Juan Pérez"
    Empleado1.Salario = 50000
    
    ' Calcular el salario anual y mostrarlo en una celda
    Range("A1").Value = Empleado1.Nombre
    Range("A2").Value = Empleado1.Salario
    Range("A3").Value = Empleado1.SalarioAnual()
End Sub


Sub Ejecutar()
Dim columna_init As Integer

    columna_init = BuscarPalabraEnFila(5, "NombreEmisor")
    
Debug.Print columna_init
End Sub

Sub Rutina_Facturas()
    ' Declara la variable `rango` en el ámbito global
    Dim MiHoja As Worksheet ' Declaración de una variable para almacenar una hoja de trabajo
    Dim Fila As Integer
    Dim colInicial, colTipoFactura As String
    Dim rango As Range
    Dim UltimaFila As Long
    
    On Error Resume Next
    Set MiHoja = ThisWorkbook.Sheets(ActiveSheet.Name)
    
    colInicial = BuscarPalabraEnFila(5, "NombreEmisor")
    colTipoFactura = BuscarPalabraEnFila(5, "Tipo Factura")
    UltimaFila = MiHoja.Cells(Rows.Count, colInicial).End(xlUp).Row
    
    For Fila = 1 To UltimaFila
        Value = UCase(Cells(Fila, colInicial))

        If InStr(1, Value, "BBVA") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "NOMINA"
            MiHoja.Cells(Fila, colTipoFactura).Interior.ColorIndex = 15
        End If
        
        If InStr(1, Value, "SANTANDER") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "NOMINA"
            MiHoja.Cells(Fila, colTipoFactura).Interior.ColorIndex = 15
        End If
        
        If InStr(1, Value, "UNIVERSIDAD NACIONAL") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "NOMINA"
            MiHoja.Cells(Fila, colTipoFactura).Interior.ColorIndex = 15
        End If
        
        If InStr(1, Value, "DE GOBERNACION") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "NOMINA"
            MiHoja.Cells(Fila, colTipoFactura).Interior.ColorIndex = 15
        End If
        
         If InStr(1, Value, "7-ELEVEN") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "GASTOS EN GENERAL"
            MiHoja.Cells(Fila, colTipoFactura).Interior.Color = RGB(21, 159, 187)
        End If
        
         If InStr(1, Value, "RESTAURANTE") > 0 Then
            MiHoja.Cells(Fila, colTipoFactura) = "GASTOS EN GENERAL"
            MiHoja.Cells(Fila, colTipoFactura).Interior.Color = RGB(21, 159, 187)
        End If
        
        'Debug.Print Value
    Next

    MsgBox "Cambios Aplicados"
End Sub
