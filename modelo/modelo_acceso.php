<?php
class ModeloAcceso
{

    private $conexion;

    function __construct()
    {
        require_once 'modelo_conexion.php';

        $this->conexion = new Conexion();
        $this->conexion->conectar();
    }

    function listarAccesoUsuario($idUsuario)
    {

        $sql = "call SP_LISTAR_ACCESOS_USUARIO('$idUsuario')";

        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consultaVu;
            }

            return $arreglo;
        }
        $this->conexion->cerrar();
    }

    function actualizarPassword($id, $passwordNuevo, $temporal)
    {
        $sql = "call SP_ACTUALIZAR_PASSWORD_USUARIO('$id', '$passwordNuevo', '$temporal')";
        if ($this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();
    }

    function listarAccesoActivosUsuario($idUsuario)
    {
        $sql = "call SP_LISTAR_ACCESOS_ACTIVOS_USUARIO('$idUsuario')";

        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                // $arreglo["data"][] = $consultaVu;
                $arreglo[] = $consultaVu['modulo_codigo'];
            }

            return $arreglo;
        }
    }



    function listarAccesoUsuarioNoTiene($idUsuario)
    {
        try {
            $sql = "call SP_LISTAR_ACCESOS_USUARIO_NO_TIENE('$idUsuario')";

            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloAcceso::listarAccesoUsuarioNoTiene() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function registrarAcceso($usuario, $modulo)
    {
        $sql = "call SP_REGISTRAR_ACCESO('$usuario', '$modulo')";
        if ($this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
    }


    function eliminarAcceso($usuario, $modulo)
    {
        try {
            $sql = "call SP_ELIMINAR_ACCESO('$usuario', '$modulo')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); //trim = quita los espacios   
                }
                $this->conexion->cerrar();
            }
        } catch (Exception $e) {
            echo "<h3>ModeloAcceso::registrarAcceso() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function editarAcceso($usuario, $modulo)
    {
        try {
            $sql = "call SP_EDITAR_ACCESO('$usuario', '$modulo')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); //trim = quita los espacios   
                }
                $this->conexion->cerrar();
            }
        } catch (Exception $e) {
            echo "<h3>ModeloAcceso::registrarAcceso() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function cerrarConexion(){
        $this->conexion->cerrar();
    }
}
