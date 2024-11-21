<?php

include "../../credenciales.php";




// Verificamos si los parámetros existen en la URL
if (isset($_GET['preg'],$_GET['nivel'], $_GET['resp1'], $_GET['resp2'], $_GET['resp3'], $_GET['resp4'], $_GET['resp5'])) {
    // Recibimos los datos desde la URL
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


    

    // Insertamos los datos en la base de datos
    $sql = "INSERT INTO preguntas (texto,  nivel) VALUES ('$pregunta', '$nivel')";

    if ($link->query($sql) === TRUE) {


        $idPregunta = $link->insert_id;
        $sql_rta = "INSERT INTO respuestas (idPregunta, texto, correcto) VALUES 
        ('$idPregunta', '$respuesta1', " . ( 1) . "),
        ('$idPregunta', '$respuesta2', " . ( 0) . "),
        ('$idPregunta', '$respuesta3', " . ( 0) . "),
        ('$idPregunta', '$respuesta4', " . ( 0) . "),
        ('$idPregunta', '$respuesta5', " . ( 0) . ")";
             // Ejecutar las consultas de inserción
             if ($link->query($sql_rta) === TRUE) {
                // Confirmar la transacción    
                $link->commit();
                echo " </br> Pregunta y respuestas insertadas correctamente.";
            } else {
                echo "rta no guardada exitosamente";
                throw new Exception("Error al insertar respuestas: " . $link->error);
            }
            // echo "<script>mostrarAlerta('Pregunta y respuestas insertadas correctamente.');</script>";
        
    } else {
        echo "Error al guardar la pregunta: " . $link->error;
    }

 




    // Cerramos la conexión
    $link->close();
} else {
    echo "Faltan datos";
}
?>
