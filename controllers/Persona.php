<?php 
require "../models/PersonaModel.php";

$option = $_REQUEST["op"];

if ($option == "listregistros") {
    echo "Mostrar el listado de personas";
}

if ($option == "registro") {
    echo "Registrar personas";
}

if ($option == "verregistro") {
    echo "Ver una personas";
}

if ($option == "actualizar") {
    echo "Actualizar una personas";
}

if ($option == "eliminar") {
    echo "Eliminar una personas";
}

die();
?>