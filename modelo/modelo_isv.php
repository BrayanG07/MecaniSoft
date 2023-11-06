<?php
    class Modelo_ISV {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarImpuesto() {
            try {
                $sql = "call SP_LISTAR_IMPUESTO()"; 
                // $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($row = mysqli_fetch_assoc($consulta)) {
                        return $row['conf_isv'];
                    }
    
                    return -1;
                }        
            } catch (Exception $e) {
                echo "<h3>ModeloRol::listarRol() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>