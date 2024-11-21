<?php

include "../../credenciales.php";

if (isset($_GET['idPregunta'])) {
    $idPregunta = intval($_GET['idPregunta']);

    if ($link->connect_error) {
        die("Conexión fallida: " . $link->connect_error);
    }

    $sql = "DELETE FROM preguntas WHERE idPregunta = $idPregunta";

    if ($link->query($sql) === TRUE) {
        echo "Respuesta eliminada con éxito.";
    } else {
        echo "Error al eliminar la respuesta: " . $link->error;
    }

    $link->close();
} else {
    echo "No se recibió ningún dato para eliminar.";
}
?>
