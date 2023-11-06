<?php
class ModeloMovimiento
{

    private $conexion;

    function __construct()
    {
        require_once 'modelo_conexion.php';

        $this->conexion = new Conexion();
        $this->conexion->conectar();
    }

    function listarMovimiento($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_LISTAR_MOVIMIENTO('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::listarVenta() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listarDetalleMovimiento($idTransaccion)
    {
        try {
            $sql = "call SP_LISTAR_DETALLE_MOVIMIENTO('$idTransaccion')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::listarDetalleMovimiento() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function registrarMovimiento($motivo, $idUsuario)
    {
        try {
            $sql = "call SP_REGISTRAR_MOVIMIENTO('$motivo','$idUsuario')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloIngreso::registrarMovimiento() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function deleteDetailMovement($idTransaccion)
    {
        try {
            $sql = "call SP_ELIMINAR_MOVIMIENTO('$idTransaccion')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloIngreso::deleteDetailMovement() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function registrarDetalleMovimiento($idMovimiento, $arrayProducto, $arrayCantidad)
    {
        $sql = "call SP_REGISTRAR_DETALLE_MOVIMIENTO('$idMovimiento','$arrayProducto','$arrayCantidad')";
        if ($this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        //$this->conexion->cerrar();
    }

    function updateMovement($motivo, $idUsuario, $idTransaccion)
    {
        try {
            $sql = "call SP_EDITAR_MOVIMIENTO('$motivo','$idUsuario', '$idTransaccion')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloIngreso::listarProducto() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function anularMovimiento($idTransaccion)
    {
        try {
            $sql = "call SP_ANULAR_MOVIMIENTO('$idTransaccion')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloMovimiento::anularMovimiento() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function cerrarConexion()
    {
        $this->conexion->cerrar();
    }
}
