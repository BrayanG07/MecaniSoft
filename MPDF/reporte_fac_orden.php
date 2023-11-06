<?php

require_once __DIR__ . '/vendor/autoload.php';
use Luecano\NumeroALetras\NumeroALetras;
require '../conexion_global/r_conexion.php';


$formatter = new NumeroALetras();
$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8', 'format' => [190, 500]]);

$query = "SELECT
    transacciones.transaccion_id as venta_id,
    transacciones.transaccion_numcomprobante as venta_numcomprobante,
    transacciones.transaccion_fecha as venta_fecha,
    transacciones.transaccion_impuesto as venta_impuesto,
    transacciones.transaccion_total as venta_total,
    transacciones.transaccion_descuento as venta_descuento,
    transacciones.transaccion_porcentaje as venta_porcentaje,
    CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) AS NOMBRE_CLIENTE, 
    usuario.usuario_nombre,
    transacciones.transaccion_cantidadpago,
    (SELECT CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat)		
    FROM transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
    INNER JOIN persona p ON p.persona_id = u.persona_id
    WHERE t.transaccion_id = '".$_GET['codigo']."' ) AS NOMBRE_USUARIO,
    configuracion.*
    FROM  configuracion, transacciones INNER JOIN usuario ON transacciones.usuario_id = usuario.usuario_id
    INNER JOIN persona ON transacciones.persona_id = persona.persona_id
    WHERE transacciones.transaccion_tipo = 'ORDEN' AND transacciones.transaccion_id = '".$_GET['codigo']."';";


    $html =  "";
