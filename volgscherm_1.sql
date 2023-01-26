-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2022 às 20:19
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `volgscherm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `usuario` varchar(35) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`usuario`, `senha`) VALUES
('tom', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_impressora`
--

CREATE TABLE `dados_impressora` (
  `id` int(7) NOT NULL,
  `serial_impressora` varchar(15) NOT NULL,
  `data_execucao` date NOT NULL,
  `total_impressoes` int(10) NOT NULL,
  `novas_impressoes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `dados_impressora`
--

INSERT INTO `dados_impressora` (`id`, `serial_impressora`, `data_execucao`, `total_impressoes`, `novas_impressoes`) VALUES
(1, 'BRFSG9B018', '2022-11-30', 37562, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `impressora`
--

CREATE TABLE `impressora` (
  `serial` varchar(15) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `endereco_ip` varchar(15) NOT NULL,
  `data_reconhecimento` date NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `setor` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `impressora`
--

INSERT INTO `impressora` (`serial`, `nome`, `endereco_ip`, `data_reconhecimento`, `modelo`, `status`, `setor`) VALUES
('BRFSG9B018', 'Impressora no Bloco de Engenha', '10.26.1.226', '2022-11-30', 'HP LaserJet M1536dnf MFP', 0, 'CGAE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `id` int(15) NOT NULL,
  `chave` varchar(13) NOT NULL,
  `tema` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`id`, `chave`, `tema`) VALUES
(654678786, '1234', 'light');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`usuario`);

--
-- Índices para tabela `dados_impressora`
--
ALTER TABLE `dados_impressora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serial_impressora_fk` (`serial_impressora`);

--
-- Índices para tabela `impressora`
--
ALTER TABLE `impressora`
  ADD PRIMARY KEY (`serial`);

--
-- Índices para tabela `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dados_impressora`
--
ALTER TABLE `dados_impressora`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de tabela `sistema`
--
ALTER TABLE `sistema`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=654678788;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
