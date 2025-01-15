/** @OnlyCurrentDoc */
/* ================================================= */
function siguienteMiercolesViernes(fechaInicial) {
  var fecha = new Date(fechaInicial);
  
  while (true) {
    fecha.setDate(fecha.getDate() + 1); // Avanza un día
    
    // Si el día es miércoles o viernes, se detiene y devuelve la fecha
    if (fecha.getDay() === 3 || fecha.getDay() === 5) {
      return fecha;
    }
  }
}

/* ================================================= */
function siguienteLunesViernes(fechaInicial) {
  var fecha = new Date(fechaInicial);
  
  while (true) {
    fecha.setDate(fecha.getDate() + 1); // Avanza un día
    
    // Si el día es lunes o viernes, se detiene y devuelve la fecha
    if (fecha.getDay() === 1 || fecha.getDay() === 5) {
      return fecha;
    }
  }
}

/* ================================================= */
function insertarHola() {
  var nombreHoja = "Respuestas de Asistencias";
  var hoja = SpreadsheetApp.getActiveSpreadsheet().getSheetByName(nombreHoja);
  
  if (!hoja) {
    // Manejar el caso en el que no se encuentra la hoja
    Logger.log("No se encontró la hoja con el nombre especificado: " + nombreHoja);
    return;
  }
  
  var ultimaFila = hoja.getLastRow();
  var columnaDesplazada = 5; // Columna E
  
  hoja.getRange(ultimaFila, columnaDesplazada).setValue("Hola");
}
