<?php

function swich($name, $valor, $texto){?>
    <div class="comSwitch">
        <label class="switch">
            <input type="checkbox" value="<?=$valor?>" name="<?=$name?>">
            <span class="slider round"></span>
        </label>

        <div class="textSwitch"><?=$texto?></div>
    </div>
    <?php }