<?php
// Conectar a la base de datos
include "../../credenciales.php";

// Verificar si la conexión fue exitosa
if ($link->connect_error) {
    die("Conexión fallida: " . $link->connect_error);
}

// Obtener el id de la pregunta desde la solicitud GET
$id = isset($_GET['idPregunta']) ? $_GET['idPregunta'] : 0;

// Consulta SQL para obtener la pregunta y sus respuestas
$sql = "
    SELECT 
        p.idPregunta, 
        p.texto AS pregunta, 
        p.nivel, 
        r.idRespuesta, 
        r.texto AS respuesta
    FROM 
        preguntas p
    JOIN 
        respuestas r ON p.idPregunta = r.idPregunta
    WHERE 
        p.idPregunta = $id;
";

// Ejecutar la consulta
$resultado = $link->query($sql);

// Verificar si la consulta devuelve resultados
if ($resultado->num_rows > 0) {
    $pregunta = [];
    while($fila = $resultado->fetch_assoc()) {
        // Organizar los datos de la pregunta y respuestas
        $pregunta['idPregunta'] = $fila['idPregunta'];
        $pregunta['texto'] = $fila['pregunta'];
        $pregunta['nivel'] = $fila['nivel'];

        // Inicializar el array de respuestas
        if (!isset($pregunta['respuestas'])) {
            $pregunta['respuestas'] = [];
        }

        // Añadir cada respuesta al array de respuestas
        $pregunta['respuestas'][] = [
            'idRespuesta' => $fila['idRespuesta'],
            'texto' => $fila['respuesta']
        ];
    }

    // Establecer el encabezado de la respuesta como JSON
    header('Content-Type: application/json');
    echo json_encode($pregunta); // Enviar los datos en formato JSON
} else {
    // Si no hay resultados, responder con un mensaje de error
    echo json_encode(['error' => 'Pregunta no encontrada']);
}

// Cerrar la conexión a la base de datos
$link->close();
?>
