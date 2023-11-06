<?php

require_once __DIR__ . '/vendor/autoload.php';
require '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$query = "";

$query = "SELECT t.transaccion_fecha, CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat) AS NOMBRE_USUARIO,
    t.transaccion_observaciones, t.id_correlativo, p.persona_nrodocumento, p.persona_tipodocumento, t.transaccion_id,
    configuracion.conf_direccion, configuracion.conf_direccion, configuracion.conf_nombre_empresa, configuracion.conf_correo, configuracion.conf_telefono, 
    configuracion.conf_celular, configuracion.conf_rtn, configuracion.conf_img_logo
    FROM configuracion, transacciones t INNER JOIN usuario u on t.usuario_id = u.usuario_id
    INNER JOIN persona p ON p.persona_id = u.persona_id
  WHERE t.transaccion_id = ('".$_GET['codigo']."')"; 

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
                  <th width="20%" style="border-top: 0px; border-left: 0px; border-bottom: 0px; border-right: 0px;"><img src="img/logo.png" width="100px"></th>
                  <th width="55%" style="border-top: 0px; border-left: 0px; border-bottom: 0px; border-right: 0px; text-align:left; font-size: 20px;">
                    <span style="text-aling: center; color: black; font-size: 22px;"> <b>'.$row['conf_nombre_empresa'].'</b> <br> </span>
                    <b style="color: black;">Teléfono:</b> <span style="color: black;"> '.$row['conf_telefono'].' </span> , <b style="color: black;">Celular:</b> <span style="color: black;"> '.$row['conf_celular'].' </span><br>
                    <b style="color: black;">Correo:</b> <span style="color: black;"> '.$row['conf_correo'].' </span> <br>
                    <b style="color: black;">Dirección:</b> <span style="color: black;"> '.$row['conf_direccion'].' </span>. <br>
                    <b style="color: black;">RTN:</b> <span style="color: black;"> '.$row['conf_rtn'].' </span>
                  </th>
                  <th width="25%" style="text-align: center;">
                    <h1 style="color: black;">REPORTE MOVIMIENTO </h1>
                    <h3 style="color: black;"> '.$row['id_correlativo'].' </h3>
                  </th>
              </tr>
          </thead>
        </table>
        <div id="project">
          <div><span style="color: black; font-size: 14px;"><b>'.$row['persona_tipodocumento'].': </b>'.$row['persona_nrodocumento'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>Fecha: </b>'.$row['transaccion_fecha'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>Usuario: </b>'.$row['NOMBRE_USUARIO'].'</span></div>
          <div><span style="color: black; font-size: 14px;"><b>Descripción: </b>'.$row['transaccion_observaciones'].'</span></div>
        </div>
      </header>
      <main>
        <table>
          <thead>
            <tr>
              <th class="service">ITEM</th>
              <th class="desc">PRODUCTO</th>
              <th>CANTIDAD</th>
            </tr>
          </thead>
          <tbody>';
          $contador = 0;  
          $sql = "call SP_LISTAR_DETALLE_MOVIMIENTO('".$row['transaccion_id']."')";
          $resultado2 = $mysqli->query($sql);
          while ($row2 = $resultado2->fetch_assoc()) {   
            $contador++;
            $html.='<tr>
              <td class="service">'.$contador.'</td>
              <td class="desc">'.$row2['producto_nombre'].'</td>
              <td class="qty">'.$row2['detallemovimiento_cantidad'].'</td>
            </tr>';
          }  
            $html.='
          </tbody>
        </table>
        
        <div style="text-align: center;">
          <div style="width: 50%; margin-top: 6.5rem; margin-left: auto; margin-right: auto;">
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
