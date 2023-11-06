<?php
class ModeloTarea
{

    private $conexion;

    function __construct()
    {
        require_once 'modelo_conexion.php';

        $this->conexion = new Conexion();
        $this->conexion->conectar();
    }

    function listarTareas($idUsuario)
    {
        try {
            $sql = "call SP_LISTAR_TAREAS('$idUsuario')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloTarea::listarTareas() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listOrderByClient()
    {
        try {
            $sql = "call SP_LISTAR_ORDEN_CLIENTE()";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }

                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloTarea::listOrderByClient() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function listServicesByClient($idTransaccion)
    {
        try {
            $sql = "call SP_LISTAR_SERVICES_CLIENTE('$idTransaccion')";
            $arreglo = array();
            if ($consulta = $this->conexion->conexion->query($sql)) {
                while ($consultaVu = mysqli_fetch_array($consulta)) {
                    $arreglo[] = $consultaVu;
                }
                return $arreglo;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloTarea::listServicesByClient() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function saveTask($work, $start, $end, $notas)
    {
        $sql = "call SP_REGISTRAR_TAREAS('$work', '$start', '$end', '$notas')";
        if ($this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();
    }

    function updateDateSelected($idTarea, $start, $end)
    {
        try {
            $sql = "call SP_EDITAR_TAREA('$idTarea','$start','$end')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloTarea::updateDateSelected() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function updatetask($idTarea, $description, $state, $idUsuario)
    {
        try {
            $sql = "call SP_EDITAR_TAREA_IND('$idTarea','$description','$state', '$idUsuario')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloTarea::updatetask() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }

    function deleteTask($idDetailTra)
    {
        try {
            $sql = "call SP_ELIMINAR_TAREA('$idDetailTra')";
            if ($this->conexion->conexion->query($sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            echo "<h3>ModeloProducto::deleteTask() -> " . $e->getMessage() . " </h3";
        } finally {
            $this->conexion->cerrar();
        }
    }
}
