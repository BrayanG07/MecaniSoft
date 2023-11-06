<?php
    require '../../modelo/modelo_orden.php';

    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();

    $MV = new ModeloOrden();
    $MV2 = new ModeloOrden();
    $MV3 = new ModeloOrden();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    switch ($opcion) {
        case 'listar':
            $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
            $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listarOrden($fechaInicio, $fechaFin);
            
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

        case 'listarDetalleOrden':
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

            case 'registrarOrden':
                $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');        
                $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
                $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
                $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
                $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');        
                $observaciones = '';        
                
                $idMecanico = htmlspecialchars($_POST['idMecanico'], ENT_QUOTES, 'UTF-8');        
                $kilometraje = htmlspecialchars($_POST['kilometraje'], ENT_QUOTES, 'UTF-8');        
                $combustible = htmlspecialchars($_POST['combustible'], ENT_QUOTES, 'UTF-8');                
                $idVehiculo = htmlspecialchars($_POST['idVehiculo'], ENT_QUOTES, 'UTF-8');                

                $consulta = $MV->registrarOrden($idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones);
                
                if($consulta > 0){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "Orden", "Se registro una nueva orden", $_SESSION["S_IPPUBLICA"]);
                }
            
                    echo $consulta;
                
                break;

            case 'registrarDetalleOrden':

                 $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
                 $idMecanico = htmlspecialchars($_POST['idMecanico'], ENT_QUOTES, 'UTF-8');        
                $kilometraje = htmlspecialchars($_POST['kilometraje'], ENT_QUOTES, 'UTF-8');        
                $combustible = htmlspecialchars($_POST['combustible'], ENT_QUOTES, 'UTF-8');                
                $idVehiculo = htmlspecialchars($_POST['idVehiculo'], ENT_QUOTES, 'UTF-8');     
                $observaciones = htmlspecialchars($_POST['observaciones'], ENT_QUOTES, 'UTF-8');      
           
                  
                 $consulta = $MV->registrarDetalleOrden($idOrden, $idVehiculo, $combustible, $kilometraje, $idMecanico, $observaciones);

                 echo $consulta;

                break;    

            case 'registrarDetalleProducto':

                $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
                $producto = htmlspecialchars($_POST['producto'], ENT_QUOTES, 'UTF-8');        
                $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');        
                $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');               
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');               

                //Convertir los datos a arreglo con explode()
                $arrayProducto = explode(",", $producto);
                $arrayCantidad = explode(",", $cantidad);
                $arrayPrecio = explode(",", $precio);
                $arrayDescuento = explode(",", $descuento);


                  
                $con = $MV2->listarDetalleOrdenId($idOrden); 

                // echo ($con[0]);
                for ($i=0; $i < sizeof($con) ; $i++) { 
                    //   echo $con[$i] . ' ';
                    $ere = $MV3->eliminarDetalleProSerOrden($con[$i]);  

                }
                $MV3->cerrarConexion();
                
                // echo $ere;
                
                // sleep(2);

                for ($i=0; $i < sizeof($arrayProducto) ; $i++) { 
                    
                    // $con = $MV->eliminarDetalleProSerOrden($idOrden); 
                     $consulta = $MV->registrarDetalleServProducOrdenTrabajo($idOrden, $arrayProducto[$i], $arrayCantidad[$i], $arrayPrecio[$i],$arrayDescuento[$i]);    
                }
                $MV->cerrarConexion();

                echo $consulta;
                break;


                case 'editarOrden':

                $idCotizacion = htmlspecialchars($_POST['idCotizacion'], ENT_QUOTES, 'UTF-8');        
                $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');        
                $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
                $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
                $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
                $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
                $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');          
                
                $idMecanico = htmlspecialchars($_POST['idMecanico'], ENT_QUOTES, 'UTF-8');        
                $kilometraje = htmlspecialchars($_POST['kilometraje'], ENT_QUOTES, 'UTF-8');        
                $combustible = htmlspecialchars($_POST['combustible'], ENT_QUOTES, 'UTF-8');                
                $idVehiculo = htmlspecialchars($_POST['idVehiculo'], ENT_QUOTES, 'UTF-8');    
                $observaciones = htmlspecialchars($_POST['observaciones'], ENT_QUOTES, 'UTF-8');        

                 $consulta = $MV->editarOrden($idCotizacion, $idCliente,$idUsuario,$total,$impuesto,$porcentaje,$descuento, $observaciones);
                
                 if($consulta >0 ){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Editar", "Orden", "Se edito una  orden($idCotizacion)", $_SESSION["S_IPPUBLICA"]);
                }

                 echo $consulta;

                // echo 1;
                break;

                 case 'editarDetalleOrden':
                 $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
                 $idMecanico = htmlspecialchars($_POST['idMecanico'], ENT_QUOTES, 'UTF-8');        
                $kilometraje = htmlspecialchars($_POST['kilometraje'], ENT_QUOTES, 'UTF-8');        
                $combustible = htmlspecialchars($_POST['combustible'], ENT_QUOTES, 'UTF-8');                
                $idVehiculo = htmlspecialchars($_POST['idVehiculo'], ENT_QUOTES, 'UTF-8');     
                $observaciones = htmlspecialchars($_POST['observaciones'], ENT_QUOTES, 'UTF-8');      
           
                  
                 $consulta = $MV->editarDetalleOrden($idOrden, $idVehiculo, $combustible, $kilometraje, $idMecanico, $observaciones);

                 echo $consulta;

                break;    

                case 'numTareas':

                $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
                
                 $consulta = $MV->numTareasPorHacer($idOrden);
                 echo $consulta;

                // echo 1;
                break;

                case 'facturar':
                    $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
                    $cantPago = htmlspecialchars($_POST['montoR'], ENT_QUOTES, 'UTF-8');        
                    $numFac = htmlspecialchars($_POST['numFact'], ENT_QUOTES, 'UTF-8');        
                    $serieFac = htmlspecialchars($_POST['numCom'], ENT_QUOTES, 'UTF-8');        
                        
            
                    
                    $consulta = $MV->facturar($idOrden,$cantPago,$numFac,$serieFac);

                    // if($consulta > 1){
                        $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Facturar", "Orden", "Se facturo una  orden($idOrden)", $_SESSION["S_IPPUBLICA"]);
                    //  }


                    echo $consulta;
                break;    




            case 'anular':
                $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');        
            
                $consulta = $MV->anularOrden($idOrden);

                // if($consulta > 1){
                    $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Anular", "Orden", "Se anulo una  orden($idOrden)", $_SESSION["S_IPPUBLICA"]);
                // }

                echo $consulta;
                break;

                case 'comDetalleOrden':
                    $idDetalle = htmlspecialchars($_POST['idDetalle'], ENT_QUOTES, 'UTF-8');   

                    $consulta = $MV->hayTareaDetalle($idDetalle);
                    echo $consulta;
                  break;  

        default:
            # code...
            break;
    }
