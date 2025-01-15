/** =============================
 * Funciones Globales
============================= */
function doGet() {
  var template = HtmlService.createTemplateFromFile('Index');
  return template.evaluate();
}

function include(fileName) {
  return HtmlService.createHtmlOutputFromFile(fileName).getContent();
}

/** =============================
 * Funciones Generales
============================= */
function buscarAlumnoCuenta(numeroCuenta) {
  const SS = SpreadsheetApp.getActiveSpreadsheet();
  const sheetRegistros = SS.getSheetByName("Calificaciones");

  if (!sheetRegistros) {
    throw new Error("La hoja 'Calificaciones' no existe.");
  }

  // Obtener los datos de la hoja
  const datos = sheetRegistros.getDataRange().getValues();
  const cabeceras = datos[0]; // Primera fila como cabeceras
  const registros = datos.slice(1); // Resto de las filas como datos

  // Buscar el registro que coincida en la columna C (índice 2)
  const resultado = registros.find(fila => fila[2] == numeroCuenta);

  if (resultado) {
    Logger.log(`Registro encontrado: ${resultado}`);
    return { cabeceras, datos: resultado };
  } else {
    Logger.log(`No se encontró un registro con el número de cuenta: ${numeroCuenta}`);
    return { cabeceras, datos: null };
  }
}

function gsVerificarUsuario(contrasena) {
  const SS = SpreadsheetApp.getActiveSpreadsheet();
  const hojaUsuarios = SS.getSheetByName("Usuarios");

  if (!hojaUsuarios) {
    throw new Error("La hoja 'Usuarios' no existe.");
  }

  // Obtener los datos de la hoja
  const datos = hojaUsuarios.getDataRange().getValues();

  // Excluir la primera fila (cabeceras)
  const registros = datos.slice(1);

  // Buscar en la columna C (índice 2) si la contraseña coincide
  const usuarioEncontrado = registros.find(fila => fila[2] == contrasena);
  
  if (usuarioEncontrado) {
    // Si el usuario es encontrado, devolver un objeto con datos
    return { valid: true, nombreUsuario: usuarioEncontrado[0] };
  }
  return { valid: false };
}

function gsObtenerListaAlumnos () {
  var SS = SpreadsheetApp.getActiveSpreadsheet();
  var sheetAlumnos = SS.getSheetByName('Asistencias');
  var dataAlumnos = sheetAlumnos.getDataRange().getValues();

  // Elimina las primeras tres filas de la cabecera
  dataAlumnos.shift(); // Primera fila (cabecera)
  dataAlumnos.shift(); // Segunda fila (cabecera)
  dataAlumnos.shift(); // Tercera fila (cabecera)

  Logger.log(dataAlumnos); // Se imprimen datos desde el Excel
  return dataAlumnos; // Arreglo completo con todos los registros
}

/**
 * video  : https://www.youtube.com/watch?v=B8Bx5l5M3fE
*/
function gsGuardarAsistencia(cuenta, tipoAsistencia, codigo_clase, horario_clase) {
  var SS = SpreadsheetApp.getActiveSpreadsheet();
  var sheetRegistro = SS.getSheetByName('Logs_Asistencia');
  
  var id = new Date();  // Se utiliza la fecha y hora actual como identificador
  var resultado_asistencia = fnCompararHoraLimite(horario_clase);

  // Insertar los datos en la hoja de cálculo
  sheetRegistro.appendRow([id, cuenta, codigo_clase, tipoAsistencia,resultado_asistencia]);
}

function fnCompararHoraLimite(horaLimite) {
  var fecha = new Date();
  var horasFecha = fecha.getHours();
  var minutosFecha = fecha.getMinutes();

  // Convertir la hora límite a minutos totales
  var horaLimParts = horaLimite.split(':');
  var horaLim = parseInt(horaLimParts[0]);
  var minLim = parseInt(horaLimParts[1]);
  var tiempoLim = horaLim * 60 + minLim;

  // Convertir la hora actual a minutos totales
  var tiempoFecha = horasFecha * 60 + minutosFecha;

  if (tiempoFecha < tiempoLim) {
    return "Asistencia";
  } else {
    return "Retardo";
  }
}



