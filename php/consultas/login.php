<?php

if (headers_sent($file, $line)) {
    die("Las cabeceras ya se enviaron en el archivo $file en la línea $line.");
}


// Mostrar errores para depuración
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Incluir credenciales y conexión a la base de datos
include "../credenciales.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['user'] ?? '';
    $contrasena = $_POST['pass'] ?? '';

    $consulta = $link->prepare("SELECT * FROM usuarios WHERE username = ? AND password = ?");
    $consulta->bind_param("ss", $usuario, $contrasena);
    $consulta->execute();

    $resultado = $consulta->get_result();

    if ($resultado->num_rows > 0) {
        session_start();
        $_SESSION['usuario'] = $usuario;

        // Cabeceras para evitar problemas de caché
        // header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
        // header("Pragma: no-cache");
        // header("Expires: 0");

        // Redirigir al dashboard
        if (headers_sent()) {
            die("Error: Ya se enviaron cabeceras. No se puede redirigir.");
            echo"nnnnnnnnnnnnnnooooooooooooooooo";
        }
        header("Location: ../../html/admin/adminDashboard.html");
        exit();
        

    } else {
        // Mostrar error
        echo "<h3 style='color: red;'>Credenciales inválidas</h3>";
        exit();
    }

    $consulta->close();
    $link->close();
} else {
    echo "Método no permitido.";
    exit();
}
