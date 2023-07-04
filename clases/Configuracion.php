<?php

/*
 * El objeto de esta clase guardará los datos necesarios para realizar la conexión a la base de datos del servidor
 */

class Configuracion implements Serializable {

    private $servidor;
    private $baseDatos;
    private $usuario;
    private $password;

    function getServidor() {
        return $this->servidor;
    }

    function getBaseDatos() {
        return $this->baseDatos;
    }

    function getUsuario() {
        return $this->usuario;
    }

    function getPassword() {
        return $this->password;
    }

    function setServidor($servidor) {
        $this->servidor = $servidor;
    }

    function setBaseDatos($baseDatos) {
        $this->baseDatos = $baseDatos;
    }

    function setUsuario($usuario) {
        $this->usuario = $usuario;
    }

    function setPassword($password) {
        $this->password = $password;
    }

    /*
     * Función que devuelve los el valor de los atributos serializados.
     * Esto es útil para el almacenamiento de valores en PHP sin perder su tipo y estructura.
     */

    public function serialize() {
        return serialize([$this->servidor, $this->baseDatos, $this->usuario, $this->password]);
    }

    /*
     * Crea un valor PHP a partir de una representación almacenada, es decir, crea un objeto de la clase
     */

    public function unserialize($serialized) {
        list(
                $this->servidor,
                $this->baseDatos,
                $this->usuario,
                $this->password
                ) = unserialize($serialized);
    }

}
