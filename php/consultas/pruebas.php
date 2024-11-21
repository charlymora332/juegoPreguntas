<?php

include "../credenciales.php";

// Verificar la versión de PHP
echo 'Versión de PHP: ' . phpversion();

// Definir el nivel deseado
$nivel = 1;

// Verificar la conexión
if ($link->connect_error) {
    die("Conexión fallida: " . $link->connect_error);
}

// Consulta SQL corregida
$sql = "SELECT 
    p.idPregunta, 
    p.texto AS pregunta, 
    p.nivel, 
    r.idRespuesta, 
    r.texto AS respuesta, 
    r.correcto
    FROM preguntas p
    JOIN respuestas r ON p.idPregunta = r.idPregunta
    WHERE p.nivel = $nivel;";

$resultados = $link->query($sql);

// Verificar si hay resultados
if ($resultados && $resultados->num_rows > 0) {
    $preguntas = [];

    // Procesar los resultados
    while ($row = $resultados->fetch_assoc()) {
        if (!isset($preguntas[$row['idPregunta']])) {
            $preguntas[$row['idPregunta']] = [
                'texto' => $row['pregunta'],
                'nivel' => $row['nivel'],
                'respuestas' => []
            ];
        }
        $preguntas[$row['idPregunta']]['respuestas'][] = [
            'idRespuesta' => $row['idRespuesta'],
            'texto' => $row['respuesta'],
            'correcto' => $row['correcto']
        ];
    }

    // Mostrar las preguntas y respuestas
    foreach ($preguntas as $idPregunta => $pregunta) {
        echo "<h3>Pregunta: {$pregunta['texto']} (Nivel: {$pregunta['nivel']})</h3>";
        echo "<ul>";
        foreach ($pregunta['respuestas'] as $respuesta) {
            $correcto = $respuesta['correcto'] ? " (Correcta)" : "";
            echo "<li>{$respuesta['texto']}{$correcto}</li>";
        }
        echo "</ul>";
    }
} else {
    echo "No se encontraron preguntas de nivel $nivel.";
}

// Cerramos la conexión
$link->close();
?>
