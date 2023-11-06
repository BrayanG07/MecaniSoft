<?php
class Modelo_Usuario
{

    private $conexion;

    function __construct()
    {
        require_once 'modelo_conexion.php';

        $this->conexion = new Conexion();
        $this->conexion->conectar();
    }

    function verificarUsuario($usuario, $password)
    {
        try {
            $sql = "call SP_VERIFICAR_USUARIO('$usuario')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    if (password_verify($password, $consultaVu["usuario_password"])) {
                        $arreglo[] = $consultaVu; //Llenamos el arreglo con el arreglo de datos que provienen de la BD
                    }
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloUsuario::verificarUsuario() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listarUsuarios()
    {
        try {
            $sql = "call SP_LISTAR_USUARIO()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }
                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloUsuario::listarUsuarios() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listUserByMechanic()
    {
        try {
            $sql = "call SP_LISTAR_USUARIO_MECANICO()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo["data"][] = $consultaVu;
                }

                return $arreglo;
                $this->conexion->cerrar();
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::listUserByMechanic() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listarComboPersona()
    {
        try {
            $sql = "call SP_LISTAR_COMBO_PERSONA()"; //INVOCANDO AL STORE PROCEDURE(PROCEDIMIENTO ALMACENADO)
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::listarComboPersona() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listarComboRol()
    {
        try {
            $sql = "call SP_LISTAR_COMBO_ROL()"; //INVOCANDO AL STORE PROCEDURE(PROCEDIMIENTO ALMACENADO)
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::listarComboRol() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function registrarUsuario($usuario, $password, $email, $idRol, $ruta, $nombre, $apellidoPaterno, $apellidoMaterno, $tipoDocumento, $numeroDocumento, $genero, $telefono)
    {
        try {
            $sql = "call SP_REGISTRAR_USUARIO('$usuario','$password','$email','$idRol','$ruta', '$nombre', '$apellidoPaterno', '$apellidoMaterno', '$tipoDocumento', '$numeroDocumento', '$genero', '$telefono')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloUsuario::registrarUsuario() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function editarUsuario($id, $idPersona, $idRol, $estatus)
    {
        try {
            $sql = "call SP_EDITAR_USUARIO('$id','$idPersona','$idRol','$estatus')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::editarUsuario() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function editarFoto($id, $ruta)
    {
        try {
            $sql = "call SP_EDITAR_USUARIO_FOTO('$id','$ruta')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::editarFoto() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function obtenerDatosUsuario($id)
    {
        try {

            $sql = "call SP_OBTENER_DATOS_USUARIO('$id')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::obtenerDatosUsuario() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function actualizarDatosProfile($id, $nombre, $apellidoPaterno, $apellidoMaterno, $tipoDocumento, $numeroDocumento, $sexo, $telefono, $correo)
    {
        try {
            $sql = "call SP_ACTUALIZAR_DATOS_PERSONA_PROFILE('$id','$nombre','$apellidoPaterno','$apellidoMaterno','$tipoDocumento','$numeroDocumento','$sexo','$telefono', '$correo')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]); //trim = quita los espacios   
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::listarProducto() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function editarPassword($id, $passwordNuevo, $temporal)
    {
        try {
            $sql = "call SP_ACTUALIZAR_PASSWORD_USUARIO('$id', '$passwordNuevo', '$temporal')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::listarProducto() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function obtenerDatosWidget($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_OBTENER_DATOS_WIDGET('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::obtenerDatosWidget() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function getTop10ProductosMasVendidos($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP_10_VENTAS('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::getTop10ProductosMasVendidos() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function getTop10ServiciosSolicitados($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP_10_SERVICIOS_SOLICITADOS('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::getTop10ServiciosSolicitados() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function obtenerTop10Ingresos($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP_10_INGRESOS('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::obtenerTop10Ingresos() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function getTop10ProductoMenosVendidos($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP10_PRODUCTOS_MENOS_VENDIDOS('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::getTop10ProductoMenosVendidos() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function getTop10ProductosMenosIngresados($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP10_PRODUCTOS_MENOS_INGRESADOS('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::getTop10ProductosMenosIngresados() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function getTop10ServiciosMenosSolicitados($fechaInicio, $fechaFin)
    {
        try {
            $sql = "call SP_TOP10_SERVICIOS_MENOS_SOLIC('$fechaInicio', '$fechaFin')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::getTop10ServiciosMenosSolicitados() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function obtenerMesesMasVentas()
    {
        try {
            $sql = "call SP_MESES_MAS_VENTAS()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::obtenerMesesMasVentas() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function existsUsernameAndPassword($username, $email)
    {
        try {
            $sql = "call SP_VERIFICAR_INFOUSUARIO('$username','$email')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                if ($row = mysqli_fetch_array($consulta)) {
                    return trim($row[0]);
                }
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::existsUsernameAndPassword() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function addNotifications()
    {
        try {
            $sql = "call SP_LISTAR_NOTIFICACIONES()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consultaVu;
                }
                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::addNotifications() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }
}
