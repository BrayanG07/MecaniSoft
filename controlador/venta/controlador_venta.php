<?php
    require '../../modelo/modelo_venta.php';
    require '../../modelo/modelo_bitacora.php';
    $MB = new ModeloBitacora();
    session_start();

    $MV = new Modelo_Venta();
    $opcion = isset($_REQUEST['opcion']) ? $_REQUEST['opcion'] : "";
    switch ($opcion) {
        case 'listar':
            $fechaInicio = htmlspecialchars($_POST['fechaInicio'], ENT_QUOTES, 'UTF-8');
            $fechaFin = htmlspecialchars($_POST['fechaFin'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listarVenta($fechaInicio, $fechaFin);
            
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
        case 'listarDetalleventa':
            $idVenta = htmlspecialchars($_POST['idVenta'], ENT_QUOTES, 'UTF-8');
            $consulta = $MV->listarDetalleVenta($idVenta);
            
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
        case 'lastInvoice':
            $consulta = $MV->lastInvoiceNumber();
            $numberInvoice = $consulta[0]["num_factura"];
            $ultimoNumero = $consulta[0]["ultimo_numero"];          
            $nuevoNumeroFactura = complementoFactura($numberInvoice, $ultimoNumero);            

            echo $nuevoNumeroFactura;
            break;
        case 'maximumInvoice':
            $consulta = $MV->maximumInvoiceNumber();
            if ($consulta == null) {
                $consulta = '0';
            }
            echo $consulta;
            break;
        case 'registrarVenta':
            $idCliente = htmlspecialchars($_POST['idCliente'], ENT_QUOTES, 'UTF-8');        
            $idUsuario = htmlspecialchars($_POST['idUsuario'], ENT_QUOTES, 'UTF-8');        
            $tipoComprobante = htmlspecialchars($_POST['tipoComprobante'], ENT_QUOTES, 'UTF-8');        
            $serieComprobante = htmlspecialchars($_POST['serieComprobante'], ENT_QUOTES, 'UTF-8');        
            $numeroComprobante = htmlspecialchars($_POST['numeroComprobante'], ENT_QUOTES, 'UTF-8');        
            $total = htmlspecialchars($_POST['total'], ENT_QUOTES, 'UTF-8');        
            $impuesto = htmlspecialchars($_POST['impuesto'], ENT_QUOTES, 'UTF-8');        
            $porcentaje = htmlspecialchars($_POST['porcentaje'], ENT_QUOTES, 'UTF-8');        
            $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');        
            $dineroCliente = htmlspecialchars($_POST['dineroCliente'], ENT_QUOTES, 'UTF-8');        

            $consulta = $MV->registrarVenta($idCliente,$idUsuario,$tipoComprobante,$serieComprobante,$numeroComprobante,$total,$impuesto,$porcentaje,$descuento, $dineroCliente);
            echo $consulta;
            break;
        case 'registrarDetalleVenta':
            $idVenta = htmlspecialchars($_POST['idVenta'], ENT_QUOTES, 'UTF-8');        
            $producto = htmlspecialchars($_POST['producto'], ENT_QUOTES, 'UTF-8');        
            $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');        
            $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');               
            $descuento = htmlspecialchars($_POST['descuento'], ENT_QUOTES, 'UTF-8');               

            //Convertir los datos a arreglo con explode()
            $arrayProducto = explode(",", $producto);
            $arrayCantidad = explode(",", $cantidad);
            $arrayPrecio = explode(",", $precio);
            $arrayDescuento = explode(",", $descuento);
            for ($i=0; $i < sizeof($arrayProducto); $i++) { 
                $consulta = $MV->registrarDetalleVenta($idVenta, $arrayProducto[$i], $arrayCantidad[$i], $arrayPrecio[$i],$arrayDescuento[$i]);    
            }
            $MV->cerrarConexion();

            if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Registrar", "venta", "Se registro una nueva venta($idVenta)", $_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;
        case 'anular':
            $idVenta = htmlspecialchars($_POST['idVenta'], ENT_QUOTES, 'UTF-8');        
        
            $consulta = $MV->anularVenta($idVenta);

            if($consulta == 1){
                $bita =  $MB->registrarBitacora($_SESSION['S_IDUSUARIO'], "Anular", "venta", "Se anulo una venta ($idVenta)", $_SESSION["S_IPPUBLICA"]);
            }

            echo $consulta;
            break;
        default:
            # code...
            break;
    }

    function complementoFactura($numberInvoice, $ultimoNumero) {
        $digits = explode("-", $numberInvoice);
        $ceros = "";
        $count = intval(strlen((string) $digits[2]));

        for ($i=0; $i < $count; $i++) {
            if ($digits[2][$i] == 0) {
                $ceros .= "0";
            } else {
                break;
            } 
        }

        return $digits[0].'-'.$digits[1].'-'.$ceros.$ultimoNumero;;
    }

?>    
