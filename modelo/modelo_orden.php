<?php
    class ModeloOrden {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarOrden($fechaInicio, $fechaFin) {
            try {
                $sql = "call SP_LISTAR_ORDEN('$fechaInicio', '$fechaFin')"; 
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

         function listarDetalleOrdenId($id) {
            try {
                $sql = "call SP_LISTAR_ID_DETALLE_ORDEN('$id')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        array_push($arreglo,$consultaVu['detalletransaccion_id']);
                    }
    
                    return $arreglo;
                }                
            } catch (Exception $e) {
                echo "<h3>ModeloVenta::listarDetalleOrden() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarOrden($idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones) {
            $sql = "call SP_REGISTRAR_ORDEN_TRABAJO('$idCliente','$idUsuario','$total','$impuesto','$porcentaje', '$descuento', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function anularOrden($idOrden) {
            $sql = "call SP_ANULAR_ORDEN('$idOrden')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }


        function registrarDetalleOrden($transaccion, $vehiculo, $combustible, $kilometraje, $mecanico, $observaciones) {
            $sql = "call SP_REGISTRAR_DETALLE_ORDEN('$transaccion','$vehiculo','$combustible','$kilometraje','$mecanico', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function editarDetalleOrden($transaccion, $vehiculo, $combustible, $kilometraje, $mecanico, $observaciones) {
            $sql = "call SP_EDITAR_DETALLE_ORDEN('$transaccion','$vehiculo','$combustible','$kilometraje','$mecanico', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function editarOrden($idCotizacion, $idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones) {
            $sql = "call SP_EDITAR_ORDEN_TRABAJO('$idCotizacion','$idCliente','$idUsuario','$total','$impuesto','$porcentaje', '$descuento', '$observaciones')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function eliminarDetalleProSerOrden($idOrden) {
            $sql = "call SP_ELIMINAR_DETALLE_ORDEN('$idOrden')"; 
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            }else {
                return 0;
            }
            // $this->conexion->cerrar();
        }

        function registrarDetalleServProducOrdenTrabajo($idOrden, $arrayProducto, $arrayCantidad, $arrayPrecio,$arrayDescuento) {
            $sql = "call SP_REGISTRAR_DETALLE_PRO_SER_ORDEN('$idOrden','$arrayProducto','$arrayCantidad','$arrayPrecio', '$arrayDescuento')"; 
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

         function numTareasPorHacer($IdOrden) {
            $sql = "call SP_COMP_ORDEN_FINALIZADA('$IdOrden')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }


         function hayTareaDetalle($IdOrden) {
            $sql = "call SP_COMP_DET_ORDEN_ELIM('$IdOrden')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function facturar($idOrden,$cantPago,$numFac,$serieFac) {
            $sql = "call SP_FACTURAR_ORDEN('$idOrden','$cantPago','$numFac','$serieFac')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }
            }else {
                return 0;
            }
            $this->conexion->cerrar();
        }

        function cerrarConexion(){
            $this->conexion->cerrar();
        }
       

    }
