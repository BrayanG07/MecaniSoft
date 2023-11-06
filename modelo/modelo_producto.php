<?php
    class Modelo_Producto {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarProducto() {
            try {
                $sql = "call SP_LISTAR_PRODUCTO()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::listarProducto() -> ".$e->getMessage()." </h3";
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
                echo "<h3>ModeloProducto::listarComboCategoria() -> ".$e->getMessage()." </h3";
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
                echo "<h3>ModeloProducto::generarCodigo -> ".$e->getMessage()." </h3";
                
            } finally {
                $this->conexion->cerrar();
            }
        }

        function listarComboFabricante(){
            try {
                $sql = "call SP_LISTAR_COMBO_FABRICANTE()"; 
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

        function listarComboUnidad(){
            try {
                $sql = "call SP_LISTAR_COMBO_UNIDAD_MEDIDA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_array($consulta)) {
                        $arreglo[] = $consultaVu;
                    }

                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::listarComboUnidad() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarProducto($producto,$stockMinimo, $idCategoria,$idFabricante, $idUnidadMedida, $ruta, $precioCompra, $precio, $descripcion,$tipo,$codigo) {
            try {
                $sql = "call SP_REGISTRAR_PRODUCTO('$producto','$stockMinimo','$idCategoria','$idFabricante','$idUnidadMedida','$ruta','$precioCompra','$precio','$descripcion','$tipo','$codigo')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::registrarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarProducto($id, $producto, $idCategoria, $idUnidadMedida, $precio, $estatus, $descripcion, $precioCompra, $stockMinimo, $idFabricante) {
            try {
                $sql = "call SP_EDITAR_PRODUCTO('$id','$producto','$idCategoria','$idUnidadMedida','$precio', '$estatus', '$descripcion', '$precioCompra', '$stockMinimo', '$idFabricante')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::editarProducto() -> ".$e->getMessage()." </h3";
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
                echo "<h3>ModeloProducto::agregarOferta() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarFotoProducto($id, $ruta) {
            try {
                $sql = "call SP_EDITAR_PRODUCTO_FOTO('$id','$ruta')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProducto::editarFotoProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>