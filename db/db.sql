SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `intshopbase`
--
CREATE DATABASE IF NOT EXISTS `intshopbase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `intshopbase`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Admins`
--

DROP TABLE IF EXISTS `Admins`;
CREATE TABLE IF NOT EXISTS `Admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Items`
--

DROP TABLE IF EXISTS `Items`;
CREATE TABLE IF NOT EXISTS `Items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(7,2) NOT NULL DEFAULT '0.00',
  `description` text NOT NULL,
  `quantity` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `Items`
--

INSERT INTO `Items` (`id`, `name`, `price`, `description`, `quantity`) VALUES
(1, 'test product', 12.40, 'This is just a test product''s description', 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ItemsPics`
--

DROP TABLE IF EXISTS `ItemsPics`;
CREATE TABLE IF NOT EXISTS `ItemsPics` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `itemId` int(10) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`itemId`) REFERENCES Items(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`id`, `name`, `surname`, `email`, `password`) VALUES
(1, 'testname', 'testsurname', 'test@mail.pl', 'hashedpass');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `itemId` int(11) NOT NULL,
  `itemAmount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (itemId) REFERENCES Items(id) ON DELETE CASCADE,
  FOREIGN KEY (userId) REFERENCES Users(id) ON DELETE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
