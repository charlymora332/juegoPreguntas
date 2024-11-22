<?php

if (headers_sent($file, $line)) {
    die(json_encode(["status" => "error", "message" => "Las cabeceras ya se enviaron en el archivo $file en la línea $line."]));
}

// Mostrar errores para depuración
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Establecer cabeceras para JSON
header('Content-Type: application/json');

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

        // Respuesta JSON indicando éxito
        echo json_encode([
            "status" => "success",
            "message" => "Sesión iniciada correctamente",
            "data" => [
                "respuesta" => true, // Booleano en lugar de array
                "usuario" => $usuario, // Variable que contiene el nombre de usuario
            ]
        ]);
        
    } else {
        // Respuesta JSON indicando error
        echo json_encode([
        "status" => "error",  
        "message" => "Fallo al iniciar sesion",
        "data" => [
            "respuesta" => false, // Booleano en lugar de array
            "usuario" => 'null', // Variable que contiene el nombre de usuario
        ]
    ]);
    }

    $consulta->close();
    $link->close();
} else {
    echo json_encode(["status" => "error", "message" => "Metodo no permitido"]);
    exit();
}
