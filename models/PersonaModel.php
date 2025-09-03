<?php
require_once "../libraries/conexion.php";
class PersonaModel
{
    private $conexion;
    function __construct()
    {
        $this->conexion = new Conexion();
        $this->conexion = $this->conexion->connect();
    }
    public function getPersonas()
    {
        $arrRegistros = array();
        $rs = $this->conexion->query("CALL select_personas()");

        while ($obj = $rs->fetch_object()) {
            array_push($arrRegistros, $obj);
        }

        return $arrRegistros;
    }

    public function insertPersona(string $nombre, string $apellido, int $telefono, string $email)
    {
        $sql = $this->conexion->query("CALL insert_persona('{$nombre}','{$apellido}','{$telefono}','{$email}')");
        $sql = $sql->fetch_object();
        return $sql;
    }
}
