<?php
    class ModeloFabricante {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarFabricante() {
            try {
                $sql = "call SP_LISTAR_FABRICANTE()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }

                    return $arreglo;
                }   
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::listarFabricante() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarFabricante($fabricante, $descripcion) {
            try {
                $sql = "call SP_REGISTRAR_FABRICANTE('$fabricante', '$descripcion')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::registrarFabricante() -> ".$e->getMessage()."</h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function modificarFabricante($id, $fabricanteActual, $fabricanteNuevo, $estatus, $descripcion) {
            try {
                $sql = "call SP_EDITAR_FABRICANTE('$id','$fabricanteActual','$fabricanteNuevo','$estatus', '$descripcion')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);    
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::modificarFabricante() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }
    }
