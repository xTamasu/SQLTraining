/* SQL by Lukas Klepper, 04.07.2021 10BE10 */

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `busunternehmen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;/*GRANT ALL PRIVILEGES ON `busunternehmen`.* TO 'busunternehmen'@'localhost'*/;

CREATE USER 'busunternehmen'@'%' IDENTIFIED BY 'jäckel'; 

GRANT ALL PRIVILEGES ON `busunternehmen`.* TO 'busunternehmen'@'%';

FLUSH PRIVILEGES;

--
-- Datenbank: `busunternehmen`
--
USE `busunternehmen`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bucht`
--

CREATE TABLE `Bucht` (
  `BuchtNr` int(11) NOT NULL,
  `FahrtNr` int(11) NOT NULL,
  `KundenNr` int(11) NOT NULL,
  `GebuchtePlätze` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bucht`
--

INSERT INTO `Bucht` (`BuchtNr`, `FahrtNr`, `KundenNr`, `GebuchtePlätze`) VALUES
(1, 1, 3, 6),
(2, 2, 6, 7),
(3, 3, 2, 2),
(4, 4, 1, 3),
(5, 5, 5, 5),
(6, 6, 6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bus`
--

CREATE TABLE `Bus` (
  `Kennzeichen` varchar(128) NOT NULL,
  `Bustyp` varchar(128) NOT NULL,
  `Baujahr` smallint(6) NOT NULL,
  `Sitzplätze` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bus`
--

INSERT INTO `Bus` (`Kennzeichen`, `Bustyp`, `Baujahr`, `Sitzplätze`) VALUES
('DA-AB 123', 'Volkswagen 7HM', 1997, 20),
('DA-KK 007', 'Mercedes Benz O 345', 1983, 40),
('F-AZ 1234', 'Mercedes Benz O 303', 2000, 50),
('F-FH 1059', 'Mercedes Benz O 510', 2003, 55),
('HH-BV 775', 'Volvo Sideral', 2005, 60),
('MA-IN 248', 'Mercedes Benz O 135', 2009, 70);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fahrer`
--

CREATE TABLE `Fahrer` (
  `Personalnummer` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Vorname` varchar(128) NOT NULL,
  `StraßeNr` varchar(128) NOT NULL,
  `PLZ` varchar(32) NOT NULL,
  `Ort` varchar(128) NOT NULL,
  `Telefon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Fahrer`
--

INSERT INTO `Fahrer` (`Personalnummer`, `Name`, `Vorname`, `StraßeNr`, `PLZ`, `Ort`, `Telefon`) VALUES
(1, 'Meier', 'Manfred', 'Maintalstr 5', '69546', 'Mannheim', '06958/512385'),
(2, 'Müller', 'Doris', 'Neue Str 3', '69553', 'Erfelden', '06253/654127'),
(3, 'Scharf', 'Wilhelm', 'Erfelderstr 136', '66659', 'Leeheim', '06157/12399'),
(4, 'Niemand', 'Josef', 'Seeheimerstr 24', '64297', 'Darmstadt-Eberstadt', '06151/517989'),
(5, 'Grieser', 'Bianca', 'Friedrich-Ebert-Str 55', '64342', 'Seeheim-Jugenheim', '06257/095509'),
(6, 'Mayer', 'Daniel', 'Heinrichstr 174', '64287', 'Darmstadt', '06151/18564');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fahrt`
--

CREATE TABLE `Fahrt` (
  `FahrtNr` int(11) NOT NULL,
  `Kennzeichen` varchar(128) NOT NULL,
  `PersonalNr` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Preis` double NOT NULL,
  `Dauer` int(11) NOT NULL,
  `Reisestart` varchar(128) NOT NULL,
  `Reiseziel` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Fahrt`
--

INSERT INTO `Fahrt` (`FahrtNr`, `Kennzeichen`, `PersonalNr`, `Datum`, `Preis`, `Dauer`, `Reisestart`, `Reiseziel`) VALUES
(1, 'MA-IN 248', 2, '2013-06-21', 85.5, 50, 'Mannheim', 'Mannheim'),
(2, 'MA-IN 248', 3, '2014-03-13', 32.5, 540, 'Bern', 'Berlin'),
(3, 'DA-AB 123', 4, '2012-06-18', 31.95, 330, 'München', 'Dortmund'),
(4, 'HH-BV 775', 1, '2014-04-12', 199.99, 2400, 'Madrid', 'Moskau'),
(5, 'F-AZ 1234', 2, '2015-01-04', 24.99, 240, 'Jena', 'Köln'),
(6, 'DA-KK 007', 6, '2013-08-08', 64.5, 600, 'Darmstadt', 'Cannes'),
(7, 'F-FH 1059', 5, '2014-03-28', 33, 300, 'Worms', 'Hamburg'),
(8, 'F-AZ 1234', 4, '2013-08-18', 52.6, 840, 'Florenz', 'Darmstadt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kunde`
--

CREATE TABLE `Kunde` (
  `KundenNr` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Nachname` varchar(128) NOT NULL,
  `StraßeNr` varchar(128) NOT NULL,
  `PLZ` varchar(32) NOT NULL,
  `Ort` varchar(128) NOT NULL,
  `Telefon` varchar(128) NOT NULL,
  `Stammkunde` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kunde`
--

INSERT INTO `Kunde` (`KundenNr`, `Name`, `Nachname`, `StraßeNr`, `PLZ`, `Ort`, `Telefon`, `Stammkunde`) VALUES
(1, 'Nico', 'Beck', 'Am Kaiserschlag 20', '64358', 'Darmstadt', '06151/789456', 1),
(2, 'Johannes', 'Struve', 'Von-Kettler-Str.9', '64297', 'Darmstadt-Eberstadt', '06151/123456', 0),
(3, 'Denis', 'Pelzer', 'Erfurterstr. 29', '64372', 'Ober-Ramstadt', '06154/421237', 0),
(4, 'Lukas', 'Frech', 'Carl-Ullrich-Str. 52', '64297', 'Eberstadt', '06151/466347', 0),
(5, 'Dominik', 'Wach', 'Woogstr. 5', '64367', 'Mühltal', '06151/979541', 1),
(6, 'Martin', 'Wurz', 'Spessartstr. 3', '64560', 'Riedstadt', '06158/50379', 1),
(7, 'Robert', 'Christ', 'Asternweg 7', '64291', 'Darmstadt', '06151/76873', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Bucht`
--
ALTER TABLE `Bucht`
  ADD PRIMARY KEY (`BuchtNr`),
  ADD KEY `FahrtNr` (`FahrtNr`),
  ADD KEY `KundenNr` (`KundenNr`);

--
-- Indizes für die Tabelle `Bus`
--
ALTER TABLE `Bus`
  ADD PRIMARY KEY (`Kennzeichen`);

--
-- Indizes für die Tabelle `Fahrer`
--
ALTER TABLE `Fahrer`
  ADD PRIMARY KEY (`Personalnummer`);

--
-- Indizes für die Tabelle `Fahrt`
--
ALTER TABLE `Fahrt`
  ADD PRIMARY KEY (`FahrtNr`),
  ADD KEY `PersonalNr` (`PersonalNr`),
  ADD KEY `Kennzeichen` (`Kennzeichen`);

--
-- Indizes für die Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD PRIMARY KEY (`KundenNr`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Fahrer`
--
ALTER TABLE `Fahrer`
  MODIFY `Personalnummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `Fahrt`
--
ALTER TABLE `Fahrt`
  MODIFY `FahrtNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  MODIFY `KundenNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Bucht`
--
ALTER TABLE `Bucht`
  ADD CONSTRAINT `bucht_ibfk_1` FOREIGN KEY (`KundenNr`) REFERENCES `Kunde` (`KundenNr`),
  ADD CONSTRAINT `bucht_ibfk_2` FOREIGN KEY (`FahrtNr`) REFERENCES `Fahrt` (`FahrtNr`);

--
-- Constraints der Tabelle `Fahrt`
--
ALTER TABLE `Fahrt`
  ADD CONSTRAINT `fahrt_ibfk_1` FOREIGN KEY (`Kennzeichen`) REFERENCES `Bus` (`Kennzeichen`),
  ADD CONSTRAINT `fahrt_ibfk_2` FOREIGN KEY (`PersonalNr`) REFERENCES `Fahrer` (`Personalnummer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
