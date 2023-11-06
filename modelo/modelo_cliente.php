<?php
    class Modelo_Cliente {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarCliente() {
            try {
                $sql = "call SP_LISTAR_CLIENTE()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCliente::listarCliente() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarCliente($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono, $correo, $empresa) {
            try {
                $sql = "call SP_REGISTRAR_CLIENTE('$nombre','$apellidoPaterno','$apellidoMaterno','$tipoDocumento','$numeroDocumento','$sexo','$telefono', '$correo', '$empresa')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCliente::registrarCliente() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarEstatusCliente($idCliente, $estatus) {
            try {
                $sql = "call SP_EDITAR_ESTATUS_CLIENTE('$idCliente','$estatus')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1;                
                }else {
                    return 0;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloCliente::editarEstatusCliente() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }   
        }

        function editarCliente($nombre, $apellidoPaterno, $apellidoMaterno,$correo,$numeroDocumento, $telefono, $tipoDocumento,$genero, $idPersona, $empresa) {
            try {
                $sql = "call SP_EDITAR_CLIENTE('$nombre', '$apellidoPaterno', '$apellidoMaterno','$correo','$numeroDocumento', '$telefono', '$tipoDocumento','$genero', '$idPersona', '$empresa')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); 
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProveedor::editarProveedor() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
?>