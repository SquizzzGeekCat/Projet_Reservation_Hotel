-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 avr. 2025 à 13:51
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `controle_hotel`
--

-- --------------------------------------------------------

--
-- Structure de la vue `vue_tarif_fate_fin`
--

DROP VIEW IF EXISTS `vue_tarif_fate_fin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_tarif_fate_fin`  AS SELECT `t`.`id` AS `id`, `t`.`id_hotel` AS `id_hotel`, `t`.`id_type` AS `id_type`, `t`.`dateDebut` AS `dateDebut`, `t`.`prix` AS `prix`, max(`t`.`dateDebut`) AS `date_fin` FROM `tarifs` AS `t` WHERE exists(select 1 from `tarifs` `t2` where ((`t2`.`id_hotel` = `t`.`id_hotel`) AND (`t2`.`id_type` = `t`.`id_type`) AND (`t2`.`dateDebut` <> `t`.`dateDebut`)))  ;

--
-- VIEW `vue_tarif_fate_fin`
-- Données : Aucun(e)
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
