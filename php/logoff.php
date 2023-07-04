<?php
    // Recuperamos la información de la sesión
    session_destroy();
    
    // Y la eliminamos
    unset($_SESSION['cesta']);
    unset($_SESSION['usuario']);
    header("Location: login.php");