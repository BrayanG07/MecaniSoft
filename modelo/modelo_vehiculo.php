<?php
    class ModeloVehiculo {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarVehiculo() {
            try {
                $sql = "call SP_LISTAR_VEHICULO()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloVehiculo::listarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function listCarByIdClient($idCliente) {
            try {
                $sql = "call SP_LISTAR_VEHICULO_POR_CLIENTE('$idCliente')"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloVehiculo::listCarByIdClient() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    
        function registrarVehiculo($placa, $anio, $transmicion, $combustible, $chasis, $motor, $observaciones, $imagen, $tipo, $modelo, $cliente) {
            $estado="ACTIVO";
            try {
                $sql = "call SP_REGISTRAR_VEHICULO('$placa','$anio','$transmicion','$combustible','$chasis','$motor','$observaciones','$imagen','$tipo','$estado','$modelo','$cliente')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloVehiculo::registrarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarVehiculo($idVehiculo, $placaN, $placaA, $anio, $transmicion, $combustible, $chasis, $motor, $observaciones, $tipo, $estado, $modelo, $cliente) {
            try {
                $sql = "call SP_EDITAR_VEHICULO('$idVehiculo','$placaN','$placaA','$anio','$transmicion','$combustible', '$chasis', '$motor', '$observaciones', '$tipo', '$estado', '$modelo', '$cliente')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloVehiculo::editarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

      

        function editarFotoVehiculo($id, $ruta) {
            try {
                $sql = "call SP_EDITAR_VEHICULO_FOTO('$id','$ruta')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]);
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloVehiculo::editarFotoProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>