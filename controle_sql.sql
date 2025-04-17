-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 avr. 2025 à 09:41
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
-- Base de données : `controle_sql`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

DROP TABLE IF EXISTS `chambres`;
CREATE TABLE IF NOT EXISTS `chambres` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_hotel` int UNSIGNED NOT NULL,
  `id_type` int UNSIGNED NOT NULL,
  `numero` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `commentaire` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `FK_Chambres_Hotels` (`id_hotel`),
  KEY `FK_Chambres_TypesChambre` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`id`, `id_hotel`, `id_type`, `numero`, `commentaire`) VALUES
(1, 1, 1, '1', NULL),
(2, 1, 1, '2', 'En travaux'),
(3, 1, 3, '3', NULL),
(4, 1, 1, '4', NULL),
(6, 1, 6, '6', NULL),
(8, 2, 1, '1', NULL),
(9, 2, 2, '2', NULL),
(10, 2, 3, '3', NULL),
(11, 2, 4, '4', NULL),
(12, 2, 5, '5', 'Vue sur le lac'),
(13, 2, 6, '6', NULL),
(14, 2, 8, '7', NULL),
(15, 3, 1, '1', NULL),
(16, 3, 2, '2', NULL),
(17, 3, 3, '3', NULL),
(18, 3, 4, '4', NULL),
(19, 3, 5, '5', NULL),
(20, 3, 6, '6', NULL),
(21, 3, 8, '7', NULL),
(22, 4, 1, '1', NULL),
(23, 4, 2, '2', NULL),
(24, 4, 3, '3', NULL),
(25, 4, 4, '4', NULL),
(26, 4, 5, '5', NULL),
(27, 4, 6, '6', NULL),
(28, 4, 8, '7', NULL),
(29, 1, 5, '5', 'Reservée aux VIP');

-- --------------------------------------------------------

--
-- Structure de la table `chambre_types`
--

DROP TABLE IF EXISTS `chambre_types`;
CREATE TABLE IF NOT EXISTS `chambre_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `id_salle_de_bain` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_salle_de_bain` (`id_salle_de_bain`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre_types`
--

INSERT INTO `chambre_types` (`id`, `nom`, `description`, `id_salle_de_bain`) VALUES
(1, 'Chambre Standard', '1 lit simple avec douche (1 personne )', 1),
(2, 'Chambre Twin', '2 lits simples avec douche ( 2 personnes )', 1),
(3, 'Chambre Twin +', '2 lits simples avec douche et wc séparé (2 personnes )', 2),
(4, 'Chambre Double', '1 lit double avec douche (2 personnes)', 1),
(5, 'Chambre Double +', '1 lit double avec douche et WC séparé (2 personnes)', 2),
(6, 'Chambre Familiale', '1 lit double, 2 lits superposés avec douche et WC séparé (4 personnes)', 2),
(7, 'Chambre Familiale +', '1 lit double avec bain et WC séparé (4 personnes)', 4),
(8, 'Chambre King Size', '1 lit double large avec bain et WC séparé (2 personnes)', 4);

-- --------------------------------------------------------

--
-- Structure de la table `chambre_type_couchage`
--

DROP TABLE IF EXISTS `chambre_type_couchage`;
CREATE TABLE IF NOT EXISTS `chambre_type_couchage` (
  `id_type` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_couchage` tinyint UNSIGNED NOT NULL,
  `qte` tinyint UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_type`,`id_couchage`),
  KEY `chambre_type_couchage_ibfk_2` (`id_couchage`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre_type_couchage`
--

INSERT INTO `chambre_type_couchage` (`id_type`, `id_couchage`, `qte`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 2),
(4, 2, 1),
(5, 2, 1),
(6, 2, 1),
(6, 4, 2),
(8, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `couchages`
--

DROP TABLE IF EXISTS `couchages`;
CREATE TABLE IF NOT EXISTS `couchages` (
  `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nb_places` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `couchages`
--

INSERT INTO `couchages` (`id`, `nom`, `nb_places`) VALUES
(1, 'Lit simple', 1),
(2, 'Lit double', 2),
(3, 'Lit XL', 2),
(4, 'Lit superposé', 1);

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'unique',
  `etoile` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Libelle` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `libelle`, `etoile`) VALUES
