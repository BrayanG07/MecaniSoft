<?php
    require '../../modelo/modelo_ingreso.php';

    $MI = new Modelo_Ingreso();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";

    switch ($opcion) {
        case 'listar':
            $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
            $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
            $filtro = htmlspecialchars($_POST['filtro'], ENT_QUOTES, 'UTF-8');
            $consulta = $MI->listarIngreso($fechaInicio, $fechaFin, $filtro);
            
            if ($consulta) {
                echo json_encode($consulta);    
            } else {    
                echo '{
                    "sEcho": 1, 
                    "iTotalRecords": "0", 
                    "ITotalDisplayRecords": "0", 
                    "aaData": [] 
                }';
            }
            break;
        case 'listarDetalleIngreso':
            $idIngreso = htmlspecialchars($_POST['idIngreso'], ENT_QUOTES, 'UTF-8');
            $consulta = $MI->listarIngresoDetalleIngreso($idIngreso);
            
            if ($consulta) {
                echo json_encode($consulta);    
            } else {    
                echo '{
                    "sEcho": 1, 
                    "iTotalRecords": "0", 
                    "ITotalDisplayRecords": "0", 
                    "aaData": [] 
                }';
            }
            break;
        case 'serieComprobante':
            $consulta = $MI->ultimoSerieComprobante();
            if ($consulta == null) {
                $consulta = 0;
            }

            $serieComprobante = $consulta + 1;
            $resultado = str_pad($serieComprobante, 7, "0", STR_PAD_LEFT);
            echo $resultado;
            break;
        case 'numeroComprobante':
            $consulta = $MI->ultimoNumeroComprobante();
            if ($consulta == null) {
                $consulta = 0;
            }

            $numeroComprobante = $consulta + 1;
            $resultado = str_pad($numeroComprobante, 7, "0", STR_PAD_LEFT);
            echo $resultado;
            break;
        case 'isv':
            $consulta = $MI->getInfoCompany();
            if ($consulta == null) {
                $consulta = 'error';
            }
            echo $consulta;
            break;
        case 'registrarIngreso':
            $idProveedor = htmlspecialchars($_POST['idProveedor'], ENT_QUOTES, 'UTF-8');        
            $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
            $tipoComprobante = htmlspecialchars($_POST['tipoComprobante'], ENT_QUOTES, 'UTF-8');        
            $serieComprobante = htmlspecialchars(trim($_POST['serieComprobante']), ENT_QUOTES, 'UTF-8');        
            $numeroComprobante = htmlspecialchars(trim($_POST['numeroComprobante']), ENT_QUOTES, 'UTF-8');        
            $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
            $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
            $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
            $idAjuste = htmlspecialchars($_POST['idAjuste'], ENT_QUOTES, 'UTF-8');        
            $accion = htmlspecialchars($_POST['accion'], ENT_QUOTES, 'UTF-8');        

            $consulta = $MI->registrarIngreso($idProveedor,$idUsuario,$tipoComprobante,$serieComprobante,$numeroComprobante,$total,$impuesto,$porcentaje, $idAjuste, $accion);
            echo $consulta;//Retornaremos 0 - 1, es lo que contendra la variable consulta
            break;
        case 'registrarDetalleIngreso':
            $idIngreso = htmlspecialchars($_POST['idIngreso'], ENT_QUOTES, 'UTF-8');        
            $producto = htmlspecialchars($_POST['producto'], ENT_QUOTES, 'UTF-8');        
            $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');        
            $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');               

            //Convertir los datos a arreglo con explode()
            $arrayProducto = explode(",", $producto);
            $arrayCantidad = explode(",", $cantidad);
            $arrayPrecio = explode(",", $precio);
            for ($i=0; $i < sizeof($arrayProducto) ; $i++) { 
                $consulta = $MI->registrarIngresoDetalle($idIngreso, $arrayProducto[$i], $arrayCantidad[$i], $arrayPrecio[$i]);    
            }

            $MI->cerrarConexion();
    
            echo $consulta;
            break;
        case 'anular':
            $idIngreso = htmlspecialchars($_POST['idIngreso'], ENT_QUOTES, 'UTF-8');        
            
            $consulta = $MI->anularIngreso($idIngreso);
            echo $consulta;
            break;
        
        default:
            # code...
            break;
    }


?>