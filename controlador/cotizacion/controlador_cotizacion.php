<?php
    require '../../modelo/modelo_cotizacion.php';
    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();


    $MV = new ModeloCotizacion();
    $MV2 = new ModeloCotizacion();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    switch ($opcion) {
        case 'listar':
            $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
            $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listarCotizacion($fechaInicio, $fechaFin);
            
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
        case 'listarDetalleCotizacion':
            $id = htmlspecialchars($_POST['idCotizacion'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listarDetalleOrden($id);
            
            if ($consulta) {
                echo json_encode($consulta);    
                // echo ($consulta);    
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
                $consulta = $MV->ultimoSerieComprobante();

                if ($consulta == null) {
                    $consulta = 0;
                }

                $serieComprobante = $consulta + 1;
                $resultado = str_pad($serieComprobante, 7, "0", STR_PAD_LEFT);
                echo $resultado;
                break;
            case 'numeroComprobante':
                $consulta = $MV->ultimoNumeroComprobante();
                if ($consulta == null) {
                    $consulta = 0;
                }

                $numeroComprobante = $consulta + 1;
                $resultado = str_pad($numeroComprobante, 7, "0", STR_PAD_LEFT);
                echo $resultado;
                break;

            case 'registrarCotizacion':
                $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');        
                $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
                $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
                $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
                $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');        
                $observaciones = htmlspecialchars($_POST['observaciones'], ENT_QUOTES, 'UTF-8');        

                $consulta = $MV->registrarCotizacion($idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones);
                
                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "cotizacion", "Se registro una nueva cotizacion()", $_SESSION["S_IPPUBLICA"]);
                }
                
                echo $consulta;
                break;

            case 'registrarDetalleCotizacion':

                $idCotizacion = htmlspecialchars($_POST['idCotizacion'], ENT_QUOTES, 'UTF-8');        
                $producto = htmlspecialchars($_POST['producto'], ENT_QUOTES, 'UTF-8');        
                $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');        
                $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');               
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');               

                //Convertir los datos a arreglo con explode()
                $arrayProducto = explode(",", $producto);
                $arrayCantidad = explode(",", $cantidad);
                $arrayPrecio = explode(",", $precio);
                $arrayDescuento = explode(",", $descuento);


                 $con = $MV->eliminarDetalleCotizacion($idCotizacion); 
                
                
                // sleep(1);

                for ($i=0; $i < sizeof($arrayProducto) ; $i++) { 
                    $consulta = $MV2->registrarDetalleCotizacion($idCotizacion, $arrayProducto[$i], $arrayCantidad[$i], $arrayPrecio[$i],$arrayDescuento[$i]);    
                }

                $MV2->cerrarConexion();


                echo $consulta;
                break;


                case 'editarCotizacion':

                $idCotizacion = htmlspecialchars($_POST['idCotizacion'], ENT_QUOTES, 'UTF-8');        
                $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');        
                $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
                $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
                $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
                $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');        
                $observaciones = htmlspecialchars($_POST['observaciones'], ENT_QUOTES, 'UTF-8');        

                 $consulta = $MV->editarCotizacion($idCotizacion, $idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones);
                 
                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "cotizacion", "Se edito una cotizacion($idCotizacion)", $_SESSION["S_IPPUBLICA"]);
                }
                 
                 echo $consulta;

                // echo 1;
                break;



            case 'anular':
                $idVenta = htmlspecialchars($_POST['idVenta'], ENT_QUOTES, 'UTF-8');        
            
                $consulta = $MV->anularVenta($idVenta);
                echo $consulta;
                break;
        default:
            # code...
            break;
    }
