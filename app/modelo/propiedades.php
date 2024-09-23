<?php

namespace modelo;
class Propiedades implements \JsonSerializable  {
    private bool $esDiuretico = false;
    private bool $sinSodio = false;
    private bool $esNatural = false;
    private bool $sinTacc = false;
    private bool $aptoDiabetico = false;

    // Constructor
    public function __construct(bool $esDiuretico = false, bool $sinSodio = false, bool $esNatural = false, bool $sinTacc = false, bool $aptoDiabetico = false) {
        $this->esDiuretico = $esDiuretico;
        $this->sinSodio = $sinSodio;
        $this->esNatural = $esNatural;
        $this->sinTacc = $sinTacc;
        $this->aptoDiabetico = $aptoDiabetico;
    }
    
    // Métodos getter y setter
    public function getEsDiuretico(): bool {
        return $this->esDiuretico;
    }

    public function setEsDiuretico(bool $esDiuretico): void {
        $this->esDiuretico = $esDiuretico;
    }

    public function getSinSodio(): bool {
        return $this->sinSodio;
    }

    public function setSinSodio(bool $sinSodio): void {
        $this->sinSodio = $sinSodio;
    }

    public function getEsNatural(): bool {
        return $this->esNatural;
    }

    public function setEsNatural(bool $esNatural): void {
        $this->esNatural = $esNatural;
    }

    public function getSinTacc(): bool {
        return $this->sinTacc;
    }

    public function setSinTacc(bool $sinTacc): void {
        $this->sinTacc = $sinTacc;
    }

    public function getAptoDiabetico(): bool {
        return $this->aptoDiabetico;
    }

    public function setAptoDiabetico(bool $aptoDiabetico): void {
        $this->aptoDiabetico = $aptoDiabetico;
    }

    public function jsonSerialize() {
        return [
            'esDiuretico' => $this->esDiuretico,
            'sinSodio' => $this->sinSodio,
            'esNatural' => $this->esNatural,
            'sinTacc' => $this->sinTacc,
            'aptoDiabetico' => $this->aptoDiabetico
        ];
    }

}


