<?php
spl_autoload_register(function ($clase) {
    include '../clases/' . $clase . '.php';
});

// Comprobamos si ya se ha enviado el formulario
if (isset($_POST['enviar'])) {

    // Comprobamos las credenciales con la base de datos
    $usuario = Usuario::implicito();
    $usuario = DB::getUsuario($_POST['usuario'], $_POST['password']);
    if ($usuario != null) {

        $_SESSION['usuario'] = $usuario->serialize($usuario);

        header("Location: productos.php");
    } else {
        // Si las credenciales no son válidas, se vuelven a pedir y se muestra un mensaje de error
        $mensaje = "Usuario o contraseña no válidos!";
    }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Desarrollo Web en Entorno Servidor -->
<!-- Tema 7 : Aplicaciones web dinámicas: PHP y JavaScript -->
<!-- Ejemplo Tienda Web: login.php -->
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Login Tienda</title>
        <link href="../css/tienda.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div id='login'>
            <form action='login.php' method='post'>
                <fieldset style="height: 200px;">
                    <legend>Login</legend>
                    <div><span class='error'><?= $mensaje ?></span></div>
                    <div class='campo'>
                        <label for='usuario' >Usuario:</label><br/>
                        <!-- Utilizamos HTML 5 para que todos los campos de entrada sean obligatorios -->
                        <input type='text' name='usuario' id='usuario' maxlength="50" required="true" /><br/>
                    </div>
                    <div class='campo'>
                        <label for='password' >Contraseña:</label><br/>
                        <input type='password' name='password' id='password' maxlength="50" required="true" /><br/>
                    </div>

                    <div class='campo'>
                        <input type='submit' name='enviar' value='Enviar' />
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>
