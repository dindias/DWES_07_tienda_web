<?php
spl_autoload_register(function ($clase) {
    include 'clases/' . $clase . 'php';
});

class CestaCompra {
   protected $productos  = array();
    
   function __construct(){
        $this->productos=array();
    }
   // Introduce un nuevo artículo en la cesta de la compra
    public function newArticulo($codigo) {
        $producto = DB::getProducto($codigo);
        $this->productos[] = $producto;
    }
    
    // Obtiene los artículos en la cesta
    public function getProductos() { 
        return $this->productos; 
    }
    
    // Obtiene el coste total de los artículos en la cesta
    public function getCoste() {
        $coste = 0;
        foreach ($this->productos as $p) {
            $coste += $p->getPVP();
        }
        return $coste;
    }
    
    // Devuelve true si la cesta está vacía
    public function isVacia() {
        if(count($this->productos) == 0) return true;
        return false;
    }
    
    // Guarda la cesta de la compra en la sesión del usuario
    public function saveCesta() { 
        $_SESSION['cesta'] = $this; 
    }
    
    // Recupera la cesta de la compra almacenada en la sesión del usuario
    public static function loadCesta() {
        if (!isset($_SESSION['cesta'])) {
            return new CestaCompra();
        } else {
            return $_SESSION['cesta'];
        }
    }

    public function vaciadoCesta() {
          //unset($this->productos );
          $this->productos=array();

    }

    // Muestra el HTML de la cesta de la compra, con todos los productos
    public function muestra() {
        // Si la cesta está vacía, mostramos un mensaje
        if (count($this->productos)==0)  print "<p>Cesta vacía</p>";
        //  y si no está vacía, mostramos su contenido
        else foreach ($this->productos as $producto) $producto->muestra();
     }
}