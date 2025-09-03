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
        $rs = $this->conexion->query("CALL select_personas()");
        $rs = $rs->fetch_fields();
        return $rs;
    }
}
