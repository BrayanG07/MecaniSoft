<?php

require_once __DIR__ . '/vendor/autoload.php';
require '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();

$query = "SELECT
              transacciones.transaccion_id as ingreso_id,
              transacciones.transaccion_tipocomprobante as ingreso_tipcomprobante,
              transacciones.transaccion_seriecomprobante as ingreso_seriecomprobante,
              transacciones.transaccion_numcomprobante as ingreso_numcomprobante,
              transacciones.transaccion_fecha as ingreso_fecha,
              proveedor.proveedor_razonsocial,
              proveedor.proveedor_numcontacto,
              persona.persona_tipodocumento,
              persona.persona_nrodocumento,
              CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) as NOMBRE_PROVEEDOR,
              transacciones.transaccion_total as ingreso_total,
              transacciones.transaccion_impuesto as ingreso_impuesto,
              transacciones.transaccion_porcentaje as ingreso_porcentaje,
              (SELECT CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat)		
              FROM transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
              INNER JOIN persona p ON p.persona_id = u.persona_id
            WHERE t.transaccion_id = '".$_GET['codigo']."' ) AS NOMBRE_USUARIO,
            configuracion.conf_direccion, configuracion.conf_direccion, configuracion.conf_nombre_empresa, configuracion.conf_correo, configuracion.conf_telefono, 
            configuracion.conf_celular, configuracion.conf_rtn, configuracion.conf_img_logo
              FROM configuracion, transacciones INNER JOIN transaccion_proveedor ON transaccion_proveedor.transaccion_id = transacciones.transaccion_id
              INNER JOIN proveedor ON transaccion_proveedor.proveedor_id = proveedor.proveedor_id
              INNER JOIN persona ON proveedor.persona_id = persona.persona_id
            WHERE transacciones.transaccion_id = '".$_GET['codigo']."';";

$resultado = $mysqli->query($query);
while ($row = $resultado->fetch_assoc()) {         

  $html = '
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="utf-8">
      <title>Example 1</title>
      <link rel="stylesheet" href="style.css" media="all" />
    </head>
    <body>
      <header class="clearfix">
        <table border="1">
          <thead>
              <tr>
                  <th width="10%" style="border-top: 0px; border-left: 0px; border-bottom: 0px; border-right: 0px;"><img src="'.$row['conf_img_logo'].'" width="100px"></th>
                  <th width="60%" style="border-top: 0px; border-left: 0px; border-bottom: 0px; border-right: 0px; text-align:left; font-size: 20px;">
                    <span style="text-aling: center; color: black; font-size: 22px;"> <b>'.$row['conf_nombre_empresa'].'</b> <br> </span>
                    <b style="color: black;">Teléfono:</b> <span style="color: black;"> '.$row['conf_telefono'].' </span> , <b style="color: black;">Celular:</b> <span style="color: black;"> '.$row['conf_celular'].' </span><br>
                    <b style="color: black;">Correo:</b> <span style="color: black;"> '.$row['conf_correo'].' </span> <br>
                    <b style="color: black;">Dirección:</b> <span style="color: black;"> '.$row['conf_direccion'].' </span>. <br>
                    <b style="color: black;">RTN:</b> <span style="color: black;"> '.$row['conf_rtn'].' </span>
                  </th>
                  <th width="30%" style="text-align: center;">
                    <h1 style="color: black;">'.$row['ingreso_tipcomprobante'].' DE INGRESO </h1>
                    <h3 style="color: black;"> '.$row['ingreso_seriecomprobante'].' - '.$row['ingreso_numcomprobante'].' </h3>
                  </th>
              </tr>
          </thead>
        </table>
        <div id="project">
          <div><span style="color: black; font-size: 14px;"><b>Proveedor: </b> '.$row['proveedor_razonsocial'].' - '.$row['NOMBRE_PROVEEDOR'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>'.$row['persona_tipodocumento'].': </b>'.$row['persona_nrodocumento'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>Número Contacto: </b>'.$row['proveedor_numcontacto'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>Fecha: </b>'.$row['ingreso_fecha'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>ALMACENERO: </b>'.$row['NOMBRE_USUARIO'].'</span></div>
        </div>
      </header>
      <main>
        <table>
          <thead>
            <tr>
              <th class="service">ITEM</th>
              <th class="desc">PRODUCTO</th>
              <th>PRECIO</th>
              <th>CANTIDAD</th>
              <th>SUBTOTAL</th>
            </tr>
          </thead>
          <tbody>';
          $contador = 0;  
          $sql = "call SP_LISTAR_DETALLE_NGRESO('".$row['ingreso_id']."')";
          $resultado2 = $mysqli->query($sql);
          while ($row2 = $resultado2->fetch_assoc()) {   
            $contador++;
            $html.='<tr>
              <td class="service">'.$contador.'</td>
              <td class="desc">'.$row2['producto_nombre'].'</td>
              <td class="unit">'.$row2['detalleingreso_precio'].'</td>
              <td class="qty">'.$row2['detalleingreso_cantidad'].'</td>
              <td class="total">'.round($row2['SUB_TOTAL'],2).'</td>
            </tr>';
          }
          if ($row['ingreso_tipcomprobante'] == "FACTURA" || $row['ingreso_tipcomprobante'] == "AJUSTE") {
            $html.='
              <tr>
                <td colspan="2" rowspan="4" style="background: #ffffff" text-align: left;><b>
                <barcode code="'.$row['ingreso_numcomprobante'].'" type="EAN13" class="barcode" size="1.2" disableborder="1"/>
                </b></td>
              </tr>
              <tr>
                <td colspan="2" style="background: #ffffff"><b>SUBTOTAL</b></td>
                <td class="total" style="background: #ffffff">L. '.($row['ingreso_total'] - $row['ingreso_impuesto']) .'</td>
              </tr>
              <tr>
                <td colspan="2" style="background: #ffffff"><b>ISV '.($row['ingreso_porcentaje']*100) .'% </b></td>
                <td class="total" style="background: #ffffff">L. '.$row['ingreso_impuesto'].'</td>
              </tr>
              <tr>
                <td colspan="2" style="background: #ffffff"><b>TOTAL NETO</b></td>
                <td class="grand total" style="background: #ffffff">L. '.$row['ingreso_total'].'</td>
              </tr>';
          } else {
            $html.= '<tr>
              <td colspan="4"><b>TOTAL NETO</b></td>
              <td class="grand total">L. '.$row['ingreso_total'].'</td>
            </tr>';
          }  
            $html.='
          </tbody>
        </table>
        <div style="text-align: center;">
          <div style="width: 50%; margin-top: 8rem; margin-left: auto; margin-right: auto;">
            <hr style="display: block; border: none; height: 1px; background-color: black;">
            <p style="margin: 0px; font-size: 15px;" ><b> Firma: '.$row['NOMBRE_USUARIO'].' </b></p>
          </div>
        </div>

      </main>
      <footer>
      '.$row['conf_nombre_empresa'].'
      </footer>
    </body>
  </html>';
} 

$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css, 1); //1 = es para que ejecute el css
$mpdf->WriteHTML($html);
$mpdf->Output();