$resultado = $mysqli->query($query);
while ($row = $resultado->fetch_assoc()) { 
  $totalLetas = $formatter->toWords($row['venta_total'], 2);
  $html= '
<div class="contenedor">

    <table id="tblFactura" align="center">
        
        <tr>
            <td colspan="3">
                <hr style="display: block; border: none; height: 4px; background-color: black; color:black;">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <h1>'.$row['conf_nombre_empresa'].'</h1>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="parrafo_inicial"><p>RTN '.$row['conf_rtn'].'</p></td>
        </tr>
        <tr>
            <td colspan="3" class="parrafo_inicial"><p>'.$row['conf_cai'].'</p></td>
        </tr>
        <tr>
            <td colspan="3" class="parrafo_inicial"><p>'.$row['conf_direccion'].'</p></td>
        </tr>
        <tr>
            <td colspan="3" class="parrafo_inicial"><p>Telefono: '.$row['conf_telefono'].', Celular: '.$row['conf_celular'].'</p></td>
        </tr>
        <tr>
            <td colspan="3">
                <p style="font-size: 18x">'.$row['conf_correo'].'</p>
                <hr style="display: block; border: none; height: 4px; background-color: black; color:black;">
            </td>
        </tr>
        
        <tr>
            <td colspan="3" style="padding-bottom: 10px;">
                <h2>FACTURA DE CONTADO</h2>
            </td>
        </tr>
        <tr>
            <td class="derecha" colspan="1">Factura:</td>
            <td class="izquierda" colspan="2">'.$row['venta_numcomprobante'].'</td>
        </tr>
        <tr>
            <td class="derecha" colspan="1">Cliente:</td>
            <td class="izquierda" colspan="2">'.$row['NOMBRE_CLIENTE'].'</td>
        </tr>
        <tr>
            <td class="derecha" colspan="1">Fecha:</td>
            <td class="izquierda" colspan="2">'.$row['venta_fecha'].'</td>
        </tr>
        <tr>
            <td class="derecha" colspan="1">Vendedor:</td>
            <td class="izquierda" colspan="2">
            '.$row['NOMBRE_USUARIO'].'
            </td>
        </tr>
        <tr>
            <td colspan="3"><hr style="display: block; border: none; height: 4px; background-color: black; color:black;"></td>
        </tr>
        <tr>
            <th colspan="1" class="cantidad">Cant.</th>
            <th colspan="1" class="precio">P. Unit</th>
            <th colspan="1">valor</th>
        </tr>';

        $sql = "call SP_LISTAR_DETALLE_COTIZACION('".$row['venta_id']."')";
          $resultado2 = $mysqli->query($sql);
          while ($row2 = $resultado2->fetch_assoc()) {
            $html .= '
            <tr>
              <td colspan="3" class="producto">'.$row2['producto_nombre'].'</td>
            </tr>
            <tr>
                <td colspan="1" class="cantidad">'.$row2['detalle_cantidad'].'</td>
                <td colspan="1" class="precio">'.$row2['detalle_precio'].'</td>
                <td colspan="1">'.number_format($row2['SUB_TOTAL'], 2, ".", "").'</td>
            </tr>';
          
          }  
        
          $html .= ' <tr>
            <td colspan="3"><hr style="display: block; border: none; height: 4px; background-color: black; color:black;"></td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Sub-Total Importe Exento
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                0.00
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Ventas Exoneradas
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                0.00
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Sub-Total Importe Gravado 15% 
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
            '.round((floatval((($row['venta_total'] - $row['venta_impuesto']) + $row['venta_descuento'])) - floatval($row['venta_impuesto'])), 2).'
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Sub-Total Importe Gravado 18% 
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                0.00
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                15% ISV 
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                '.$row['venta_impuesto'].'
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                18% ISV 
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                0.00
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Descuento y Rebajas Otorgadas 
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                '.$row['venta_descuento'].'
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                GRAN TOTAL
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
            '.$row['venta_total'].'
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Pago:
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
            '.$row['transaccion_cantidadpago'].'
            </td>
        </tr>
        <tr class="detalle">
            <td colspan="1" class="informacion">
                Cambio:
            </td>
            <td colspan="1" class="lempira">
                L.
            </td>
            <td colspan="1">
                '.round((floatval($row['transaccion_cantidadpago']) - $row['venta_total']),2).'
            </td>
        </tr>

        <tr class="dinero_letras">
            <td colspan="3"><p style="padding-top: 10px; font-size:18px">'.$totalLetas.'</p></td>
        </tr>
        <tr class="dolar">
            <td colspan="3">
                <p style="font-size: 18px;">Valor en $: '.round((floatval($row['venta_total']) / floatval($row['conf_preciodolar'])), 2).'</p>                
            </td>
        </tr>
        <tr>
            <td colspan="3" class="lema">¡Bajos Precios! Nosotros pensamos en tu bolsillo</td>
        </tr>
        <tr>
            <td colspan="3">
                <p style="font-size: 18px"> La factura es beneficio de todos. Exijala </p>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="info_fac">Fecha Limite: '.$row['conf_fact_fechalimite_emision'].'</td>
        </tr>
        <tr>
            <td colspan="3" class="info_fac">Desde: '.$row['conf_numero_inicial'].'</td>
        </tr>
        <tr>
            <td colspan="3" class="info_fac">Hasta: '.$row['conf_numero_final'].'</td>
        </tr>
        <tr>
            <td colspan="3" class="data_exonerado">DATOS DEL ADQUIRIENTE EXONERADO</td>
        </tr>

        <tr>
            <td colspan="3" class="orden">No. Orden Compra Exenta:</td>
        </tr>
        <tr>
            <td colspan="3" class="campo_orden"><hr style="display: block; border: none; height: 2px; background-color: black; color:black;"></td>
        </tr>
        <tr>
            <td colspan="3" class="orden">No. Constancia Registro Exonerado:</td>
        </tr>
        <tr>
            <td colspan="3" class="campo_orden"><hr style="display: block; border: none; height: 2px; background-color: black; color:black;"></td>
        </tr>
        <tr>
            <td colspan="3" class="orden">Original: Cliente</td>
        </tr>
        <tr>
            <td colspan="3" class="orden">Copia: Obligado Tributario Emisor</td>
        </tr>
    </table>
  </div>
';

}

$css = file_get_contents('css/factura.css');
$mpdf->WriteHTML($css, 1); //1 = es para que ejecute el css
$mpdf->WriteHTML($html);
$mpdf->Output();


