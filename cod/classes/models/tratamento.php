<?php

    class tratamento {

        public $nome;
        public $descricao;

        function __construct($nome = null, $descricao = null)
        {
            $this->nome = $nome;
            $this->descricao = $descricao;
        }
    }

?>