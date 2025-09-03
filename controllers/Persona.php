<?php
require "../models/PersonaModel.php";

$option = $_REQUEST["op"];
$objPersona = new PersonaModel();

if ($option == "listregistros") {
    $arrResponse = array('status' => false, 'data' => "");
    $arrPersona = $objPersona->getPersonas();

    if (!empty($arrPersona)) {
        $arrResponse['status'] = true;
        $arrResponse['data'] = $arrPersona;
    }

    echo json_encode($arrResponse);

    die();
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