(1, 'Ski Hotel', '*'),
(2, 'Art Hotel', '**'),
(3, 'Rose Hotel', '***'),
(4, 'Lions Hotel', '****');

-- --------------------------------------------------------

--
-- Structure de la table `salles_de_bain`
--

DROP TABLE IF EXISTS `salles_de_bain`;
CREATE TABLE IF NOT EXISTS `salles_de_bain` (
  `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salles_de_bain`
--

INSERT INTO `salles_de_bain` (`id`, `nom`) VALUES
(3, 'Baignoire'),
(4, 'Baignoire et WC séparé'),
(1, 'Douche'),
(2, 'Douche et WC séparé');

-- --------------------------------------------------------

--
-- Structure de la table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
CREATE TABLE IF NOT EXISTS `tarifs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_hotel` int UNSIGNED DEFAULT NULL,
  `id_type` int UNSIGNED DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `prix` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Tarifs_Hotels` (`id_hotel`),
  KEY `FK_Tarifs_TypesChambre` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tarifs`
--

INSERT INTO `tarifs` (`id`, `id_hotel`, `id_type`, `dateDebut`, `prix`) VALUES
(8, 2, 1, '2021-12-15', '57.49'),
(9, 2, 2, '2021-12-15', '68.99'),
(10, 2, 3, '2021-12-15', '80.49'),
(11, 2, 4, '2021-12-15', '68.99'),
(12, 2, 5, '2021-12-15', '80.49'),
(13, 2, 6, '2021-12-15', '91.99'),
(14, 2, 8, '2021-12-15', '103.49'),
(15, 3, 1, '2021-12-15', '57.49'),
(16, 3, 2, '2021-12-15', '68.99'),
(17, 3, 3, '2021-12-15', '80.49'),
(18, 3, 4, '2021-12-15', '68.99'),
(19, 3, 5, '2021-12-15', '80.49'),
(20, 3, 6, '2021-12-15', '91.99'),
(21, 3, 8, '2021-12-15', '103.49'),
(22, 4, 1, '2021-10-01', '49.99'),
(23, 4, 2, '2021-10-01', '59.99'),
(24, 4, 3, '2021-10-01', '69.99'),
(25, 4, 4, '2021-10-01', '59.99'),
(26, 4, 5, '2021-10-01', '69.99'),
(27, 4, 6, '2021-10-01', '79.99'),
(28, 4, 8, '2021-10-01', '89.99'),
(36, 4, 1, '2021-04-01', '57.49'),
(37, 4, 2, '2021-04-01', '68.99'),
(38, 4, 3, '2021-04-01', '80.49'),
(39, 4, 4, '2021-04-01', '68.99'),
(40, 4, 5, '2021-04-01', '80.49'),
(41, 4, 6, '2021-04-01', '91.99'),
(42, 4, 8, '2021-04-01', '103.49'),
(43, 2, 1, '2021-04-16', '49.99'),
(44, 2, 2, '2021-04-16', '59.99'),
(45, 2, 3, '2021-04-16', '69.99'),
(46, 2, 4, '2021-04-16', '59.99'),
(47, 2, 5, '2021-04-16', '69.99'),
(48, 2, 6, '2021-04-16', '79.99'),
(49, 2, 8, '2021-04-16', '89.99'),
(50, 3, 1, '2021-04-16', '49.99'),
(51, 3, 2, '2021-04-16', '59.99'),
(52, 3, 3, '2021-04-16', '69.99'),
(53, 3, 4, '2021-04-16', '59.99'),
(54, 3, 5, '2021-04-16', '69.99'),
(55, 3, 6, '2021-04-16', '79.99'),
(56, 3, 8, '2021-04-16', '89.99');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `chambre_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chambres_ibfk_2` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `chambre_types`
--
ALTER TABLE `chambre_types`
  ADD CONSTRAINT `chambre_types_ibfk_1` FOREIGN KEY (`id_salle_de_bain`) REFERENCES `salles_de_bain` (`id`);

--
-- Contraintes pour la table `chambre_type_couchage`
--
ALTER TABLE `chambre_type_couchage`
  ADD CONSTRAINT `chambre_type_couchage_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `chambre_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chambre_type_couchage_ibfk_2` FOREIGN KEY (`id_couchage`) REFERENCES `couchages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tarifs`
--
ALTER TABLE `tarifs`
  ADD CONSTRAINT `tarifs_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tarifs_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `chambre_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
