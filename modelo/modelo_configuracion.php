<?php
    class Modelo_Configuracion {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarConfiguracion() {
            try {
                $sql = "call SP_LISTAR_CONFIGURACION()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloConfiguracion::listarConfiguracion() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }


        function registrarConfiguracion($nombre,$direccion,$telefono,$celular,$rtn,$correo,$ruta,$isv,$cai,$fecha
                                        ,$cantidadFacturas,$numeroInicial,$numeroFinal,$dolar) {
            try {
                $sql = "call SP_REGISTRAR_CONFIGURACION('$nombre','$direccion','$telefono','$celular','$rtn','$correo','$ruta','$isv','$cai','$fecha',
                                                        '$cantidadFacturas','$numeroInicial','$numeroFinal','$dolar')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloConfiguracion::registrarConfiguracion() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarConfiguracion($id, $nombre,$direccion,$telefono,$celular,$rtn,$correo,$isv,$cai,$fecha
                                    ,$cantidadFacturas,$numeroInicial,$numeroFinal,$dolar) {
            try {
                $sql = "call SP_EDITAR_CONFIGURACION('$id','$nombre','$direccion','$telefono','$celular','$rtn','$correo','$isv','$cai','$fecha',
                                                    '$cantidadFacturas','$numeroInicial','$numeroFinal','$dolar')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloConfiguracion::editarConfiguracion() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

     

        function editarFotoConfiguracion($id, $ruta) {
            try {
                $sql = "call SP_EDITAR_CONFIGURACION_FOTO('$id','$ruta')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloConfiguracion::editarFotoConfiguracion() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>