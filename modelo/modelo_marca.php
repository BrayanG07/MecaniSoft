<?php
    class ModeloMarca {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarMarca() {
            try {
                $sql = "call SP_LISTAR_MARCA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }

                    return $arreglo;
                }   
            } catch (Exception $e) {
                echo "<h3>ModeloMarca::listarMarca() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarMarca($idUsuarioLog, $nombre, $descripcion, $estado) {
            try {
                $sql = "call SP_REGISTRAR_MARCA('$idUsuarioLog', '$nombre', '$descripcion', '$estado')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloMarca::registrarMarca() -> ".$e->getMessage()."</h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function modificarMarca($idUsuarioLog, $idMarca, $nombreActual, $nombreNuevo, $estado, $descripcion) {
            try {
                $sql = "call SP_EDITAR_MARCA('$idUsuarioLog', '$idMarca', '$nombreActual', '$nombreNuevo', '$estado', '$descripcion')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);    
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloMarca::modificarMarca() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function listarComboMarca(){
            try {
                $sql = "call SP_LISTAR_COMBO_MARCA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_array($consulta)) {
                        $arreglo[] = $consultaVu;
                    }
    
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::listarComboCategoria() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
