-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 15. Jul 2024 um 20:50
-- Server-Version: 5.7.39
-- PHP-Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `EBEWD2_CR6_bigEventsIlianaMarquez`
--
CREATE DATABASE IF NOT EXISTS `EBEWD2_CR6_bigEventsIlianaMarquez` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `EBEWD2_CR6_bigEventsIlianaMarquez`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `contact_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`id`, `name`, `date_time`, `description`, `image`, `capacity`, `contact_email`, `contact_phone`, `street_name`, `street_number`, `zipcode`, `city`, `country`, `link`, `category`) VALUES
(1, 'Adele in Münich', '2024-08-02 19:30:00', 'Adele will perform in an open-air environment that has been exclusively created for these special shows. The bespoke arena will feature a combination of seated grandstands and standing areas with capacity for 80,000 people per night. “A one off, bespoke pop up stadium designed around whatever show I want to put on?” Adele noted on her Instagram.  She went on to say “I couldn’t think of a more wonderful way to spend my summer.”  These exclusive European dates mark the first time Adele has played mainland Europe since 2016.', 'https://www.nbc.com/sites/nbcblog/files/2022/03/special-adele-evening4.jpg', 50000, 'ticketmaster@germany.de', 'n.a.', 'Paul-Henri-Spaak-Straße', 'n.a.', '81829', 'Münich', 'Germany', 'https://www.ticketmaster.de/event/adele-in-munich-tickets/535121?language=en-us', 'Concert'),
(3, 'ROCK ME AMADEUS', '2024-09-17 18:30:00', 'A homage to the exceptional Austrian artist\n\nHe was a superstar - he was popular. The latest VBW in-house production tells the exciting and moving story of the young Viennese musician Hans Hölzel and his rise to world stardom in a spectacular and at the same time touching new musical created especially for Vienna by top international creatives. With over 60 million records sold, numerous number 1 hits and songs in hit parades in 27 countries, Falco is still one of the most successful pop stars in Europe.\nEmotions, successes, escapades - Falco as an artist and a person\n\nROCK ME AMADEUS - THE FALCO MUSICAL is a homage to the exceptional Austrian artist and pays tribute to Falco as an artist and person. It was developed in cooperation with the Falco Private Foundation and Falco\'s long-time companions. His career started in the underground clubs of Vienna in the 80s. The self-created artificial figure \"Falco\", his unforgettable songs as well as his eccentric and charismatic appearance made him world-famous in a very short time. In addition to Falco\'s greatest hits, the audience can expect an exciting journey through emotions, successes, escapades and the ever-recurring conflict of \"Falco\", which promises deep insights into his innermost being.', 'https://www.musicalvienna.at/media/image/c1280x680/22680.jpg', 2000, 'info@vbw.at', '+43 1 588 30 1', 'Seilerstätte', '9', '1010', 'Vienna', 'Austria', 'https://www.musicalvienna.at/en/schedule-and-tickets/schedule/production/1062/ROCK-ME-AMADEUS-THE-FALCO-MUSICAL/calendar', 'Performing Arts'),
(4, 'La Traviata', '2024-09-06 19:00:00', 'Opera in 3 acts, \n\nLa traviata erzählt die Geschichte von Violetta Valéry, einem käuflichen Wunschobjekt der Pariser Gesellschaft, die in Alfredo ihre Liebe findet, aber dem gesellschaftlichen Dünkel seines Vaters nachgibt und sich von ihm trennt. \n\nIn seiner mit riesigen Videowänden und den sozialen Medien spektakulär jonglierenden Inszenierung verlegt Simon Stone diese Geschichte ins Heute. Violetta, das ist ein Pariser It-Girl, eine Influencerin, die in der Instagram-Blase gefangen bleibt und deren Leben der virtuellen Präsentations- und Schaugier ausgeliefert ist. Einsam im Öffentlichen ist sie – und eine Außenseiterin.', 'https://kalender.wiener-staatsoper.at/files/Produktionen/1_Oper/La_Traviata/Saison_23-24/10_Okt/La_Traviata_1__9_.jpg?crop=fp,0.51,0.37&width=977&height=418&quality=100', 5000, 'information@wiener-staatsoper.at', '+43 1 514 44 22', 'Opernring', '2', '1010', 'Vienna', 'Austria', 'https://kalender.wiener-staatsoper.at/files/Produktionen/1_Oper/La_Traviata/Saison_23-24/10_Okt/La_Traviata_1__9_.jpg?crop=fp,0.51,0.37&width=977&height=418&quality=100', 'Performing Arts'),
(5, 'Yoga Junkies Festival 2024', '2024-09-14 09:00:00', 'Experience two unforgettable days full of yoga, meditation, inspiring workshops and the popular Mindful Market, where you can store and enjoy vegan delicacies in the enchanting setting of Schlosspark Hetzendorf.\n\nWhether you are an experienced yogi or a beginner, our festival offers a diverse program for everyone. Flow through your asanas to the beat, experience the magic of movement at the Ecastic Dance, connect body, mind and soul at inspiring workshops and enjoy the feeling of togetherness with other yoga junkies.\n\n\nSo grab your yoga mat, get your friends together and join us for a unique experience that you will remember forever!', 'https://www.yogajunkies.com/cdn/shop/files/yoga-junkies-festival-homepage-sections-2.jpg?v=1717998032&width=1920', 5000, 'n@a.com', 'n.a', 'Brown Boveri Strasse 6', 'Halle 7', '2351', 'Wiener Neudorf', 'Austria', 'https://www.yogajunkies.com/pages/yoga-junkies-festival', 'Festival'),
(6, 'Wacken Open Air 2024', '2024-07-31 10:00:00', '4 days of program, over 150 bands, several stages and we\'re just getting started: There is a ton of stuff to do and see at Wacken Open Air!\n\nIn addition to the regular concerts, there are always many special shows, theme evenings and a rich supporting program.\n\nThe timetable for the program, called Running Order, will be announced before the festival starts. It will be available here at Wacken.com, in our app and as printable PDF documents. Really handy if you want to pla your stay!', 'https://www.wacken.com/fileadmin/user_upload/images/seiten/wallpaper/Wallpapers_24/WOA24_Wallpaper_16zu9_231109_06.jpg', 10000, 'n@a.com', 'n.a.', 'Schenefelder Str.', '17', '25996', 'Falkenstein', 'Germany', 'https://www.wacken.com/', 'Festival'),
(7, 'The Chippendales', '2024-10-08 20:00:00', 'Voted Vegas‘ #1 male revue and best bachelorette party destination, the world famous Chippendales are bringing their sexy from Las Vegas to your home town.\n\nThe Chippendales show is the perfect way to celebrate your bachelorette party, birthday bash, newly-single celebration or just to have an unforgettable night out with your crew. The show, revamped annually, is a high energy, sexually charged, up close and personal experience that will leave you screaming for more.', 'https://www.stadthalle.com/_media/image/c1920x1080/50461.jpg', 10000, 'n@a.com', '+43 1 79 999 79', 'Roland-Rainer-Platz', '1', '1150', 'Vienna', 'Austria', 'www.stadthalle.com', 'Performing Arts'),
(8, 'Walter Smith III Quartet (USA)', '2024-07-15 20:30:00', 'Smith has performed all over the world participating in virtually every international festival as well as famed venues such as Carnegie Hall, the Village Vanguard, and the Kennedy Center. In addition, he has shared the stage and/or appeared on recordings with many important artists including Mulgrew Miller, Billy Childs, Joe Lovano, Herbie Hancock, Maria Schneider, Dee Dee Bridgewater, Ralph Peterson, and a host of others. To date, Walter has appeared on over 100 recordings that are released worldwide.', 'https://www.porgy.at/media/events/smith-walter-III_2018-02-13_5509ed_foto-wolfgang-gonaus.medium.jpg', 2000, 'porgy@porgy.at', '+4315037009', 'Graf Starhemberg Gasse', '1A/7', '1010', 'Vienna', 'Austria', 'https://www.porgy.at/en/', 'Concert'),
(9, 'Apocalyptica', '2024-10-10 20:00:00', 'In the lore of heavy metal only a handful of artists can claim to have changed history, and even fewer can say they’ve done so twice. Enter Apocalyptica and one of metal’s greatest, most unlikely success stories. By any account it’s the stuff of legend, and it’s about to come full circle.\nCast your mind back thirty years. The giants of the 70s and 80s still ruled the scene, but a generation of up-and-coming artists were pushing hard on the boundaries of heavy music, and then Apocalyptica came along and smashed them down with cello case.', 'https://www.apocalyptica.com/5/media/image/_20240223075715_281_1500.jpg', 10000, 'apocalyptica@odyssey-music.net', '+358 50 5456416', 'https://www.apocalyptica.com/dates/apocalyptica-dates-10-oct-2024-at-vi-21--832-.html', '6', '1110', 'Vienna', 'Austria', 'https://www.apocalyptica.com/dates/apocalyptica-dates-10-oct-2024-at-vi-21--832-.html', 'Concert'),
(10, 'Wein//Oase', '2024-08-10 15:00:00', 'Come along to the Wine//Oasis for a relaxed time with good wine, good music and even better people!\n\nCULINARY DELIGHTS & PROGRAM\n\nOur 9 food stands are at your disposal. In addition to ramen, Latino-American, Moroccan, Greek, BBQ, sushi and Italian, great live music awaits you!', 'https://cdn.prod.website-files.com/6319fc8490d9bb2451801aa3/657098485e4706ed228071d1_christmas-gleisgarten-1.jpg', 1000, 'info@gleisgarten.com', 'n.a.', 'Eichenstraße', '2', '1120', 'Vienna', 'Austria', 'https://www.eventbrite.at/e/weinoase-tickets-934304107737?aff=ebdssbdestsearch&keep_tld=1', 'Food and Drink'),
(11, 'Vegan Planet Wien', '2024-11-16 18:00:00', 'The Vegan Planet trade fair showcases the diversity of vegan cuisine - so no one is guaranteed to go home hungry: on November 16 and 17, 2024, Vienna will once again become a paradise for vegan and sustainability-minded people. The trade fair for the plant-based lifestyle brings dishes from cuisines from all over the world to the table - purely plant-based, of course. New vegan products from the areas of food fashion and beauty also await you. At the cooking shows, you can get inspiration from professionals and learn about various aspects of the plant-based lifestyle at various talks. People of all diets will find new inspiration and plant-based enjoyment here!', 'https://cdn2.allevents.in/thumbs/thumb65feab015d0a8.jpg', 1500, 'n@a.com', 'n.a.', 'Vegan Planet Wien', '3', '1010', 'Vienna', 'Austria', 'www.vegan-planet.at', 'Food and Drink'),
(12, 'Rio de Janeiro Carnival 2025', '2025-03-28 00:00:00', 'The Carnival of Rio de Janeiro is a celebration that could not be missed in the list of the ten best parties around the world. It is the most famous carnival in Latin America. The energy and joy with which this carnival is lived, will get you wanting more.', 'https://berliner-zeitung.imgix.net/2020/9/25/ee486722-4d4c-4a87-83c2-d488566ecd58.jpeg?auto=format&fit=max&w=1880&auto=compress&rect=0,269,4248,2389', 80000000, 'info@bookersinternational.com', '+1 866 930 6020', '3rd Avenue', 'Suite #102', '33131', 'Miami', 'USA', 'https://www.riocarnaval.org/', 'Party'),
(13, 'Oktoberfest', '2024-10-01 00:00:00', 'The Oktoberfest is the main German festival and one of the most famous around the world, in fact it is replicated in many countries. It is celebrated in the month of October of each year and is held in the city of Munich. The best of this great festival are not only the quantities of beers that are seen throughout the days, but their typical costumes and the German sausage (the best companion of beer).', 'https://expotur-eco.com/wp-content/uploads/2024/03/Oktoberfest.jpg', 1000000, 'veranstaltungen.raw@muenchen.de', '089 233 82813', 'Neuhauser Straße', '27', '80331', 'Münich', 'Germany', 'https://www.oktoberfest.de/', 'Party');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
