<?php
    class Modelo_Proveedor {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarProveedor() {
            try {
                $sql = "call SP_LISTAR_PROVEEDOR()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }

                    return $arreglo;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProveedor::listarProducto() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarProveedor($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono, $razonSocial, $nombreContacto, $numeroContacto, $correo) {
            try {
                $sql = "call SP_REGISTRAR_PROVEEDOR('$nombre','$apellidoPaterno','$apellidoMaterno','$tipoDocumento','$numeroDocumento','$sexo','$telefono','$razonSocial','$nombreContacto','$numeroContacto', '$correo')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProveedor::registrarProveedor() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarEstatusProveedor($idProveedor, $estatus) {
            try {
                $sql = "call SP_EDITAR_ESTATUS_PROVEEDOR('$idProveedor','$estatus')"; 
                if ($this->conexion->conexion->query($sql)) {
                    return 1;                
                }else {
                    return 0;
                }
            } catch (Exception $e) {
                echo "<h3>ModeloProveedor::editarEstatusProveedor() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function editarProveedor($idProveedor, $razonSocial, $nombreContacto,$numeroContacto, $nombre, $apellidoPaterno, $apellidoMaterno,$correo,$numeroDocumento, $telefono, $tipoDocumento,$genero, $idPersona) {
            try {
                $sql = "call SP_EDITAR_PROVEEDOR('$idProveedor','$razonSocial','$nombreContacto','$numeroContacto', '$nombre', '$apellidoPaterno', '$apellidoMaterno','$correo','$numeroDocumento', '$telefono', '$tipoDocumento','$genero', '$idPersona')"; 
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