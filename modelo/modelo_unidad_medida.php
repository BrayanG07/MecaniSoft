<?php
    class Modelo_Unidad_Medida {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarUnidadMedida() {
            try {
                $sql = "call SP_LISTAR_UNIDAD_MEDIDA()";
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
    
                    return $arreglo;
                }                
            } catch (Exception $e) {
                echo "<h3>ModeloUnidadMedida::listarUnidadMedida() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarUnidadMedida($unidad, $abreviatura) {
            try {
                $sql = "call SP_REGISTRAR_UNIDAD_MEDIDA('$unidad','$abreviatura')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloUnidadMedida::listarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function modificarUnidadMedida($id, $unidadActual, $unidadNueva, $abreviatura, $estatus) {
            try {
                $sql = "call SP_EDITAR_UNIDAD_MEDIDA('$id','$unidadActual','$unidadNueva', '$abreviatura','$estatus')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloUnidadMedida::listarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
