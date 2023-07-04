<?php

spl_autoload_register(function ($clase) {
    include '../clases/' . $clase . '.php';
});

// Recuperamos la información de la sesión
session_start();

// Y comprobamos que el usuario se haya autentificado
if (!isset($_SESSION['usuario'])) {
    die("Error - debe <a href='login.php'>identificarse</a>.<br />");
}

// Recuperamos la cesta de la compra
$cesta = CestaCompra::loadCesta();

// Obtenemos los datos necesarios
// Construimos el objeto usuario a través del método implicito ya que queremos un objeto vacío
$usuario = Usuario::implicito();
// Cargamos el objeto con lo que nos viene en la sesión, paso previo por unserializarlo
$usuario->unserialize($_SESSION['usuario']);
$productoscesta = $cesta->getProductos();
print_r($productoscesta);
$coste = $cesta->getCoste();
echo $coste;

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Desarrollo Web en Entorno Servidor -->
<!-- Tema 7 : Aplicaciones web dinámicas: PHP y JavaScript -->
<!-- Ejemplo Tienda Web: cesta.php -->
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>Cesta de la compra</title>
  <link href="../css/tienda.css" rel="stylesheet" type="text/css">
</head>

<body class="pagcesta">

<div id="contenedor">
  <div id="encabezado">
    <h1>Cesta de la compra</h1>
  </div>
  <div id="productos">
<?php
    
      foreach ($productoscesta as $producto){
        echo "<p>";
            echo "<span class='codigo'>" . $producto->getCodigo() . "</span>";
            echo "<span class='nombre'>" . $producto->getNombreCorto() . "</span>";
            $precio = sprintf("%6.2f", $producto->getPVP());
            echo "<span class='precio'>$precio</span>";
        echo "</p>";
        
      }
      $precioFinal = sprintf("%7.2f", $coste);
?>
    <hr />
    <p><span class='pagar'>Precio total: <?= $precioFinal ?> €</span></p>
    <form action='pagar.php' method='post'>
        <p><span class='pagar'>
            <input type='submit' name='pagar' value='Pagar'/>
        </span></p>
    </form>
  </div>
  <br class="divisor" />
  <div id="pie">
    <form action='logoff.php' method='post'>
        <input type='submit' name='desconectar' value='Desconectar usuario <?= $usuario->getNombre() ?> <?= $usuario->getApellidos() ?>'/>
    </form>        
  </div>
</div>
</body>
</html>
