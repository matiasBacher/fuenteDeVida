<?php
final class conectioBD 
{
    static private $server = "localhost:3307";
    static private $user = "root";
    static private $psw = "";
    static private $bd = "fvpr2";

        // Getters para las propiedades estáticas privadas
        public static function getServer() {
            return self::$server;
        }
    
        public static function getUser() {
            return self::$user;
        }
    
        public static function getPsw() {
            return self::$psw;
        }
    
        public static function getBd() {
            return self::$bd;
        }
    
}
