<?php
    class Modelo_Categoria {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarCategoria() {
            try {
                $sql = "call SP_LISTAR_CATEGORIA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }

                    return $arreglo;
                }   
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::listarCategoria() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarCategoria($categoria) {
            try {
                $sql = "call SP_REGISTRAR_CATEGORIA('$categoria')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::registrarCategoria() -> ".$e->getMessage()."</h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function modificarCategoria($id, $categoriaActual, $categoriaNueva, $estatus) {
            try {
                $sql = "call SP_EDITAR_CATEGORIA('$id','$categoriaActual','$categoriaNueva','$estatus')";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCategoria::modificarCategoria() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
