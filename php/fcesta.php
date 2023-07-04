<?php
require_once '../libs/xajax_core/xajax.inc.php';
spl_autoload_register(function ($clase) {
    include '../clases/' . $clase . '.php';
});
session_start();

// Crear una instancia de xajax
$xajax = new xajax();

// Registrar las funciones de xajax
$xajax->register(XAJAX_FUNCTION,"cargarCesta");
$xajax->register(XAJAX_FUNCTION,"vaciarCesta");

$xajax->configure('javascript URI','../clases/');

// El método processRequest procesa las peticiones que llegan a la página
// Debe ser llamado antes del código HTML
$xajax->processRequest();


function cargarCesta($codigo){ 
  $respuesta = new xajaxResponse();
  $cesta = CestaCompra::loadCesta();
  $item = DB::getProducto($codigo);
  $productos[] = $item;
  $_SESSION['productosNuevos'] = $productos;
  foreach ($productos as $producto) {
      $cesta->newArticulo($producto->getCodigo());
  }
  if ($cesta->isVacia()) {
      $respuesta->clear("contenido", "innerHTML");
  } 

  // Agregar nuevos productos a la vista
  foreach ($productos as $producto) {
      $respuesta->append("contenido", "innerHTML", "<p>" .$producto->getCodigo() . "</p>");
  }

  $respuesta->assign("btncomprar", "disabled", false);
  $respuesta->assign("btnvaciar", "disabled", false);
  $respuesta->setReturnValue($cesta);
  return $respuesta;
}
  
function vaciarCesta() {

    $respuesta = new xajaxResponse();
    unset($_SESSION['cesta']);
    $cesta = new CestaCompra();
    //$_SESSION["cesta"]=$cesta;
    //$_SESSION["cesta"]->vaciadoCesta();
    $cesta->vaciadoCesta();
    $_SESSION['vaciado_xajax'] = true;
    $respuesta->setReturnValue($cesta);
    $respuesta->assign("contenido", "innerHTML", '');
    $respuesta->assign("btncomprar", "disabled", true);
    $respuesta->assign("btnvaciar", "disabled", true);
    return $respuesta;
}