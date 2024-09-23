<?php
require_once "vendor/autoload.php";

use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\ORMSetup;

$paths = array(__DIR__ .'/app/modelo');
$isDevMode = true;

require_once ($_SERVER['DOCUMENT_ROOT']."/app/config/conectioBD.php");

// Configuración de la base de datos
$connectionParams = [
    'dbname'   =>conectioBD::getBd(),
    'user'     =>conectioBD::getUser(),
    'password' =>conectioBD::getPsw(),
    'host'     => conectioBD::getServer(),
    'driver'   => 'pdo_mysql', // Puedes cambiar esto a pdo_pgsql o cualquier otro driver compatible
];


$config = ORMSetup::createAttributeMetadataConfiguration($paths, $isDevMode);
$connection = DriverManager::getConnection($connectionParams, $config);
$entityManager = new EntityManager($connection, $config);