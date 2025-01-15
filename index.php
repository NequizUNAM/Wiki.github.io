<?php
    require_once('public_html/header.php'); 
?>
  
  
  
  <main class="d-flex flex-nowrap">
  <h1 class="visually-hidden">Sidebars examples</h1>

  <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">Sidebar</span>
    </a>
    <hr>


    <?php
        // Establecer el directorio base
        $dir = "codes";
        
        // Verificar si el directorio existe
        if (is_dir($dir)) {
            // Abrir el directorio
            $folders = scandir($dir);
            
            // Filtrar solo las carpetas, eliminando los "." y ".."
            $folders = array_filter($folders, function($folder) use ($dir) {
                return is_dir($dir . '/' . $folder) && $folder != "." && $folder != "..";
            });
        
            // Si hay carpetas, generar la lista no ordenada
            if (!empty($folders)) {
                echo '<ul class="nav nav-pills flex-column mb-auto">';
                
                // Crear un <li> por cada carpeta con un enlace <a> hacia la carpeta
                foreach ($folders as $folder) {
                    echo '<li class="nav-item"><a class="nav-link text-white"" aria-current="page" href="' . $dir . '/' . $folder . '">' . $folder . '</a></li>';
                }
                
                echo '</ul>';
            } else {
                echo 'No hay carpetas en el directorio.';
            }
        } else {
            echo 'El directorio "codes" no existe.';
        }
    ?>



    
    <hr>
    <div class="dropdown">
    </div>
  </div>

  <div class="b-example-divider b-example-vr" style="height: 700px;">  
  </div>

<?php require_once('public_html/footer.php'); ?>