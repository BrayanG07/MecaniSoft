<?php
class Modelo_Venta
{

    private $conexion;

    function __construct()
    {
        require_once 'modelo_conexion.php';

        $this->conexion = new Conexion();
        $this->conexion->conectar();
    }

    function listarVenta($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_LISTAR_VENTA('$fechaInicio', '$fechaFin')";
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

    function listarDetalleVenta($idVenta)
    {
        try {
            $sql = "call SP_LISTAR_DETALLE_VENTA('$idVenta')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::listarDetalleVenta() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function registrarVenta($idCliente, $idUsuario, $tipoComprobante, $serieComprobante, $numeroComprobante, $total, $impuesto, $porcentaje, $descuento, $dineroCliente)
    {
        try {
            $sql = "call SP_REGISTRAR_VENTA('$idCliente','$idUsuario','$tipoComprobante','$serieComprobante','$numeroComprobante','$total','$impuesto','$porcentaje', '$descuento', '$dineroCliente')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::listarDetalleVenta() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    //-----------********
    function registrarDetalleVenta($idVenta, $arrayProducto, $arrayCantidad, $arrayPrecio, $arrayDescuento)
    {
        $sql = "call SP_REGISTRAR_DETALLE_VENTA('$idVenta','$arrayProducto','$arrayCantidad','$arrayPrecio', '$arrayDescuento')";
        if ($this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        // $this->conexion->cerrar();
    }

    function lastInvoiceNumber()
    {
        try {
            $sql = "call SP_ULTIMO_NUM_FACTURA()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($row = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $row;
                }
                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::lastInvoiceNumber() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function maximumInvoiceNumber()
    {
        try {
            $sql = "call SP_NUMERO_FINAL_FACTURA()";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::maximumInvoiceNumber() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function anularVenta($idVenta)
    {
        try {
            $sql = "call SP_ANULAR_VENTA('$idVenta')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloVenta::anularVenta() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function cerrarConexion(){
        $this->conexion->cerrar();
    }
}
