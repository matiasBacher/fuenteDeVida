<?php 
require_once($_SERVER['DOCUMENT_ROOT'].'/app/BD/buscadorProductos.php');
require_once($_SERVER["DOCUMENT_ROOT"]."/vendor/autoload.php");

use Dompdf\Dompdf;

$path = $_SERVER['DOCUMENT_ROOT'].'/publico/img/base64/logo.png';
$type = pathinfo($path, PATHINFO_EXTENSION);
$data = file_get_contents($path);
$base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);

$bd = new buscadorProductos("");
$bd->buscar();

$productos=$bd->getProductosEncontrados();


ob_start()
?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos</title>
<style>

.product-list table {
    width: 100%;
    border-collapse: collapse;
    padding: 20px;
    caption-side: bottom;
    color: #000000;
    text-align:left;
    letter-spacing: 1px;
}

.header {
            align-items: center;
            margin-bottom: 50px;
            width: 100%;
        }
        .header img {
            width: auto;
            height: 60px;
            float: left;
        }
        .header .date {
            font-size: 30px;
            float: right;
            margin-top: auto;
            margin-bottom: auto;
        }

.product-list tr:nth-of-type(2n){
    background-color: #d6d6d6;
}
/* .product-list tr:nth-of-type(2n) {
    background-color: rgb(124, 148, 128);
} */

.product-list th, .product-list td {
    border: 1px solid #000000;
    padding: 2px; 
    font-size: small; 
    text-align: center;
}


.product-list th {
    background-color: #a6a6a6 ;

}
.badge {
    padding: 0.35em 0.65em;
    display: inline-block;
    line-height: 1;
    text-align: center;
    vertical-align: baseline;
    border-radius: 0.375em;
    font-size: 0.75em;
    margin: 2px 2px;
    border: 1px solid ;
}


    </style>

    </head>
    <body>
    <div class="header">
        <div><img src="<?=$base64?>"></div>        
        <div class="date">
            <?php
                $datetime = new DateTime('now', new DateTimeZone('America/Argentina/Buenos_Aires'));
                echo $datetime->format('d-m-Y');
            ?>
        </div>
    </div>
            <div class="product-list">
            
                            <table>
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nombre del Producto</th>
                                        <th>Categoría</th>
                                        <th>Descripción</th>
                                        <th>Propiedades</th>
                                        <th>Precio</th>
                                        <th>Fecha de creación</th>
                                    </tr>
                                </thead>
                                <tbody id="product-table">
                                    <!-- Aquí se pueden añadir filas con productos -->
                                    <?php 
                                        for($i=0; $i<count($productos); $i++):?>
                                            <tr>
                                                <td><?=str_pad($productos[$i]->getCodigo(), 8, '0', STR_PAD_LEFT);?></td>
                                                <td><?=$productos[$i]->getNombre();?></td>
                                                <td><?=$productos[$i]->getCategoria();?></td>
                                                <td><?=$productos[$i]->getDescripcion()=="0"?"":$productos[$i]->getDescripcion();?></td>
                                                <td>
                                                    <?php 
                                                        if ($productos[$i]->getPropiedades()->getEsDiuretico()) {
                                                            echo '<span class="badge badgeAzul">Diurético</span>';
                                                        }
                                                        if ($productos[$i]->getPropiedades()->getSinSodio()) {
                                                            echo '<span class="badge badgeRojo">Bajo Sodio</span>';
                                                        }
                                                        if ($productos[$i]->getPropiedades()->getEsNatural()) {
                                                            echo '<span class="badge badgeVerde">Es Natural</span>';
                                                        }
                                                        if ($productos[$i]->getPropiedades()->getSinTacc()) {
                                                            echo '<span class="badge badgeNaranja">Sin TACC</span>';
                                                        }
                                                        if ($productos[$i]->getPropiedades()->getAptoDiabetico()) {
                                                            echo '<span class="badge badgeNegro">Apto Diabético</span>';
                                                        }
                                                    ?>
                                                </td>
                                                <td>$<?=$productos[$i]->getPrecioDeVenta();?></td>
                                                <td><?=$productos[$i]->getFechaCreacion();?></td>
                                        </tr>
                                    <?php endfor ;?>
                                </tbody>
                            </table>
            </div>                           
    </body>
    </html>
<?php 
    $html = ob_get_clean();
    $dompdf = new Dompdf();
    $dompdf->set_option('isRemoteEnabled', TRUE);
    $dompdf->loadHtml($html);
    $dompdf->render();
    header("Content-type: application/pdf");
    header("Content-Disposition: inline; filename=documento.pdf");
    echo $dompdf->output();