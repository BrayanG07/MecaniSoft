<?php
    class Modelo_Rol {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarRol() {
            try {
                $sql = "call SP_LISTAR_ROL()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
    
                    return $arreglo;
                }        
            } catch (Exception $e) {
                echo "<h3>ModeloRol::listarRol() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarRol($rol) {
            try {
                $sql = "call SP_REGISTRAR_ROL('$rol')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                    $this->conexion->cerrar();
                }
            } catch (Exception $e) {
                echo "<h3>ModeloRol::registrarRol() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
            
        }

        function modificarRol($id, $rolActual, $rolNuevo, $estatus) {
            try {
                $sql = "call SP_EDITAR_ROL('$id','$rolActual','$rolNuevo','$estatus')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloRol::modificarRol() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>