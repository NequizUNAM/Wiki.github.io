// Obtener todos los elementos cuyo id comienza con "advancedgrading-criteria"
var elementosConId = document.querySelectorAll('[id^="advancedgrading-criteria"]');

// Array para almacenar los objetos JSON
var elementosJson = [];

// Iterar sobre los elementos y filtrar los que terminan con "score" o "remark"
elementosConId.forEach(function(elemento) {
    var id = elemento.id;
    var name = elemento.getAttribute('name');
    var labelledby = elemento.getAttribute('aria-labelledby');
    var value = elemento.value; // Obtener el valor del elemento

    // Verificar si el id termina con "score" o "remark"
    if (id.endsWith("score") || id.endsWith("remark")) {
        // Crear objeto JSON con la información requerida
        var elementoJson = {
            id: id,
            name: name,
            labelledby: labelledby,
            value: value  // Agregar el valor al objeto JSON
        };

        // Agregar el objeto al array
        elementosJson.push(elementoJson);
    }
});

// Convertir el array de objetos JSON a formato JSON
var jsonOutput = JSON.stringify(elementosJson);

// Imprimir el JSON generado en la consola
console.log(jsonOutput);

alert(jsonOutput);
