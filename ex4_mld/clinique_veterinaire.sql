-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 07, 2020 at 09:02 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clinique_veterinaire`
--
CREATE DATABASE IF NOT EXISTS `clinique_veterinaire` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `clinique_veterinaire`;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateDeces` date NOT NULL,
  `idProprietaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `idAnimal` int(11) NOT NULL,
  `idRace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chien`
--

CREATE TABLE `chien` (
  `idAnimal` int(11) NOT NULL,
  `taille` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `poids` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idRace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dossier`
--

CREATE TABLE `dossier` (
  `id` int(11) NOT NULL,
  `antecedents` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `effectuer`
--

CREATE TABLE `effectuer` (
  `idGarde` int(11) NOT NULL,
  `idVeterinaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `garde`
--

CREATE TABLE `garde` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure_debut` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `heure_fin` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `horaire`
--

CREATE TABLE `horaire` (
  `id` int(11) NOT NULL,
  `jour` date NOT NULL,
  `heure_debut` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `heure_fin` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicament`
--

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dosage` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `indications` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `effetsSecondaires` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `laboratoire` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescrire`
--

CREATE TABLE `prescrire` (
  `idVisite` int(11) NOT NULL,
  `idMedicament` int(11) NOT NULL,
  `posologie` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prénom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rue` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `codepostal` int(11) NOT NULL,
  `ville` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telephone` int(11) NOT NULL,
  `telephoneMobile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `race_chat`
--

CREATE TABLE `race_chat` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `race_chien`
--

CREATE TABLE `race_chien` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `veterinaire`
--

CREATE TABLE `veterinaire` (
  `id` int(11) NOT NULL,
  `nom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prénom` text NOT NULL,
  `telephone` int(11) NOT NULL,
  `telephoneMobile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visite`
--

CREATE TABLE `visite` (
  `id` int(11) NOT NULL,
  `dateVisite` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `heureVisite` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `raison` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idDossier` int(11) NOT NULL,
  `idAnimal` int(11) NOT NULL,
  `idVeterinaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `IDPROPRIETAIRE` (`idProprietaire`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD KEY `IDANIMAL` (`idAnimal`) USING BTREE,
  ADD KEY `IDRACE` (`idRace`);

--
-- Indexes for table `chien`
--
ALTER TABLE `chien`
  ADD KEY `IDANIMAL` (`idAnimal`),
  ADD KEY `IDRACE` (`idRace`);

--
-- Indexes for table `dossier`
--
ALTER TABLE `dossier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `effectuer`
--
ALTER TABLE `effectuer`
  ADD KEY `IDGARDE` (`idGarde`),
  ADD KEY `IDVETERINAIRE` (`idVeterinaire`);

--
-- Indexes for table `garde`
--
ALTER TABLE `garde`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horaire`
--
ALTER TABLE `horaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescrire`
--
ALTER TABLE `prescrire`
  ADD KEY `IDVISITE` (`idVisite`),
  ADD KEY `IDMEDICAMENT` (`idMedicament`);

--
-- Indexes for table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `race_chat`
--
ALTER TABLE `race_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `race_chien`
--
ALTER TABLE `race_chien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `veterinaire`
--
ALTER TABLE `veterinaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDDOSSIER` (`idDossier`) USING BTREE,
  ADD KEY `IDVETERINAIRE` (`idVeterinaire`) USING BTREE,
  ADD KEY `IDANIMAL` (`idAnimal`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`idProprietaire`) REFERENCES `proprietaire` (`id`);

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`idRace`) REFERENCES `race_chat` (`id`);

--
-- Constraints for table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `chien_ibfk_1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `chien_ibfk_2` FOREIGN KEY (`idRace`) REFERENCES `race_chien` (`id`);

--
-- Constraints for table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `effectuer_ibfk_1` FOREIGN KEY (`idGarde`) REFERENCES `garde` (`id`),
  ADD CONSTRAINT `effectuer_ibfk_2` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`id`);

--
-- Constraints for table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `prescrire_ibfk_1` FOREIGN KEY (`idMedicament`) REFERENCES `medicament` (`id`),
  ADD CONSTRAINT `prescrire_ibfk_2` FOREIGN KEY (`idVisite`) REFERENCES `visite` (`id`);

--
-- Constraints for table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`idDossier`) REFERENCES `dossier` (`id`),
  ADD CONSTRAINT `visite_ibfk_2` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `visite_ibfk_3` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`id`);
