<?php
use modelo\MedioPago;
use modelo\Venta;

$arrayMedioPagos = $entityManager->getRepository(entityName: MedioPago::class)->findAll();
$precioMaximo = $entityManager->getRepository(entityName: Venta::class)
                ->findOneBy(criteria: ["errorVenta"=>false],orderBy: ["total" => 'DESC'])->getTotalEnFecha();

$precioMinimo = $entityManager->getRepository(entityName: Venta::class)
                ->findOneBy(criteria: ["errorVenta"=>false],orderBy: ["total" => 'ASC'])->getTotalEnFecha();

$paso=intdiv(($precioMaximo-$precioMinimo), 100)
?>
<body>  
    <div class="contenedorFiltro">
            <div class="filtroVenta">
                <div class="tituloFiltroVenta"><h2>Fecha</h2></div>
                <div>
                    <div class="elementoFiltro">
                        <label for="desde">desde</label>
                        <input type="date" name="desde" id="fechaDesde" value="<?=date("Y-m-d", strtotime("-1 month"))?>">
                    </div>
                    <div class="elementoFiltro">
                        <label for="hasta">hasta</label>
                        <input type="date" name="desde" id="fechaHasta" value="<?=date("Y-m-d")?>">
                    </div>
                </div>
            </div>
            <div class="filtroVenta">
                <div class="tituloFiltroVenta"> <h2> Medio Pago</h2></div>
                <?php foreach($arrayMedioPagos as $m):?>
                    <div class="elementoFiltro">
                        <div class="comSwitch">
                                <label class="switch">
                                    <input type="checkbox" name="caracteristicas[]" id="<?="filtMP".$m->getNombre()?>" value="<?=$m->getId()?>">
                                    <span class="slider round"></span>
                                </label>

                                <div class="textSwitch"><?=$m->getNombre()?></div>
                        </div>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="filtroVenta">
                <div class="tituloFiltroVenta"><h2> Precio</h2>
                    <div class="elementoFiltro">
                        <label for="rangoMnimo">Minimo</label>
                        <input type="range" name="rangoMinimo" id="rangoMinimo" min="<?=$precioMinimo?>" 
                        max="<?=$precioMaximo?>" value="<?=$precioMinimo?>" step="<?=$paso?>">
                        <span class="mostradorRango"></span>

                    </div>
                    <div class="elementoFiltro">
                        <label for="rangoMaximo">Maximo</label>
                        <input type="range" name="rangoMaximo" id="rangoMaximo"min="<?=$precioMinimo?>" 
                        max="<?=$precioMaximo?>" value="<?=$precioMaximo?>" step="<?=$paso?>">
                        <span class="mostradorRango"></span>
                    </div>
                </div>
        </div>            

    </div>
    <div id="ventas">
    </div>
    <div id="modalModificarVenta" class="fondoModal">
        <?php
            
             $modificarActivo=true;

            include_once($_SERVER['DOCUMENT_ROOT']."/app/vista/caja.php");
        ?>
    </div>
    <div class="fondoModal" id="modalConsultarModVentas">
       <div class="modalContent">
        <span class="close" id="closeModalConsultarVenta">&times;</span>
        <div id="contenedorConsulVenta">
        </div>

       </div> 
    </div>
</div>
<script type="module" src="publico/js/venta/consultaRegistro.js"></script>

<script type="module" src="publico/js/venta/venta.js"></script>

