Attribute VB_Name = "Módulo1"
Option Explicit
'Autor: Pedro Nequiz
'Funciones para obtener los datos

'===========================
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

'===========================
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
