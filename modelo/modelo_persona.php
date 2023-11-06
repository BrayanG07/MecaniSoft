<?php
    class Modelo_Persona {

        private $conexion;

        function __construct() {
            require_once 'modelo_conexion.php';
            
            $this->conexion = new Conexion();
            $this->conexion->conectar();
        }

        function listarPersona() {
            try {
                $sql = "call SP_LISTAR_PERSONA()"; 
                $arreglo = array();
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                        $arreglo["data"][] = $consultaVu;
                    }
                    return $arreglo;
                }        
            } catch (Exception $e) {
                echo "<h3>ModeloPersona::listarPersona() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function registrarPersona($nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumento,$sexo,$telefono) {
            try {
                $sql = "call SP_REGISTRAR_PERSONA('$nombre','$apellidoPaterno','$apellidoMaterno','$tipoDocumento','$numeroDocumento','$sexo','$telefono')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }        
            } catch (Exception $e) {
                echo "<h3>ModeloPersona::registrarPersona() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

        function editarPersona($id, $nombre, $apellidoPaterno, $apellidoMaterno,$tipoDocumento,$numeroDocumentoActual, $numeroDocumentoNuevo ,$sexo,$telefono, $estatus) {
            try {
                $sql = "call SP_EDITAR_PERSONA('$id','$nombre','$apellidoPaterno','$apellidoMaterno','$tipoDocumento','$numeroDocumentoActual', '$numeroDocumentoNuevo','$sexo','$telefono', '$estatus')"; 
                if ($consulta = $this->conexion->conexion->query($sql)) {
                    if ($row = mysqli_fetch_array($consulta)) {
                        return trim($row[0]); //trim = quita los espacios   
                    }
                }
            } catch (Exception $e) {
                echo "<h3>ModeloPersona::editarPersona() -> ".$e->getMessage()." </h3";
            } finally {
                $this->conexion->cerrar();
            }  
        }

        function updateStatePerson($idPerson, $estatus) {
            try {
                $sql = "call SP_EDITAR_ESTATUS_PERSONA('$idPerson','$estatus')"; 
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

        function crearCredencialesPersona($personaId, $username, $password) {
            try {
                $sql = "call SP_REGISTRAR_CREDENCIALES_PERSONA('$personaId', '$username', '$password')"; 
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); 
                }                
            }
            } catch (Exception $e) {
                echo "<h3>ModeloPersona::listarProducto() -> " . $e->getMessage() . " </h3";
            } finally {
                $this->conexion->cerrar();
            }
        }

    }
