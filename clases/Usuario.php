<?php

class Usuario implements Serializable {
    private $usuario;
    private $password;
    private $nombre;
    private $apellidos;
    
    /*
     * Una de las desventajas en PHP es que no permite los métodos sobrecargados y evidentemente los constructores. Pero hay una forma 
     * elegante de simularlo con métodos static y el operador self().
     * En esta tarea quiero crear el objeto usuario de dos formas diferentes: una sin parámetros y la otra forma pasando todos sus datos. 
     * Esto en Java, C++ , C# es fácil haces dos constructores, pero en PHP5 eso no está permitido. Y la manera de simularlo es con métodos 
     * static que me retornen el objeto. Como se puede observar en el código anterior el constructor es private lo que significa que no puedo 
     * acceder a el cuando creo el objeto.
     */
    static function implicito(){
        return new self(NULL, NULL, NULL, NULL);
    }
    
    static function explicito($usuario, $password, $nombre, $apellidos) {
        return new self($usuario, $password, $nombre, $apellidos);
    }


    private function __construct($usuario, $password, $nombre, $apellidos) {
        $this->usuario = $usuario;
        $this->password = $password;
        $this->nombre = $nombre;
        $this->apellidos = $apellidos;
    }
    
    function getUsuario() {
        return $this->usuario;
    }

    function getPassword() {
        return $this->password;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getApellidos() {
        return $this->apellidos;
    }

    /*
     * Función que devuelve los el valor de los atributos serializados.
     * Esto es útil para el almacenamiento de valores en PHP sin perder su tipo y estructura.
     */

    public function serialize() {
        return serialize([$this->usuario, $this->password, $this->nombre, $this->apellidos]);
    }

    /*
     * Crea un valor PHP a partir de una representación almacenada, es decir, crea un objeto de la clase
     */

    public function unserialize($serialized) {
        list(
                $this->usuario,
                $this->password,
                $this->nombre,
                $this->apellidos
            ) = unserialize($serialized);
    }

}