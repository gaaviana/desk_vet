<?php

class animal {

    public $nome;
    public $especie;

    function __construct($nome = null, especie $especie = null) {
        $this->nome = $nome;
        
        if ($especie != null) 
            $this->especie = $especie; 
        else
            $this->especie = new especie();
}
}
?>