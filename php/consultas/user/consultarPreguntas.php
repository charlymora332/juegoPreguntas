<?php
include "../../credenciales.php";

// Configuración de cabecera para JSON
header('Content-Type: application/json');

// Verificar que el parámetro 'nivel' esté presente
if (isset($_GET['nivel'])) {
    $nivel = intval($_GET['nivel']); // Convertir a entero para seguridad

    // Verificar conexión a la base de datos
    if ($link->connect_error) {
        echo json_encode([
            "status" => "error",
            "message" => "Conexión fallida: " . $link->connect_error
        ]);
        exit();
    }

    // Consulta con JOIN para obtener preguntas y respuestas
    $sql = "
        SELECT 
            p.idPregunta, 
            p.texto AS pregunta, 
            p.nivel, 
            r.idRespuesta, 
            r.texto AS respuesta, 
            r.correcto
        FROM preguntas p
        JOIN respuestas r ON p.idPregunta = r.idPregunta
        WHERE p.nivel = ?
        ORDER BY RAND()";
    $stmt = $link->prepare($sql);
    $stmt->bind_param("i", $nivel);

    if (!$stmt->execute()) {
        echo json_encode([
            "status" => "error",
            "message" => "Error en la consulta: " . $stmt->error
        ]);
        exit();
    }

    $result = $stmt->get_result();
    $preguntas = [];

    // Procesar resultados y organizar en un array estructurado
    while ($row = $result->fetch_assoc()) {
        $idPregunta = $row['idPregunta'];

        // Crear una entrada para la pregunta si aún no existe
        if (!isset($preguntas[$idPregunta])) {
            $preguntas[$idPregunta] = [
                "idPregunta" => $idPregunta,
                "pregunta" => $row['pregunta'],
                "nivel" => $row['nivel'],
                "respuestas" => []
            ];
        }

        // Agregar la respuesta a la pregunta actual
        $preguntas[$idPregunta]['respuestas'][] = [
            "idRespuesta" => $row['idRespuesta'],
            "texto" => $row['respuesta'],
            "correcto" => $row['correcto'] == 1 // Convertir a booleano
        ];
    }

    // Reordenar aleatoriamente las respuestas de cada pregunta
    foreach ($preguntas as &$pregunta) {
        shuffle($pregunta['respuestas']);
    }

    // Responder con JSON
    echo json_encode([
        "status" => "success",
        "preguntas" => array_values($preguntas) // Reindexar array para JSON limpio
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Faltan parámetros requeridos (nivel)."
    ]);
}
?>
