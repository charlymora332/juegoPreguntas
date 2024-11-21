<?php

include "../../credenciales.php";

// Verificamos si los parámetros existen en la URL
if (isset($_GET['id'], $_GET['preg'], $_GET['nivel'], $_GET['resp1'], $_GET['resp2'], $_GET['resp3'], $_GET['resp4'], $_GET['resp5'])) {
    // Recibimos los datos desde la URL
    $idPregunta = $_GET['id'];
    $pregunta = $_GET['preg'];
    $nivel = $_GET['nivel'];
    $respuesta1 = $_GET['resp1'];
    $respuesta2 = $_GET['resp2'];
    $respuesta3 = $_GET['resp3'];
    $respuesta4 = $_GET['resp4'];
    $respuesta5 = $_GET['resp5'];

    // Verificamos la conexión
    if ($link->connect_error) {
        die("Conexión fallida: " . $link->connect_error);
    }

    // Actualizamos la pregunta
    $sqlPregunta = "UPDATE preguntas SET texto = ?, nivel = ? WHERE idPregunta = ?";
    $stmtPregunta = $link->prepare($sqlPregunta);
    $stmtPregunta->bind_param("sii", $pregunta, $nivel, $idPregunta);

    if (!$stmtPregunta->execute()) {
        echo "Error al actualizar la pregunta: " . $stmtPregunta->error;
        exit();
    }

    // Obtener los IDs de las respuestas asociadas a la pregunta
    $sqlObtenerId = "SELECT idRespuesta FROM respuestas WHERE idPregunta = ? ORDER BY idRespuesta ASC";
    $stmtIds = $link->prepare($sqlObtenerId);
    $stmtIds->bind_param("i", $idPregunta);
    $stmtIds->execute();
    $result = $stmtIds->get_result();

    $ids = [];
    while ($row = $result->fetch_assoc()) {
        $ids[] = $row['idRespuesta']; // Agrega cada ID al array
    }

    if (count($ids) < 5) {
        echo "No se encontraron suficientes respuestas para actualizar.";
        exit();
    }

    // Actualizamos las respuestas asociadas
    $sqlRespuesta = "UPDATE respuestas SET texto = ? WHERE idRespuesta = ?";
    $stmtRespuesta = $link->prepare($sqlRespuesta);

    // Actualizar cada respuesta
    $respuestas = [$respuesta1, $respuesta2, $respuesta3, $respuesta4, $respuesta5];
    foreach ($respuestas as $index => $respuesta) {
        $idRespuesta = $ids[$index];
        $stmtRespuesta->bind_param("si", $respuesta, $idRespuesta);

        if (!$stmtRespuesta->execute()) {
            echo "Error al actualizar la respuesta " . ($index + 1) . ": " . $stmtRespuesta->error;
            exit();
        }
    }

    // Cerramos la conexión
    $stmtPregunta->close();
    $stmtRespuesta->close();
    $stmtIds->close();
    $link->close();

    echo "Pregunta y respuestas actualizadas correctamente.";
} else {
    echo "Faltan datos requeridos para realizar la actualización.";
}

?>
