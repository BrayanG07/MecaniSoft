<?php
    class ModeloModelo {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarModelo() {
            try {
                $sql = "call SP_LISTAR_MODELO()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }

                    return $arreglo;
                }   
            } catch (Exception $e) {
                echo "<h3>ModeloModelo::listarModelo() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        
        function registrarModelo($idUsuarioLog, $nombre, $descripcion, $estado, $idMarca) {
            try {
                $sql = "call SP_REGISTRAR_MODELO('$idUsuarioLog', '$nombre', '$descripcion', '$estado', ' $idMarca')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloModelo::registrarModelo() -> ".$e->getMessage()."</h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function modificarModelo($idUsuarioLog, $idModelo, $nombreActual, $nombreNuevo, $estado, $descripcion, $idMarca) {
            try {
                // $sql = "call SP_EDITAR_MARCA('$idUsuarioLog', '$idMarca', '$nombreActual', '$nombreNuevo', '$estado', $descripcion)";
                $sql = "call SP_EDITAR_MODELO('$idUsuarioLog', '$idModelo', '$nombreActual', '$nombreNuevo', '$estado', '$descripcion', '$idMarca')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloModelo::modificarModelo() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }



         function listarComboModeloMarca($id){
            try {
                $sql = "call SP_LISTAR_COMBO_MODELO_MARCA('$id')"; 
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
