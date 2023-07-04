<?php

class Producto {
    protected $codigo;
    protected $nombre;
    protected $nombre_corto;
    protected $PVP;
    
    public function __construct($row) {
        $this->codigo = $row['cod'];
        $this->nombre = $row['nombre'];
        $this->nombre_corto = $row['nombre_corto'];
        $this->PVP = $row['PVP'];
    }
    
    public function getCodigo() {
        return $this->codigo; 
        
    }
    
    public function getNombre() {
        return $this->nombre; 
        
    }
    
    public function getNombreCorto() {
        return $this->nombre_corto; 
        
    }
    
    public function getPVP() {
        return $this->PVP; 
        
    }
     
    public function muestra() {
        print "<p>" . $this->codigo . "</p>";
    }
}