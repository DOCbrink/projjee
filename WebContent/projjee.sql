-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 16 Janvier 2015 à 16:28
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projjee`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CATEGORIE` int(11) NOT NULL,
  `NOM_CATEGORIE` varchar(767) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID_CATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`ID_CATEGORIE`, `NOM_CATEGORIE`) VALUES
(1, 'Tout ce qui touche à la programmation !'),
(2, 'Photo de maman');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `ID_IMAGE` int(255) NOT NULL,
  `URL_IMAGE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ID_CATEGORIE` int(11) NOT NULL,
  `ID_USER` int(255) NOT NULL,
  `NOM_IMAGE` varchar(255) CHARACTER SET latin1 NOT NULL,
  `DESCRIPTION_IMAGE` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_IMAGE`),
  KEY `ID_CATEGORIE` (`ID_CATEGORIE`),
  KEY `ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`ID_IMAGE`, `URL_IMAGE`, `ID_CATEGORIE`, `ID_USER`, `NOM_IMAGE`, `DESCRIPTION_IMAGE`) VALUES
(1, 'chromeLogo.png', 1, 1, 'Logo chrome', 'Logo du navigateur chrome'),
(2, 'Database.png', 1, 1, 'BDD', 'Logo courant d''une base de données'),
(3, 'Engrenage.png', 1, 1, 'Engrenage', 'Logo à fond transparent d''un engrenage'),
(4, 'LogoPhp.png', 1, 1, 'Logo PHP', 'C''est le logo de PHP'),
(5, 'Shellscript.png', 1, 1, 'Terminal', 'C''est le logo d''un terminal'),
(6, 'maman1.jpg', 2, 1, 'maman pseudo milf', 'Maman un peu milf'),
(7, 'maman-pub.jpg', 2, 1, 'maman d''une pub', 'Maman d''une pub de nivea (je crois)'),
(8, 'Lindsay-et-fille.jpg', 2, 1, 'Lindsay et sa fille', 'Lindsay Lohan et sa fille'),
(9, 'engrenage-1024x1024.png', 1, 1, 'test', 'test'),
(10, 'shell-script-icone-4168-128.png', 1, 1, 'coucou', 'coucou\r\ncoucou'),
(11, 'appli modif.png', 2, 1, 'iqsudyuq', 'moqsufjjiqd'),
(12, 'logo_php - Copie.png', 2, 1, '<lshlkjqdf', ':kkqjdflk'),
(13, 'Sans titre.png', 1, 1, 'testftfd', 'iij'),
(14, 'DCCfeuTri.png', 1, 1, 'yrtug', 'yfgvhijk');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID_USER` int(11) NOT NULL,
  `LOGIN_USER` varchar(767) CHARACTER SET latin1 NOT NULL,
  `MDP_USER` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID_USER`, `LOGIN_USER`, `MDP_USER`) VALUES
(0, '', ''),
(1, 'ADMIN', 'ADMIN'),
(2, 'toto', 'toto');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`ID_CATEGORIE`) REFERENCES `categorie` (`ID_CATEGORIE`),
  ADD CONSTRAINT `image_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
