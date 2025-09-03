<?php
require "../models/PersonaModel.php";

$option = $_REQUEST["op"];
$objPersona = new PersonaModel();

if ($option == "listregistros") {
    $arrResponse = array('status' => false, 'data' => "");
    $arrPersona = $objPersona->getPersonas();

    if (!empty($arrPersona)) {
        for ($i = 0; $i < count($arrPersona); $i++) {
            $idpersona = $arrPersona[$i]->idpersona;
            $options = '<a href="' . BASE_URL . 'views/persona/editar-persona.php?p=' . $idpersona . '" class="btn btn-outline-primary btn-sm" title="Eliminar registro"><i class="fa-solid fa-user-pen"></i></a>
                    <button class="btn btn-outline-danger btn-sm" title="Eliminar registro" onclick="fntDelPersona(' . $idpersona . ')"><i class="fa-solid fa-trash"></i></button>';
            $arrPersona[$i]->options = $options;
        }
        $arrResponse['status'] = true;
        $arrResponse['data'] = $arrPersona;
    }

    echo json_encode($arrResponse);

    die();
}

if ($option == "registro") {
    print_r($_POST);
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
