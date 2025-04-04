-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 avr. 2025 à 12:20
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `finance_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `devise`
--

DROP TABLE IF EXISTS `devise`;
CREATE TABLE IF NOT EXISTS `devise` (
  `code` varchar(3) NOT NULL,
  `taux_convert` decimal(10,6) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `devise`
--

INSERT INTO `devise` (`code`, `taux_convert`) VALUES
('EUR', 1.000000),
('USD', 1.080000),
('GBP', 0.860000),
('CHF', 0.970000),
('CAD', 1.470000),
('AUD', 1.630000),
('JPY', 160.500000),
('CNY', 7.810000),
('INR', 89.500000),
('BRL', 5.370000),
('ZAR', 20.050000),
('XOF', 655.957000);

-- --------------------------------------------------------

--
-- Structure de la table `objectifs`
--

DROP TABLE IF EXISTS `objectifs`;
CREATE TABLE IF NOT EXISTS `objectifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  `montant_economise` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` enum('revenue','depense') NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `description` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `devise_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `devise_code` (`devise_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `devise_code` varchar(3) NOT NULL,
  `plafond_journalier` decimal(10,2) DEFAULT NULL,
  `capital` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `devise_code` (`devise_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `password`, `devise_code`, `plafond_journalier`, `capital`) VALUES
(1, 'test', 'test@test.test', '$2b$10$ntm/tL7tiS.z1YWhk3kqreKb3QJP8LsDIP1wy48Eypu2WfhmWXqoS', 'EUR', 100.00, 500.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
