// configurar archivos para generar QR en PHP
// Instalar dependencia
composer require endroid/qr-code


// Ejemplo de Codigo
<?php

// Incluir el autoloader de Composer
require 'vendor/autoload.php';

use Endroid\QrCode\QrCode;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\LabelAlignment;

// Crear una instancia del generador de QR Code
$qrCode = new QrCode('Texto o URL para el código QR');

// Establecer las opciones del código QR
$qrCode->setSize(300);
$qrCode->setMargin(10);
$qrCode->setEncoding('UTF-8'); // Esta línea ya no es necesaria en versiones recientes

// Establecer el nivel de corrección de errores
$qrCode->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH);

// Configurar el color de la imagen
$qrCode->setForegroundColor(['r' => 0, 'g' => 0, 'b' => 0]);
$qrCode->setBackgroundColor(['r' => 255, 'g' => 255, 'b' => 255]);

// Generar la imagen PNG
header('Content-Type: image/png');
echo $qrCode->writeString();

?>


// En caso de error
Actualización de la Biblioteca:
composer update endroid/qr-code


//En caso de error revisar
1. Verifica el Archivo php.ini

Busca la línea que hace referencia a mysqli, que debería ser algo como:
;extension=mysqli

Asegúrate de que esta línea no esté comentada (es decir, debería ser:
extension=mysqli


5. Verifica el Path en php.ini
extension_dir="C:\xampp\php\ext"


