<?php
final class conectioBD
{
  static private $server = "localhost";

  static private $user = "matias";
  static private $psw = "clave900";
  static private $bd = "fvpr3";

  // Getters para las propiedades estáticas privadas
  public static function getServer()
  {
    return self::$server;
  }

  public static function getUser()
  {
    return self::$user;
  }

  public static function getPsw()
  {
    return self::$psw;
  }

  public static function getBd()
  {
    return self::$bd;
  }
}
#3
