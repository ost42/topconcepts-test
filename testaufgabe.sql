-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jan 2019 um 15:24
-- Server-Version: 10.1.36-MariaDB
-- PHP-Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `testaufgabe`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kat`
--

CREATE TABLE `kat` (
  `id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kat`
--

INSERT INTO `kat` (`id`, `title`) VALUES
(1, 'Development'),
(2, 'Sex, Drugs, Rock N Roll'),
(3, 'Apronym'),
(4, 'Wirtschaft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `cont` text NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`id`, `title`, `cont`, `uid`, `kid`, `datum`, `sort`) VALUES
(2, 'Der Big-Mac-Index', 'Der Big-Mac-Index ist ein In­di­ka­tor, der die Kauf­kraft ver­schie­de­ner Wäh­run­gen an­hand der Prei­se für einen Big Mac in ver­schie­de­nen Län­dern ver­gleicht.\nEr wur­de 1986 von der bri­ti­schen Wo­chen­zei­tung The Eco­no­mist er­fun­den, um einen leicht ver­ständ­li­chen Wäh­rungs­ver­gleich auf Ba­sis von Kauf­kraft­pa­ri­tä­ten zu er­mög­li­chen und Über- und Un­ter­be­wer­tun­gen ein­zel­ner Wäh­run­gen auf­zu­zei­gen. Seit­dem wird er re­gel­mäßig er­ho­ben und auch in wis­sen­schaft­li­chen Stu­di­en und Lehr­bü­chern zi­tiert. Da­zu wer­den die Prei­se eines Big Macs, eines Cheese­bur­gers von Mc­Do­nald’s, in den lo­ka­len Wäh­run­gen ver­schie­de­ner Län­der er­ho­ben.\nDurch die Um­rech­nung der je­wei­li­gen Wäh­rung zum ak­tu­el­len US-Dol­lar-Kurs wird die Kauf­kraft der Wäh­run­gen ver­ein­fa­chend mit­ei­nan­der ver­gli­chen. Der Big Mac wird hier als ein ein­fa­cher In­di­ka­tor für die Kauf­kraft einer Wäh­rung he­ran­ge­zo­gen, weil es ihn in vie­len Län­dern der Welt in stan­dar­di­sier­ter Größe, Zu­sam­men­setzung und Qua­li­tät gibt. Hin­ter dem Wäh­rungs­ver­gleich steht die An­nahme, dass sich die Prei­se für ein iden­ti­sches Gut auf lan­ge Sicht in al­len Län­dern an­glei­chen.', 1, 4, '2019-01-15 12:04:46', 2),
(3, 'SCRUM', 'Agile Softwareentwicklung bezeichnet Ansätze im Softwareentwicklungsprozess, die die Transparenz und Flexibilität erhöhen und zu einem schnelleren Einsatz der entwickelten Systeme führen sollen, um so Risiken im Entwicklungsprozess zu minimieren.\n\nJe nach Kontext bezieht sich der Begriff auf Teilbereiche der Softwareentwicklung – wie im Fall von Agile Modeling – oder auf den gesamten Softwareentwicklungsprozess – exemplarisch sei Extreme Programming oder Scrum aufgeführt. Agile Softwareentwicklung zeichnet sich durch selbstorganisierende Teams sowie eine iterative und inkrementelle Vorgehensweise aus.\nEs wird versucht, mit geringem bürokratischem Aufwand und Regeln auszukommen und sich schnell an Veränderungen anzupassen, ohne dabei das Risiko für Fehler zu erhöhen.', 2, 1, '2019-01-15 15:52:55', 4),
(4, 'KISS', 'Das KISS-Prinzip (englisch Keep it simple, stupid) fordert, zu einem Problem eine möglichst einfache Lösung anzustreben.\nIn seiner Grundaussage ähnelt das KISS-Prinzip stark der Aussage von Ockhams Rasiermesser:\nWenn es mehrere Erklärungen für einen bestimmten Sachverhalt gibt, dann ist diejenige Erklärung zu bevorzugen, die am einfachsten ist, also mit denwenigsten Annahmen und Variablen auskommt.', 3, 3, '2019-01-15 15:53:39', 8),
(35, 'Björk', 'Björk ist ein isländischer und schwedischer weiblicher Vorname und bedeutet „Birke“. Die norwegische Variante des Namens und Baumes ist Bjørk. Der Name Björk ist auch einer der häufigsten schwedischen Familiennamen.\n\nIm Dänischen ist der Name Björk ursprünglich ein männlicher Vorname und eine Entlehnung aus dem Schwedischen, dessen weibliche Form Björg lautete. Heute wird Björk in Dänemark auch als weiblicher Vorname verwendet. Parallel existiert dort die norwegische Form des Vornamens Bjørk ebenso als männlicher und weiblicher Vorname sowie Bjørg wiederum nur in der weiblichen Form. Die Birke heißt im Dänischen Birk, weshalb dort auch diese seltene Variante als männlicher Vorname existiert, der sich auch im Deutschen wiederfindet.', 2, 2, '2019-01-16 15:20:11', 10),
(36, 'Rima Hadley', 'Die Rima Hadley ist eine Mondrille auf der Mondvorderseite am östlichen Rand des Palus Putredinis am Fuß der Montes Apenninus. Die Rille ist die am besten erforschte Mondrille, da die Apollo-15-Mission in unmittelbarer Nähe landete.\nDie Rille ist stellenweise circa 1,5 km breit und zwischen 180 und 270 m tief.\nAstronaut David Scott hinterließ hier eine Skulptur und eine Plakette die an die Astronauten erinnern soll, die auf Missionen oder im Training starben.', 1, 0, '2019-01-16 15:21:46', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'Charles Bukowski'),
(2, 'Oliver'),
(3, 'Philip K. Dick'),
(4, 'Frank Herbert');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `kat`
--
ALTER TABLE `kat`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `kid` (`kid`),
  ADD KEY `sort` (`sort`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `kat`
--
ALTER TABLE `kat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
