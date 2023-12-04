-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Dets 04, 2023 kell 07:52 EL
-- Serveri versioon: 10.4.27-MariaDB
-- PHP versioon: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `tarpv22`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `maakond`
--

CREATE TABLE `maakond` (
  `id` int(11) NOT NULL,
  `maakond_nimi` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `maakond`
--

INSERT INTO `maakond` (`id`, `maakond_nimi`) VALUES
(1, 'Harjumaa'),
(10, 'Hiiu maakond'),
(2, 'Ida-viru maakond'),
(3, 'Lääne maakond'),
(11, 'Saare maakond'),
(4, 'Tartu maakond'),
(5, 'Võru maakond');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `maakond`
--
ALTER TABLE `maakond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maakond_nimi` (`maakond_nimi`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `maakond`
--
ALTER TABLE `maakond`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
