<?php

include "../../credenciales.php";


if (isset($_GET['nivel'])) {
    $nivel = $_GET['nivel'];

    if ($link->connect_error) {
        die("Conexión fallida: " . $link->connect_error);
    }

    if ($nivel === "todos") {
        $sql = "SELECT 
            p.idPregunta, 
            p.texto AS pregunta, 
            p.nivel, 
            r.idRespuesta, 
            r.texto AS respuesta, 
            r.correcto
            FROM preguntas p
            JOIN respuestas r ON p.idPregunta = r.idPregunta";
    } else {
        $sql = "SELECT 
            p.idPregunta, 
            p.texto AS pregunta, 
            p.nivel, 
            r.idRespuesta, 
            r.texto AS respuesta, 
            r.correcto
            FROM preguntas p
            JOIN respuestas r ON p.idPregunta = r.idPregunta
            WHERE p.nivel = $nivel";
    }
    

    $resultados = $link->query($sql);

    if ($resultados && $resultados->num_rows > 0) {
        $preguntas = [];

        // Procesar los resultados
        while ($row = $resultados->fetch_assoc()) {
            $preguntas[$row['idPregunta']]['texto'] = $row['pregunta'];
            $preguntas[$row['idPregunta']]['nivel'] = $row['nivel'];
            $preguntas[$row['idPregunta']]['respuestas'][] = [
                'idRespuesta' => $row['idRespuesta'],
                'texto' => $row['respuesta'],
                'correcto' => $row['correcto']
            ];
        }

        echo "<table class='tabla-preguntas' >
        <thead>
            <tr>
               <th>Dificultad</th>
                <th>Pregunta</th>
                <th>Rta Verdadera</th>
                <th>Rta Falsa</th>
                <th>Rta Falsa</th>
                <th>Rta Falsa</th>
                <th>Rta Falsa</th>
                <th>Borrar</th>
                <th>Editar</th>
            </tr>
             <tbody>";

        // Mostrar las preguntas y respuestas
        foreach ($preguntas as $idPregunta => $pregunta) {


       echo "<tr>";
            echo "<td style='text-align: center;'> {$pregunta['nivel']}</td> <td> {$pregunta['texto']} </td>";
  
            foreach ($pregunta['respuestas'] as $respuesta) {
                // $correcto = $respuesta['correcto'] ? " (Correcta)" : "";
                echo "<td>{$respuesta['texto']}</td>";
            }
            // Botón para eliminar la pregunta
     
            echo "<td><button onclick='eliminarPregunta(\"{$idPregunta}\", event)'style='background-color: red; color: black;' >Eliminar Pregunta</button></td>";

            echo "<td><button  onclick='editarPregunta(\"{$idPregunta}\", event)' style='background-color: yellow; color: black;' >Editar Pregunta</button></td>";

       

            
       echo "</tr>";
       echo "</tbody>";
        }
    } else {
        echo "No se encontraron preguntas de nivel $nivel.";
    }

    $link->close();
} else {
    echo "Error en la consulta";
}
?>
