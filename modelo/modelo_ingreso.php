<?php
    class Modelo_Ingreso {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarIngreso($fechaInicio, $fechaFin, $filtro) {
            try {
                $sql = "call SP_LISTAR_INGRESO('$fechaInicio', '$fechaFin', '$filtro')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::listarIngreso() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }
        
        function listarIngresoDetalleIngreso($idIngreso) {
            try {
                $sql = "call SP_LISTAR_DETALLE_NGRESO('$idIngreso')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::listarIngresoDetalleIngreso() -> " . $e->getMessage() . " </h3";
            } finally {
                $this->conexion->cerrar();
            }
            
        }

        function registrarIngreso($idProveedor,$idUsuario,$tipoComprobante,$serieComprobante,$numeroComprobante,$total,$impuesto,$porcentaje, $idAjuste, $accion) {
            try {
                $sql = "call SP_REGISTRAR_INGRESO('$idProveedor','$idUsuario','$tipoComprobante','$serieComprobante','$numeroComprobante','$total','$impuesto','$porcentaje',  '$idAjuste', '$accion')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::registrarIngreso() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarIngresoDetalle($idIngreso, $arrayProducto, $arrayCantidad, $arrayPrecio) {
            try {
                $sql = "call SP_REGISTRAR_INGRESO_DETALLE('$idIngreso','$arrayProducto','$arrayCantidad','$arrayPrecio')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1; //Ejecucion BIEN
                } else {
                    return 0; //Ejecucion MAL
                }
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::registrarIngresoDetalle() -> ".$e->getMessage()." </h3";
            }
        }

        function ultimoSerieComprobante() {
            try {
                $sql = "call SP_SERIE_COMPROBANTE_INGRESO()"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                } 
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::ultimoSerieComprobante() -> " . $e->getMessage() . " </h3";
            } finally {
                $this->conexion->cerrar();
            }
               
        }

        function ultimoNumeroComprobante() {
            try {
                $sql = "call SP_NUM_COMPROBANTE_INGRESO()";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                } 
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::ultimoNumeroComprobante() -> " . $e->getMessage() . " </h3";
            } finally {
                $this->conexion->cerrar();
            }
                   
        }

        function getInfoCompany() {
            try {
                $sql = "call SP_INFO_EMPRESA()";
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[8]);   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::getInfoCompany() -> " . $e->getMessage() . " </h3";
            } finally {
                $this->conexion->cerrar();
            }
            
        }

        function anularIngreso($idIngreso) {
            try {
                $sql = "call SP_ANULAR_INGRESO('$idIngreso')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1;
                } else {
                    return 0;
                }
                $this->conexion->cerrar();
            } catch (Exception $e) {
                echo "<h3>ModeloIngreso::anularIngreso() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function cerrarConexion(){
            $this->conexion->cerrar();
        }
    }
?>    
