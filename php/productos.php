<?php
require_once('../libs/xajax_core/xajax.inc.php');
spl_autoload_register(function ($clase) {
    include '../clases/' . $clase . '.php';
});



// Creamos el objeto xajax
$xajax = new xajax('fcesta.php');

// Registramos la función que vamos a llamar desde JavaScript
$xajax->register(XAJAX_FUNCTION,"cargarCesta");
$xajax->register(XAJAX_FUNCTION,"vaciarCesta");
// Y configuramos la ruta en que se encuentra la carpeta xajax_js
$xajax->configure('javascript URI','../libs/');
$xajax->configure('debug',true);

// Recuperamos la información de la sesión
session_start();

// Y comprobamos que el usuario se haya autentificado
if (!isset($_SESSION['usuario'])) {
    die("Error - debe <a href='login.php'>identificarse</a>.<br />");
}

// Recuperamos la cesta de la compra
$cesta = CestaCompra::loadCesta();
var_dump($cesta);

if(isset($_SESSION['productosNuevos'])) {
    $nuevosProductos = $_SESSION['productosNuevos'];

    foreach ($nuevosProductos as $producto) {
        $cesta->newArticulo($producto->getCodigo());
        $cesta->saveCesta();
        $cesta = CestaCompra::loadCesta();
    }
    unset($_SESSION['productosNuevos']);
}

if ($_SESSION['vaciado_xajax'] == true) {
    $cesta = new CestaCompra;
    $cesta->saveCesta();
    $cesta = CestaCompra::loadCesta();
}

// Comprobamos si se ha enviado el formulario de vaciar la cesta
/*if (isset($_POST['vaciar'])) {
    unset($_SESSION['nuevosProductos']);
    unset($_SESSION['cesta']);
    $cesta = new CestaCompra();
}*/

// Comprobamos si se quiere añadir un producto a la cesta
/*if (isset($_POST['enviar'])) {
    $cesta->newArticulo($_POST['cod']);
    $cesta->saveCesta();
}*/

function creaFormularioProductos() {
    $productos = DB::getProductos();
    
    foreach ($productos as $p) {
      $codigo = $p->getcodigo();
       echo "<p><form id='" . $codigo . "' action='javascript:void(null);' onsubmit='cargarProducto(\"$codigo\");'>";
      // Metemos ocultos los datos de los productos
      echo "<input type='hidden' name='cod' value='" . $p->getcodigo() . "'/>";
      echo " <input type='submit' name='enviar' value='Añadir'/>";
      echo $p->getnombrecorto() . ": ";
      echo $p->getPVP() . " euros.";
      echo "</form>";
      echo "</p>";
    }
  }
  
  function muestraCestaCompra($cesta) {
    echo "<h3><img src='cesta.png' alt='Cesta' width='24' height='21'> Cesta</h3>";
    echo "<hr />";
    echo "<div id='contenido'>";
    $cesta->muestra();
    echo "</div>";
    echo "<form id='vaciar' action='javascript:void(null);' onsubmit='vaciarCesta();'>";
    echo "<input type='submit' id='btnvaciar' name='vaciar' value='Vaciar Cesta' ";
    if ($cesta->isVacia())
      echo "disabled='true'";
    echo "/></form>";
    echo "<form id='comprar' action='cesta.php' method='post'>";
    echo "<input type='submit' id='btncomprar' name='comprar' value='Comprar' ";
    if ($cesta->isVacia())
      echo "disabled='true'";
    echo "/></form>";
  }

// Obtenemos los datos necesarios
$usuario = Usuario::implicito();
$usuario->unserialize($_SESSION['usuario']);
$productos = DB::getProductos();
$productoscesta = $cesta->getProductos();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Desarrollo Web en Entorno Servidor -->
<!-- Tema 7 : Aplicaciones web dinámicas: PHP y JavaScript -->
<!-- Ejemplo Tienda Web: productos.php -->
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Productos de la tienda</title>
        <link href="../css/tienda.css" rel="stylesheet" type="text/css">
        <?php
        // Le indicamos a Xajax que incluya el código JavaScript necesario
        $xajax->printJavascript(); 
        ?>
        <script type="text/javascript" src="../clases/fcesta.js"></script>
    </head>

    <body class="pagproductos">
        <div id="contenedor">
            <div id="encabezado">
                <h1>Listado de productos</h1>
            </div>
        <div id="cesta"><?php muestraCestaCompra($cesta); ?></div>
        <div id="productos"><?php creaFormularioProductos(); ?></div>
        <br class="divisor" />
            <div id="pie">
                <form action='logoff.php' method='post'>
                   <!-- Aparece el nombre y los apellidos del usuario -->
                    <input type="submit" name="desconectar" value="Desconectar usuario <?= $usuario->getNombre() ?> <?= $usuario->getApellidos()?>"/>
                </form>
            </div>
        </div>
    </body>
</html>
