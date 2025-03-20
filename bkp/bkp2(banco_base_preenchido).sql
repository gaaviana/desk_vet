-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/03/2025 às 20:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `prontuario_vet`
--
CREATE DATABASE IF NOT EXISTS `prontuario_vet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prontuario_vet`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animal`
--

CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL,
  `nome_animal` varchar(100) NOT NULL,
  `especie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animal`
--

INSERT INTO `animal` (`id_animal`, `nome_animal`, `especie_id`) VALUES
(1, 'Meg', 1),
(2, 'Luna', 2),
(3, 'Bolinha', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `especie`
--

CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL,
  `nome_especie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especie`
--

INSERT INTO `especie` (`id_especie`, `nome_especie`) VALUES
(1, 'Cachorro'),
(2, 'Gato'),
(3, 'Coelho');

-- --------------------------------------------------------

--
-- Estrutura para tabela `prontuario`
--

CREATE TABLE `prontuario` (
  `data_tratamento` datetime NOT NULL,
  `observacao` text DEFAULT NULL,
  `animal_id` int(11) NOT NULL,
  `tratamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `prontuario`
--

INSERT INTO `prontuario` (`data_tratamento`, `observacao`, `animal_id`, `tratamento_id`) VALUES
('2025-02-10 00:00:00', 'Demorou para voltar da anestesia, mas nada preocupante', 2, 102),
('2025-03-01 00:00:00', NULL, 3, 101),
('2025-08-30 11:30:00', 'Renovar em 1 ano', 1, 100),
('2025-08-30 11:35:00', 'Houve reação alérgica', 1, 101),
('2025-09-02 16:30:00', NULL, 2, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tratamento`
--

CREATE TABLE `tratamento` (
  `id_tratamento` int(11) NOT NULL,
  `nome_tratamento` varchar(100) NOT NULL,
  `obs_tratamento` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tratamento`
--

INSERT INTO `tratamento` (`id_tratamento`, `nome_tratamento`, `obs_tratamento`) VALUES
(100, 'Vacina Antirrábica', 'Proteção contra raiva'),
(101, 'Vermifugação', 'Controle de vermes intestinais'),
(102, 'Castração', 'Esterilização');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `fk_animal_especie` (`especie_id`);

--
-- Índices de tabela `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id_especie`);

--
-- Índices de tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`data_tratamento`),
  ADD KEY `fk_prontuario_animal` (`animal_id`),
  ADD KEY `fk_prontuario_tratamento` (`tratamento_id`);

--
-- Índices de tabela `tratamento`
--
ALTER TABLE `tratamento`
  ADD PRIMARY KEY (`id_tratamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `especie`
--
ALTER TABLE `especie`
  MODIFY `id_especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tratamento`
--
ALTER TABLE `tratamento`
  MODIFY `id_tratamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_animal_especie` FOREIGN KEY (`especie_id`) REFERENCES `especie` (`id_especie`);

--
-- Restrições para tabelas `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `fk_prontuario_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `fk_prontuario_tratamento` FOREIGN KEY (`tratamento_id`) REFERENCES `tratamento` (`id_tratamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
