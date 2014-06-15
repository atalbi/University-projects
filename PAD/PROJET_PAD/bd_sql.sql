-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mer 12 Janvier 2011 à 22:41
-- Version du serveur: 5.1.36
-- Version de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `projet_pad`
--
CREATE DATABASE `projet_pad` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projet_pad`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `super_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAdmin`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`idAdmin`, `login`, `password`, `super_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'root', '63a9f0ea7bb98050796b649e85481845', 0),
(8, 'toto1', 'd9bb4a8aad7b5e737beeee4813577d1f', 0),
(10, 'tata', '49d02d55ad10973b7b9d0dc9eba7fdf0', 0),
(11, 'cocoa', '1ed76d35f95379c2c1b160c2154c5c42', 0);

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

CREATE TABLE IF NOT EXISTS `alerte` (
  `idAlerte` int(11) NOT NULL AUTO_INCREMENT,
  `motCle` varchar(255) CHARACTER SET utf8 NOT NULL,
  `idCandidat` int(11) NOT NULL,
  PRIMARY KEY (`idAlerte`),
  KEY `idCandidat` (`idCandidat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `alerte`
--

INSERT INTO `alerte` (`idAlerte`, `motCle`, `idCandidat`) VALUES
(1, 'programmeur', 13),
(2, 'web', 13),
(6, 'java', 14),
(7, 'developpeur', 14),
(8, 'programmeur', 14),
(12, 'merise', 14),
(13, 'web', 14),
(15, 'HHHHHHHHH', 13),
(18, 'lol', 29),
(19, 'YYYY', 13),
(20, 'LOLO', 25),
(21, 'quick', 13);

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE IF NOT EXISTS `candidat` (
  `idCandidat` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `idFormation` int(11) NOT NULL,
  `Niveau_etudes` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CV` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `valide` int(11) NOT NULL DEFAULT '1',
  `observation` text CHARACTER SET utf8,
  `tel` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idCandidat`),
  KEY `idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Contenu de la table `candidat`
--

INSERT INTO `candidat` (`idCandidat`, `Nom`, `Prenom`, `idFormation`, `Niveau_etudes`, `CV`, `email`, `password`, `valide`, `observation`, `tel`) VALUES
(2, 'FAGNINOU', 'Hugues', 2, NULL, 'C:\\tmp_cvUpload\\Baromètre semestriel Syntec.pdf', 'fahugues@live.fr', '4884745e2dbbddb30e2454298d022723', 1, 'C:\\tmp_cvUpload\\Baromètre semestriel Syntec.pdf', ''),
(3, 'FAGNINOU', 'Romuald', 1, '', '', 'romus@live.fr', '378f1f99b50c95c4a00e3634243879c1', 1, NULL, ''),
(6, 'FAGNINOU', 'Habib', 1, NULL, NULL, 'habib@live.fr', 'habib', 1, NULL, NULL),
(13, 'FAGNINOU', 'tommy', 1, NULL, NULL, 'tommy@live.fr', '65f185ec6bd47af8f082f8196d0b4d24', 0, NULL, NULL),
(14, 'FAGNINOU', 'OLGA', 1, NULL, 'C:\\tmp_cvUpload\\trajet_nulhouse.pdf', 'olga@live.fr', 'e44d46e0bb9691cf448a9bb19391e8ab', 1, 'C:\\tmp_cvUpload\\Baromètre semestriel Syntec.pdf', '99999900000'),
(22, 'hugggOOOOOO', 'hugOOOOOOO', 2, NULL, 'C:\\tmp_cvUpload\\CPlancementSyntecApecdv .pdf', 'hug@live.fr', 'af231c77af76002cdaec813c29a6db09', 1, 'ras', '0673492827'),
(24, 'AINAMON', 'Martine', 2, 'licence pro', '', 'aimartine@live.fr', 'e44d46e0bb9691cf448a9bb19391e8ab', 1, NULL, '0673492827'),
(25, 'TALBI', 'Amine', 2, '', '', 'amine@live.fr', '30d2310007b75bf0180f5ed831f20fdb', 0, 'bah...devine !', ''),
(26, 'BOUMIL', 'Mounir', 1, '', '', 'mounir@live.fr', '6ba643dd1744c0733e5befe047d6025f', 0, 'bah...koi !', ''),
(28, 'LITOT', 'david', 3, '', '', 'david@live.fr', '172522ec1028ab781d9dfd17eaca4427', 0, '  ras', ''),
(29, 'toto', 'toto', 6, NULL, 'C:\\tmp_cvUpload\\', 'toto@live.fr', 'f71dbe52628a3f83a77ab494817525c6', 1, 'azdrfazrethyejhy', ''),
(30, 'tata', 'tata', 3, NULL, 'C:\\tmp_cvUpload\\Presse.mch', 'tata@live.fr', '49d02d55ad10973b7b9d0dc9eba7fdf0', 1, ' ras\r\nzzzzzzzzzzzzzzzzzzzz', '222222'),
(31, 'LERHER', 'ALine', 6, NULL, 'C:\\tmp_cvUpload\\mulhouseBis.doc', 'aline@live.fr', '8d3152ebd103cea3509c7dcfad8f8c10', 1, 'nsiojgivjeg\r\nazefgzenkgnjen\r\nazefgaejkfgeuhofzeu', '88888'),
(32, 'rhzerhe', 'erhehe', 4, NULL, 'C:\\tmp_cvUpload\\Baromètre semestriel Syntec.pdf', 'b', '92eb5ffee6ae2fec3ad71c777531578f', 1, ' setrhezrhe''-(t''j', '222222'),
(33, 'efvfe', 'edfvfe', 6, NULL, 'C:\\tmp_cvUpload\\note_logica.txt', 'everv', 'a8040ea1cfbc95973a86d4bc20c0f964', 1, '', 'evev');

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE IF NOT EXISTS `candidature` (
  `idCandidature` int(11) NOT NULL AUTO_INCREMENT,
  `idCandidat` int(11) NOT NULL,
  `idOffre` int(11) NOT NULL,
  `date` date NOT NULL,
  `observation` text CHARACTER SET utf8 NOT NULL,
  `decision` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idCandidature`),
  KEY `idCandidat` (`idCandidat`,`idOffre`),
  KEY `idOffre` (`idOffre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `candidature`
--

INSERT INTO `candidature` (`idCandidature`, `idCandidat`, `idOffre`, `date`, `observation`, `decision`) VALUES
(1, 14, 3, '2010-12-13', 'Je suis curieux et tres motive', 'Refused'),
(4, 13, 3, '2010-12-17', 'HHHHHHHHHHHHHHHHHH\r\nzrfgzerfgzer\r\nzetfgzerfgzer\r\nerghetghehethtehe', 'Accepted'),
(5, 13, 1, '2010-12-17', 'Quaestione igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.', 'En cours de traitement'),
(6, 14, 7, '2011-01-06', 'toto ', 'En cours de traitement');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `idFormation` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_Formation` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`idFormation`, `Libelle_Formation`) VALUES
(1, 'Informatique'),
(2, 'web'),
(3, 'BIOLOGIES'),
(4, 'TAIZE'),
(6, 'HRACCESS EXPRESS');

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `idOffre` int(11) NOT NULL AUTO_INCREMENT,
  `Titre_Offre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_offre` date NOT NULL,
  `Off_description` text CHARACTER SET utf8 NOT NULL,
  `idSociete` int(11) NOT NULL,
  `idFormation` int(11) NOT NULL,
  `valide` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idOffre`),
  KEY `idSociete` (`idSociete`,`idFormation`),
  KEY `idFormation` (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `offre`
--

INSERT INTO `offre` (`idOffre`, `Titre_Offre`, `date_offre`, `Off_description`, `idSociete`, `idFormation`, `valide`) VALUES
(1, 'Offre1', '2010-12-01', 'Une page JSP est exécutée coté serveur, comme la servlet.\r\nD''ailleurs, la JSP étant une servlet, il n''y a pas de différence fondamentale entre les 2.\r\nCependant, l''usage veut que la JSP se concentre sur la présentation des données, la génération du code HTML qui va bien etc... alors que la servlet traditionnelle sert de contrôleur et fait le lien entre le request, le', 14, 2, 1),
(3, 'Offre3', '2010-12-07', 'developpeur informatique', 3, 1, 1),
(7, 'analyse developpeur vba', '2010-12-20', 'Magique pizza', 3, 2, 1),
(8, 'secretaire de direction', '2010-12-17', 'jeune fille tres motivee aimant le travail. maitrise de office,word,outlook, excel, powerpoint, etc.la connaissance de java serait un atout', 3, 2, 1),
(9, 'finance manager', '2010-12-18', 'poste de directeur manager\r\n', 3, 1, 1),
(11, 'NOEL', '2010-02-28', 'aZFZEGA\r\nAZEG\r\nAERGAER\r\nERHTYTYUJYJUYKT', 3, 2, 1),
(12, 'OLA LALALAAAA', '2010-12-25', 'Coooooooooooool', 3, 4, 1),
(17, 'fgfg', '2010-12-25', 'Une page JSP est exécutée coté serveur, comme la servlet.\r\nD''ailleurs, la JSP étant une servlet, il n''y a pas de différence fondamentale entre les 2.\r\nCependant, l''usage veut que la JSP se concentre sur la présentation des données, la génération du code HTML qui va bien etc... alors que la servlet traditionnelle sert de contrôleur et fait le lien entre le request, le', 3, 3, 1),
(18, 'france', '2011-01-01', 'Une page JSP est exécutée coté serveur, comme la servlet.\r\nD''ailleurs, la JSP étant une servlet, il n''y a pas de différence fondamentale entre les 2.\r\nCependant, l''usage veut que la JSP se concentre sur la présentation des données, la génération du code HTML qui va bien etc... alors que la servlet traditionnelle sert de contrôleur et fait le lien entre le request, le', 3, 1, 1),
(19, 'rotterdam', '2010-02-28', 'Une page JSP est exécutée coté serveur, comme la servlet.\r\nD''ailleurs, la JSP étant une servlet, il n''y a pas de différence fondamentale entre les 2.\r\nCependant, l''usage veut que la JSP se concentre sur la présentation des données, la génération du code HTML qui va bien etc... alors que la servlet traditionnelle sert de contrôleur et fait le lien entre le request, le', 3, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `idSociete` int(11) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `valide` int(11) NOT NULL DEFAULT '1',
  `login` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idSociete`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `societe`
--

INSERT INTO `societe` (`idSociete`, `raison_social`, `tel`, `adresse`, `description`, `valide`, `login`, `password`) VALUES
(1, 'MAGIQUE PIZZA', NULL, NULL, '', 1, 'magic', '2f3a4fccca6406e35bcf33e92dd93135'),
(2, 'CHAWI', '    ', 'jhdftufkuyuyy', 'tdrydyyukyukyghgygo', 1, 'chawi', '3ee59f004a5d561c58e12cda9d951c7d'),
(3, 'LE FEBULE', ' ', '7 rue Laplace, \r\n25000 Besancon', 'Societe de Service et d''Ingenierie Informatique offrant tout type de prestation liée à l''informatique', 1, 'febule@live.fr', '4833e4b58ebe6c442c41faa3f42e0917'),
(4, 'QUICK', '  ', 'ras ', 'restaura', 0, 'quick', '1df3746a4728276afdc24f828186f73a'),
(14, 'tata', '33 33 33 33', 'sdfqscfqsf\r\nqsfqsfq\r\nzegfzergrzegerhytey\r\nzefzetgzertgzretgeryer', 'srthtrh\r\ngzhytr\r\ntrutyujtye\r\ntrujhtyutyeruytejhergzerz', 1, 'tata', '49d02d55ad10973b7b9d0dc9eba7fdf0'),
(15, 'cocoa', '', 'sdf', 'ras', 1, 'cocoa', '1ed76d35f95379c2c1b160c2154c5c42'),
(16, 'dddd', 'ddd', 'dddd', 'dddd', 0, 'dddd', '11ddbaf3386aea1f2974eee984542152'),
(17, 'cccc', 'dddd', 'dddd', 'dddd', 0, 'cccc', '41fcba09f2bdcdf315ba4119dc7978dd'),
(18, 'gggg', 'gggg', 'gggg', 'gggg', 0, 'gggg', 'c1ebb4933e06ce5617483f665e26627c'),
(19, 'xxxx', 'xxxx', 'xxxx', 'xxxx', 0, 'xxxx', 'ea416ed0759d46a8de58f63a59077499'),
(20, 'ssss', '222222', 'ssss', 'efzefzef', 1, 'ssss', '8f60c8102d29fcd525162d02eed4566b'),
(21, 'qqqq', 'qqqq', 'qqqq', 'qqqq', 0, 'qqqq', '3bad6af0fa4b8b330d162e19938ee981');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD CONSTRAINT `alerte_ibfk_1` FOREIGN KEY (`idCandidat`) REFERENCES `candidat` (`idCandidat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `candidat_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`idCandidat`) REFERENCES `candidat` (`idCandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidature_ibfk_2` FOREIGN KEY (`idOffre`) REFERENCES `offre` (`idOffre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `offre_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offre_ibfk_2` FOREIGN KEY (`idSociete`) REFERENCES `societe` (`idSociete`) ON DELETE CASCADE ON UPDATE CASCADE;
