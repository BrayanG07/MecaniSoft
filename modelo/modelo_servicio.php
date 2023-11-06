<?php
    class Modelo_Servicio {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarServicio() {
            try {
                $sql = "call SP_LISTAR_SERVICIO()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloServicio::listarServicio() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function listarComboCategoria(){
            try {
                $sql = "call SP_LISTAR_COMBO_CATEGORIA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_array($consulta)) {
                        $arreglo[] = $consultaVu;
                    }
    
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloServicio::listarComboCategoria() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function generarCodigo(){
            try {
                $sql = "call SP_GENERARCODIGO_PRODUCTO()"; 
                $mostrar=array();
                
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_array($consulta)) {
                        $mostrar[] = $consultaVu;
                    }
                        
                    return $mostrar;    
                }
            } catch (Exception $e) {
                echo "<h3>ModeloServicio::generarCodigo -> ".$e->getMessage()." </h3";
                
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarServicio($servicio, $idCategoria, $ruta, $precio, $descripcion,$tipo,$codigo) {
            try {
                $sql = "call SP_REGISTRAR_SERVICIO('$servicio','$idCategoria','$ruta','$precio','$descripcion','$tipo','$codigo')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloServicio::registrarServicio() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarServicio($id, $servicio, $idCategoria, $precio,$estatus, $descripcion) {
            try {
                $sql = "call SP_EDITAR_SERVICIO('$id','$servicio','$idCategoria','$precio', '$estatus', '$descripcion')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloServicio::editarServicio() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function agregarOferta($oferta, $descuento, $idProducto) {
            try {
                $sql = "call SP_AGREGAR_OFERTA('$oferta','$descuento', '$idProducto')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1;
                }else {
                    return 2;
                }
            } catch (Exception $e) {
                echo "<h3>ModelServicio::agregarOferta() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarFotoServicio($id, $ruta) {
            try {
                $sql = "call SP_EDITAR_PRODUCTO_FOTO('$id','$ruta')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::editarFotoServicio() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>