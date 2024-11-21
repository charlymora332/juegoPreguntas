<?php
// Incluir credenciales y conexión a la base de datos
include "../credenciales.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos enviados por POST
    $usuario = $_POST['user'] ?? '';
    $contrasena = $_POST['pass'] ?? '';

    // Evitar inyección SQL (usar consultas preparadas)
    $consulta = $link->prepare("SELECT * FROM usuarios WHERE username = ? AND password = ?");
    $consulta->bind_param("ss", $usuario, $contrasena); // 'ss' indica dos strings
    $consulta->execute();

    // Obtener los resultados
    $resultado = $consulta->get_result();

    if ($resultado->num_rows > 0) {
        // Si hay resultados, significa que el usuario existe
        echo "Inicio de sesión exitoso.";
    } else {
        // Si no hay resultados, credenciales incorrectas
        echo "Usuario o contraseña incorrectos.";
    }

    // Cerrar la conexión
    $consulta->close();
    $link->close();
} else {
    echo "Método no permitido.";
}
?>
