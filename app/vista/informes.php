<?php 
use Firebase\JWT\JWT;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");

$key="e3f1a703beae995dcd464e9dfc83e7b2a952e6d24e853102349995523aa636e6";
$url="http://localhost:3000";

$payload=[ 
    "resource"=>["dashboard"=>3],
    "params"=>new stdClass(),
    "exp" => time() + (10 * 60) // Expiración de 10 minutos
];

$token = JWT::encode($payload, $key, "HS256");
$iframeUrl = $url."/embed/dashboard/".$token."#theme=night&background=true&bordered=false&titled=false";?>
<div style="aspect-ratio: 3 / 4; width: 100%;  border: 1px solid black;">

<iframe src="<?=$iframeUrl?>"  allowtransparency frameborder="0"  style="width: 100%; height: 100%; border: none;" ></iframe>
</div>