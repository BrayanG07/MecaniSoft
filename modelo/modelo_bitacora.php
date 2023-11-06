<?php
    class ModeloBitacora {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function registrarBitacora($idUsuario, $accion, $tabla, $descripcion, $ip_publica) {
            try {
                $sql = "call SP_REGISTRAR_BITACORA('$idUsuario', '$accion', '$tabla', '$descripcion', '$ip_publica')";
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

        function registrarBitacoraAcceso($idUsuario, $accion, $tabla, $descripcion, $ip_publica) {
            $sql = "call SP_REGISTRAR_BITACORA_ACCESO('$idUsuario', '$accion', '$tabla', '$descripcion', '$ip_publica')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        }

         function listarBitacora($fechaInicio, $fechaFin) {
            try {
                $sql = "call SP_LISTAR_BITACORA('$fechaInicio', '$fechaFin')"; 
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

        function cerrarConexion(){
            $this->conexion->cerrar();
        }
    }
