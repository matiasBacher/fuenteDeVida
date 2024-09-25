<?php
use modelo\MedioPago;
use modelo\Venta;

$arrayMedioPagos = $entityManager->getRepository(entityName: MedioPago::class)->findAll();
$precioMaximo = $entityManager->getRepository(entityName: Venta::class)
                ->findOneBy(criteria: [],orderBy: ["total" => 'DESC'])->getTotalEnFecha();

$precioMinimo = $entityManager->getRepository(entityName: Venta::class)
                ->findOneBy(criteria: [],orderBy: ["total" => 'ASC'])->getTotalEnFecha();

$paso=intdiv(($precioMaximo-$precioMinimo), 100)
?>
<div>
    <div id="filtrosVentasCont">
        <div class="filtroVenta">
            <div class="tituloFiltroVenta"><h1>Fecha</h1></div>
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
            <div class="tituloFiltroVenta">Medio Pago</div>
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
        <div class="fintroVenta">
            <div class="tituloFiltro">
                <div class="elementoFiltro">
                    <label for="rangoMnimo">Minimo</label>
                    <input type="range" name="rangoMinimo" id="rangoMinimo" min="<?=$precioMinimo?>" 
                    max="<?=$precioMaximo?>" value="<?=$precioMinimo?>" step="<?=$paso?>">
                </div>
                <div class="elementoFiltro">
                    <label for="rangoMaximo">Maximo</label>
                    <input type="range" name="rangoMaximo" id="rangoMaximo"min="<?=$precioMinimo?>" 
                    max="<?=$precioMaximo?>" value="<?=$precioMaximo?>" step="<?=$paso?>">
                </div>
            </div>


    </div>
    <div id="ventas">
    </div>
</div>
<script type="module" src="publico/js/venta/venta.js"></script>