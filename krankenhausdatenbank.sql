-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Oca 2022, 23:26:53
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `krankenhausdatabase`
--
CREATE DATABASE IF NOT EXISTS `krankenhausdatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `krankenhausdatabase`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `abteilung`
--

CREATE TABLE `abteilung` (
  `Abteilung_ID` int(11) NOT NULL,
  `Abteilungsname` varchar(255) NOT NULL,
  `Terminendauer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `abteilung`
--

INSERT INTO `abteilung` (`Abteilung_ID`, `Abteilungsname`, `Terminendauer`) VALUES
(1, 'Innere Medizin', 30),
(2, 'Urologie', 30),
(3, 'HNO', 20),
(4, 'Orthopädie', 20),
(5, 'Angiologie', 30),
(6, 'Pneumologie', 20),
(7, 'Kardiologie', 30),
(8, 'Neurologie', 20),
(9, 'Hepatologie', 30),
(10, 'Radiologie', 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `arzt`
--

CREATE TABLE `arzt` (
  `Arzt_ID` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Abteilung_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `arzt`
--

INSERT INTO `arzt` (`Arzt_ID`, `Name`, `Vorname`, `Abteilung_ID`) VALUES
(1, 'Kurt', 'Yaren', 1),
(2, 'Plüton', 'Berkay', 2),
(3, 'Ay', 'Can', 3),
(4, 'Aslan', 'Mehmet', 5),
(5, 'Akbulut', 'İsmet', 6),
(6, 'Şaşmaz', 'Semih', 8),
(7, 'Çebi', 'Mehmet', 9),
(8, 'Yurt', 'İrem', 7),
(9, 'Baran', 'Reyhan', 4),
(10, 'Demir', 'Yusuf', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `arzt_patient`
--

CREATE TABLE `arzt_patient` (
  `Arzt_Patient_ID` int(10) NOT NULL,
  `Arzt_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `arzt_patient`
--

INSERT INTO `arzt_patient` (`Arzt_Patient_ID`, `Arzt_ID`, `Patient_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 1),
(5, 10, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bekannte_krankheit`
--

CREATE TABLE `bekannte_krankheit` (
  `Krankheit_ID` int(10) NOT NULL,
  `Krankheit_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `bekannte_krankheit`
--

INSERT INTO `bekannte_krankheit` (`Krankheit_ID`, `Krankheit_Name`) VALUES
(1, 'Rhythmusstörung'),
(2, 'Nierenkrebs'),
(3, 'Hernie'),
(4, 'Migräne'),
(5, 'Diabetes'),
(6, 'Herpes'),
(7, 'Leukämie'),
(8, 'Scharlach'),
(9, 'Schilddrüsenunterfunktion'),
(10, 'Schizophrenie');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chefarzt`
--

CREATE TABLE `chefarzt` (
  `Chefarzt_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Kh_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `chefarzt`
--

INSERT INTO `chefarzt` (`Chefarzt_ID`, `Name`, `Vorname`, `Kh_ID`) VALUES
(1, 'Yurdagul', 'Devrim', 1),
(2, 'Berk', 'Sedat', 2),
(3, 'Cankurtaran', 'Ali', 3),
(4, 'Karaman', 'Bilal', 4),
(5, 'Çatakçın', 'Alper', 5),
(6, 'Sarı', 'Rezzan', 6),
(7, 'Aksu', 'Sezan', 7),
(8, 'Güney', 'Çakır', 8),
(9, 'Toros', 'Kenan', 9),
(10, 'Ahmet', 'Kural', 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `krankenhaus`
--

CREATE TABLE `krankenhaus` (
  `Kh-ID` int(11) NOT NULL,
  `Telefonnummer` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `krankenhaus`
--

INSERT INTO `krankenhaus` (`Kh-ID`, `Telefonnummer`, `Name`) VALUES
(1, 1231213, 'Hasan Krankenhaus'),
(2, 1231212, 'Erdem Krankenhaus'),
(3, 1231215, 'Beykoz Krankenhaus'),
(4, 1231214, 'İstanbul Krankenhaus'),
(5, 1111111, 'Üsküdar Krankenhaus'),
(6, 2222222, 'Sedat Devrim Krankenhaus'),
(7, 3333333, 'Devrim Krankenhaus'),
(8, 7777777, 'İrem Krankenhaus'),
(9, 8888888, 'Yurdagül Krankenhaus'),
(10, 9999999, 'Ömer Faruk Krankenhaus'),
(11, 1511121, 'Migreno Krankenhaus');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `krankenhaus_abteilung`
--

CREATE TABLE `krankenhaus_abteilung` (
  `Kh_Ab_ID` int(11) NOT NULL,
  `Kh_ID` int(11) NOT NULL,
  `Abteilung_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `krankenhaus_abteilung`
--

INSERT INTO `krankenhaus_abteilung` (`Kh_Ab_ID`, `Kh_ID`, `Abteilung_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(5, 1, 3),
(6, 3, 2),
(7, 7, 2),
(8, 8, 9),
(9, 9, 8),
(10, 10, 10),
(11, 11, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medikament`
--

CREATE TABLE `medikament` (
  `Medikament_ID` int(10) NOT NULL,
  `Wirkstoff` varchar(255) NOT NULL,
  `Preis` float NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `medikament`
--

INSERT INTO `medikament` (`Medikament_ID`, `Wirkstoff`, `Preis`, `Patient_ID`) VALUES
(1, 'Parasetamol', 10, 1),
(2, 'Parasetamol', 10, 2),
(3, 'Calpol', 20, 3),
(4, 'Ventolin', 80, 4),
(5, 'Arveles', 20, 5),
(6, 'Parasetamol', 20, 6),
(7, 'Calpol', 20, 7),
(8, 'Dolorex', 20, 8),
(9, 'Majezik', 20, 9),
(10, 'Aspirin', 20, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(10) NOT NULL,
  `Blutgruppe` varchar(3) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Versicherung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `patient`
--

INSERT INTO `patient` (`Patient_ID`, `Blutgruppe`, `Name`, `Vorname`, `Versicherung`) VALUES
(1, 'A+', 'Uranüs', 'Fatma', 'SGK'),
(2, 'AB+', 'Jüpiter', 'Ayşe', 'SSK'),
(3, 'B-', 'Gün', 'İnci', 'SGK'),
(4, 'B+', 'Yakuza', 'Yakup', 'SSK'),
(5, 'B-', 'Galaksi', 'Selin', 'SGK'),
(6, 'AB-', 'Laz', 'Ahmet', 'SSK'),
(7, 'A+', 'Güneş', 'İsmail', 'SSK'),
(8, '0+', 'Telefon', 'Mehmet', 'SGK'),
(9, '0-', 'Can', 'Alperen', 'SSK'),
(10, 'AB-', 'Han', 'Ramazan', 'SSK');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient_krankheit`
--

CREATE TABLE `patient_krankheit` (
  `Patient_Krankheit_ID` int(11) NOT NULL,
  `Krankheit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `patient_krankheit`
--

INSERT INTO `patient_krankheit` (`Patient_Krankheit_ID`, `Krankheit_ID`, `Patient_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 1, 2),
(7, 6, 6),
(8, 7, 7),
(9, 8, 8),
(10, 9, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rechnung`
--

CREATE TABLE `rechnung` (
  `Rechnung_ID` int(11) NOT NULL,
  `Gesamtsumme` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `rechnung`
--

INSERT INTO `rechnung` (`Rechnung_ID`, `Gesamtsumme`, `Patient_ID`) VALUES
(1, 10, 1),
(2, 20, 2),
(3, 30, 3),
(4, 40, 1),
(5, 30, 1),
(6, 20, 1),
(7, 50, 5),
(8, 70, 6),
(9, 50, 8),
(10, 50, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rezept`
--

CREATE TABLE `rezept` (
  `Rezept_ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Arzt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `rezept`
--

INSERT INTO `rezept` (`Rezept_ID`, `Datum`, `Patient_ID`, `Arzt_ID`) VALUES
(1, '2022-10-01', 1, 2),
(2, '2022-05-01', 2, 3),
(3, '2022-11-02', 4, 5),
(4, '2022-11-03', 5, 4),
(5, '2022-11-04', 6, 7),
(6, '2022-11-05', 7, 8),
(7, '2022-11-06', 8, 9),
(8, '2022-11-07', 9, 10),
(9, '2022-11-08', 10, 3),
(10, '2022-11-01', 3, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `termin`
--

CREATE TABLE `termin` (
  `Termin_ID` int(11) NOT NULL,
  `Diagnose` varchar(255) DEFAULT NULL,
  `Zeit` time NOT NULL,
  `Datum` date NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Arzt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `termin`
--

INSERT INTO `termin` (`Termin_ID`, `Diagnose`, `Zeit`, `Datum`, `Patient_ID`, `Arzt_ID`) VALUES
(1, 'Nierenstein', '09:30:00', '2022-12-01', 2, 1),
(2, NULL, '12:30:00', '2022-12-01', 3, 1),
(3, NULL, '15:30:00', '2022-12-01', 4, 1),
(4, NULL, '16:30:00', '0000-00-00', 5, 1),
(5, NULL, '15:30:00', '0000-00-00', 6, 2),
(6, NULL, '16:30:00', '0000-00-00', 7, 3),
(7, NULL, '13:30:00', '0000-00-00', 8, 4),
(8, NULL, '14:30:00', '0000-00-00', 9, 10),
(9, NULL, '17:30:00', '0000-00-00', 10, 5),
(10, NULL, '10:30:00', '0000-00-00', 5, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `test`
--

CREATE TABLE `test` (
  `Test_ID` int(10) NOT NULL,
  `Testgruppe` varchar(255) NOT NULL,
  `Ergebnis` varchar(255) NOT NULL,
  `Preis` float NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `test`
--

INSERT INTO `test` (`Test_ID`, `Testgruppe`, `Ergebnis`, `Preis`, `Patient_ID`) VALUES
(1, 'Hormon', 'Sonuç', 20, 1),
(2, 'Blutgruppentest', 'Ergebnis', 15, 2),
(3, 'Röntgen', 'Ergebnis', 30, 3),
(4, 'Blutgruppentest', 'Erg', 15, 4),
(5, 'Blutgruppentest', 'Erg', 15, 6),
(6, 'Röntgen', 'Erg', 30, 7),
(7, 'Blutgruppentest', 'Erg', 15, 8),
(8, 'Blutgruppentest', 'Erg', 15, 9),
(9, 'Hormon', 'Erg', 20, 10),
(10, 'Blutgruppentest', 'Erg', 15, 5);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `abteilung`
--
ALTER TABLE `abteilung`
  ADD PRIMARY KEY (`Abteilung_ID`);

--
-- Tablo için indeksler `arzt`
--
ALTER TABLE `arzt`
  ADD PRIMARY KEY (`Arzt_ID`),
  ADD KEY `Abteilung_ID` (`Abteilung_ID`);

--
-- Tablo için indeksler `arzt_patient`
--
ALTER TABLE `arzt_patient`
  ADD PRIMARY KEY (`Arzt_Patient_ID`),
  ADD KEY `Arzt_ID` (`Arzt_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Tablo için indeksler `bekannte_krankheit`
--
ALTER TABLE `bekannte_krankheit`
  ADD PRIMARY KEY (`Krankheit_ID`);

--
-- Tablo için indeksler `chefarzt`
--
ALTER TABLE `chefarzt`
  ADD PRIMARY KEY (`Chefarzt_ID`),
  ADD KEY `Kh_ID` (`Kh_ID`);

--
-- Tablo için indeksler `krankenhaus`
--
ALTER TABLE `krankenhaus`
  ADD PRIMARY KEY (`Kh-ID`);

--
-- Tablo için indeksler `krankenhaus_abteilung`
--
ALTER TABLE `krankenhaus_abteilung`
  ADD PRIMARY KEY (`Kh_Ab_ID`),
  ADD KEY `Abteilung_ID` (`Abteilung_ID`),
  ADD KEY `Kh_ID` (`Kh_ID`);

--
-- Tablo için indeksler `medikament`
--
ALTER TABLE `medikament`
  ADD PRIMARY KEY (`Medikament_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Tablo için indeksler `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Tablo için indeksler `patient_krankheit`
--
ALTER TABLE `patient_krankheit`
  ADD PRIMARY KEY (`Patient_Krankheit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Krankheit_ID` (`Krankheit_ID`);

--
-- Tablo için indeksler `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`Rechnung_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Tablo için indeksler `rezept`
--
ALTER TABLE `rezept`
  ADD PRIMARY KEY (`Rezept_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Arzt_ID` (`Arzt_ID`);

--
-- Tablo için indeksler `termin`
--
ALTER TABLE `termin`
  ADD PRIMARY KEY (`Termin_ID`),
  ADD KEY `Arzt_ID` (`Arzt_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Tablo için indeksler `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `abteilung`
--
ALTER TABLE `abteilung`
  MODIFY `Abteilung_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `arzt`
--
ALTER TABLE `arzt`
  MODIFY `Arzt_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `arzt_patient`
--
ALTER TABLE `arzt_patient`
  MODIFY `Arzt_Patient_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `bekannte_krankheit`
--
ALTER TABLE `bekannte_krankheit`
  MODIFY `Krankheit_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `chefarzt`
--
ALTER TABLE `chefarzt`
  MODIFY `Chefarzt_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `krankenhaus`
--
ALTER TABLE `krankenhaus`
  MODIFY `Kh-ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `krankenhaus_abteilung`
--
ALTER TABLE `krankenhaus_abteilung`
  MODIFY `Kh_Ab_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `medikament`
--
ALTER TABLE `medikament`
  MODIFY `Medikament_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `patient`
--
ALTER TABLE `patient`
  MODIFY `Patient_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `patient_krankheit`
--
ALTER TABLE `patient_krankheit`
  MODIFY `Patient_Krankheit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `Rechnung_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `rezept`
--
ALTER TABLE `rezept`
  MODIFY `Rezept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `termin`
--
ALTER TABLE `termin`
  MODIFY `Termin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `test`
--
ALTER TABLE `test`
  MODIFY `Test_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `arzt`
--
ALTER TABLE `arzt`
  ADD CONSTRAINT `arzt_ibfk_1` FOREIGN KEY (`Abteilung_ID`) REFERENCES `abteilung` (`Abteilung_ID`);

--
-- Tablo kısıtlamaları `arzt_patient`
--
ALTER TABLE `arzt_patient`
  ADD CONSTRAINT `arzt_patient_ibfk_1` FOREIGN KEY (`Arzt_ID`) REFERENCES `arzt` (`Arzt_ID`),
  ADD CONSTRAINT `arzt_patient_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Tablo kısıtlamaları `chefarzt`
--
ALTER TABLE `chefarzt`
  ADD CONSTRAINT `chefarzt_ibfk_1` FOREIGN KEY (`Kh_ID`) REFERENCES `krankenhaus` (`Kh-ID`);

--
-- Tablo kısıtlamaları `krankenhaus_abteilung`
--
ALTER TABLE `krankenhaus_abteilung`
  ADD CONSTRAINT `krankenhaus_abteilung_ibfk_1` FOREIGN KEY (`Abteilung_ID`) REFERENCES `abteilung` (`Abteilung_ID`),
  ADD CONSTRAINT `krankenhaus_abteilung_ibfk_2` FOREIGN KEY (`Kh_ID`) REFERENCES `krankenhaus` (`Kh-ID`);

--
-- Tablo kısıtlamaları `medikament`
--
ALTER TABLE `medikament`
  ADD CONSTRAINT `medikament_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Tablo kısıtlamaları `patient_krankheit`
--
ALTER TABLE `patient_krankheit`
  ADD CONSTRAINT `patient_krankheit_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `patient_krankheit_ibfk_2` FOREIGN KEY (`Krankheit_ID`) REFERENCES `bekannte_krankheit` (`Krankheit_ID`);

--
-- Tablo kısıtlamaları `rechnung`
--
ALTER TABLE `rechnung`
  ADD CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Tablo kısıtlamaları `rezept`
--
ALTER TABLE `rezept`
  ADD CONSTRAINT `rezept_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `rezept_ibfk_2` FOREIGN KEY (`Arzt_ID`) REFERENCES `arzt` (`Arzt_ID`);

--
-- Tablo kısıtlamaları `termin`
--
ALTER TABLE `termin`
  ADD CONSTRAINT `termin_ibfk_1` FOREIGN KEY (`Arzt_ID`) REFERENCES `arzt` (`Arzt_ID`),
  ADD CONSTRAINT `termin_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Tablo kısıtlamaları `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
