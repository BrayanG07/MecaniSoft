<?php
    class ModeloCotizacion {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarCotizacion($fechaInicio, $fechaFin) {
            try {
                $sql = "call SP_LISTAR_COTIZACION('$fechaInicio', '$fechaFin')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
    
                    return $arreglo;
                }                
            } catch (Exception $e) {
                echo "<h3>ModeloCotizacion::listarVenta() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

             function listarDetalleOrden($id) {
            try {
                $sql = "call SP_LISTAR_DETALLE_COTIZACION('$id')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
    
                    return $arreglo;
                }                
            } catch (Exception $e) {
                echo "<h3>ModeloVenta::listarDetalleOrden() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarCotizacion($idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones) {
            $sql = "call SP_REGISTRAR_COTIZACION('$idCliente','$idUsuario','$total','$impuesto','$porcentaje', '$descuento', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function editarCotizacion($idCotizacion, $idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones) {
            $sql = "call SP_EDITAR_COTIZACION('$idCotizacion','$idCliente','$idUsuario','$total','$impuesto','$porcentaje', '$descuento', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function eliminarDetalleCotizacion($idcotizacion) {
            $sql = "call SP_ELIMINAR_DETALLE('$idcotizacion')"; 
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function registrarDetalleCotizacion($idcotizacion, $arrayProducto, $arrayCantidad, $arrayPrecio,$arrayDescuento) {
            $sql = "call SP_REGISTRAR_DETALLE_COTIZACION('$idcotizacion','$arrayProducto','$arrayCantidad','$arrayPrecio', '$arrayDescuento')"; 
            if ($this->conexion->conexion->query($sql)) {
                return 1; 
            } else {
                return 0; 
            }
            // $this->conexion->cerrar();
        }

        function ultimoSerieComprobante() {
            try {
                $sql = "call SP_SERIE_COMPROBANTE_VENTA()"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCotizacion::ultimoSerieComprobante() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function ultimoNumeroComprobante() {
            try {
                $sql = "call SP_NUM_COMPROBANTE_VENTA()";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);   
                    }
                }                
            } catch (Exception $e) {
                echo "<h3>ModeloCotizacion::ultimoNumeroComprobante() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function anularVenta($idVenta) {
            try {
                $sql = "call SP_ANULAR_VENTA('$idVenta')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1;
                } else {
                    return 0;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCotizacion::anularVenta() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function cerrarConexion(){
            $this->conexion->cerrar();
        }
    }
