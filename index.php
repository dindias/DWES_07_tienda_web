<?php
/*
 * Muchos desarrolladores que escriben aplicaciones orientadas a objetos crean un fichero fuente de PHP para cada definición de clase. 
 * Una de las mayores molestias es tener que hacer una larga lista de inclusiones al comienzo de cada script (uno por cada clase).
 * En PHP 5 esto ya no es necesario. La función spl_autoload_register() registra cualquier número de autocargadores, posibilitando que las 
 * clases e interfaces sean cargadas automáticamente si no están definidas actualmente. Al registrar autocargadores, a PHP se le da una última 
 * oportunidad de cargar las clases o interfaces antes de que falle por un error.
 */
spl_autoload_register(function ($clase) {
    include 'clases/' . $clase . '.php';
});


if (isset($_POST['iniciar'])) {

    $opc = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
    // Cargamos variables auxiliares con lo que ha introducido el usuario
    $servidor = $_POST['servidor'];
    $baseDatos = $_POST['bd'];
    $dns = "mysql:host=" . $_POST['servidor'] . ";dbname=" . $_POST['bd'];
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['password'];
    // Comprueba que los datos introducidos son válidos para realizar la conexión a la base de datos
    try {
        $dwes = new PDO($dns, $usuario, $contrasena, $opc);
        // Almacenamos los valores en un objeto de la clase Configuracion
        $config = new Configuracion();
        $config->setServidor($_POST['servidor']);
        $config->setBaseDatos($_POST['bd']);
        $config->setUsuario($_POST['usuario']);
        $config->setPassword($_POST['password']);
        session_start();
        // Guarda en la sesión un objeto de la clase Configuracion
        $_SESSION['configura'] = $config->serialize($config);

        header("Location: php/login.php");
    } catch (PDOException $e) {
        $error = "Datos erróneos de conexión";
    }
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Desarrollo Web en Entorno Servidor -->
<!-- Tema 7 : Aplicaciones web dinámicas: PHP y JavaScript -->
<!-- Ejemplo Tienda Web: index.php -->
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Configuración</title>
        <link href="css/tienda.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div id='login'>
            <form action='index.php' method='post'>
                <fieldset style="height: 270px;">
                    <legend>Configuración inicial</legend>
                    <div><span class='error'><?php echo $error; ?></span></div>
                    <div class='campo'>
                        <label for='servidor' >Servidor:</label><br/>
                        <!-- Utilizamos HTML 5 para que todos los campos de entrada sean obligatorios -->
                        <input type='text' name='servidor' id='servidor' maxlength="50" required="true" /><br/>
                    </div>
                    <div class='campo'>
                        <label for='bd' >Base de datos:</label><br/>
                        <input type='text' name='bd' id='bd' maxlength="50" required="true" /><br/>
                    </div>
                    <div class='campo'>
                        <label for='usuario' >Usuario:</label><br/>
                        <input type='text' name='usuario' id='usuario' maxlength="50" required="true" /><br/>
                    </div>
                    <div class='campo'>
                        <label for='password' >Password:</label><br/>
                        <input type='password' name='password' id='password' maxlength="50" /><br/>
                    </div>

                    <div class='campo'>
                        <input type='submit' name='iniciar' value='Iniciar' />
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>