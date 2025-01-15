Option Explicit
'Autor: Pedro Nequiz
'Funciones para obtener los datos

'
'@Description: Funcion que obtiene el Subtotal restando el IVA
'@Param("Tipo", "El campo al que corresponde en formato de texto")
'@Param("cantidad", "La cantidad en enteros")
'@Param("tasaIVA", Opcional, "por defecto es 1.16 pero se puede ingresar una")
'@Returns("El valor del total calculado con IVA.")
Function FSUBTOTAL(Tipo As String, cantidad As Double, Optional tasaIVA As Double = 1.16) As Double
    Dim iva As Double
    Select Case LCase(Tipo)
        Case "banco"
            cantidad = 0
        Case "nomina"
            cantidad = 0
        Case Else
            cantidad = cantidad / tasaIVA
    End Select
    
    FSUBTOTAL = cantidad
End Function
'
'@Description: Funcion que obtiene el IVA del Subtotal
'@Param("Tipo", "El campo al que corresponde en formato de texto")
'@Param("cantidad", "La cantidad en enteros")
'@Returns("El valor del IVA calculado.")
Function FOBTENERIVA(Tipo As String, cantidad As Double)
    Dim dblRoundDown As Double
    Select Case LCase(Tipo)
        Case "medicos"
            'REDONDEAR(H50*0,0)
            dblRoundDown = Application.WorksheetFunction.RoundDown(cantidad * 0, 2)
        Case Else
            'Funcion =REDONDEAR() de un numero
            dblRoundDown = Application.WorksheetFunction.RoundDown(cantidad * 0.16, 3)
    End Select

    FOBTENERIVA = dblRoundDown
End Function

'Busca la palabra en la celda especificada
'@Param fila_buscar Int
'@Param palabra_buscar String
Function BuscarPalabraEnFila(ByVal fila_buscar As Long, ByVal palabra_buscar As String)
    Dim Fila As Range
    Dim Celda As Range
    Dim Columna As Long
    Dim Encontrada As Boolean
    
    palabra_buscar = UCase(palabra_buscar)

    ' Verificar que la fila de búsqueda sea válida
    If fila_buscar <= 0 Then
        MsgBox "La fila de búsqueda no es válida."
        Exit Function
    End If
    
    ' Definir la fila donde buscar
    On Error Resume Next ' Ignorar errores si la fila no existe
    Set Fila = ThisWorkbook.ActiveSheet.Rows(fila_buscar)
    On Error GoTo 0 ' Restaurar el manejo de errores
    
    ' Verificar si la fila existe
    If Fila Is Nothing Then
        MsgBox "La fila de búsqueda no existe en la hoja activa."
        Exit Function
    End If
    
    ' Inicializar la variable de columna
    Columna = 0
    Encontrada = False
    
    ' Iterar a través de las celdas en la fila
    For Each Celda In Fila.Cells
        ' Comprobar si la celda contiene la palabra buscada (sin distinción entre mayúsculas y minúsculas)
        If InStr(1, UCase(Celda.Value), palabra_buscar, vbTextCompare) > 0 Then
            ' Si se encuentra la palabra, obtener el número de columna
            Columna = Celda.Column
            Encontrada = True
            Exit For ' Salir del bucle una vez que se encuentra la primera coincidencia
        End If
    Next Celda
    
    ' Mostrar el resultado
    If Encontrada Then
        'MsgBox "La palabra '" & palabra_buscar & "' se encuentra en la columna " & Columna
        BuscarPalabraEnFila = Columna
    Else
        'MsgBox "La palabra '" & palabra_buscar & "' no se encontró en la fila especificada."
        BuscarPalabraEnFila = 0
    End If
End Function

