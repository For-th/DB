-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2026 at 02:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arenaph_esports`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` int(11) NOT NULL,
  `game_name` varchar(100) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `developer` varchar(100) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL CHECK (`release_year` >= 2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `game_name`, `genre`, `developer`, `platform`, `release_year`) VALUES
(1, 'Mobile Legends: Bang Bang', 'MOBA', 'Moonton', 'Mobile', 2016),
(2, 'Valorant', 'FPS', 'Riot Games', 'PC', 2020),
(3, 'Dota 2', 'MOBA', 'Valve', 'PC', 2013),
(4, 'League of Legends', 'MOBA', 'Riot Games', 'PC', 2009),
(5, 'Counter-Strike 2', 'FPS', 'Valve', 'PC', 2023),
(6, 'Apex Legends', 'Battle Royale', 'Respawn Entertainment', 'PC/Console', 2019),
(7, 'PUBG Mobile', 'Battle Royale', 'Krafton', 'Mobile', 2018),
(8, 'Tekken 8', 'Fighting', 'Bandai Namco', 'PC/Console', 2024),
(9, 'Street Fighter 6', 'Fighting', 'Capcom', 'PC/Console', 2023),
(10, 'Overwatch 2', 'FPS', 'Blizzard Entertainment', 'PC/Console', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `match_number` int(11) NOT NULL,
  `best_of` int(11) DEFAULT 3 CHECK (`best_of` in (1,3,5,7)),
  `match_status` varchar(20) DEFAULT 'Scheduled' CHECK (`match_status` in ('Scheduled','Ongoing','Completed','Cancelled'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `stage_id`, `match_number`, `best_of`, `match_status`) VALUES
(1, 1, 1, 3, 'Completed'),
(2, 2, 2, 3, 'Completed'),
(3, 3, 3, 3, 'Completed'),
(4, 4, 4, 3, 'Completed'),
(5, 5, 5, 3, 'Completed'),
(6, 6, 6, 3, 'Completed'),
(7, 7, 7, 3, 'Completed'),
(8, 8, 8, 3, 'Completed'),
(9, 9, 9, 3, 'Completed'),
(10, 10, 10, 5, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `match_referees`
--

CREATE TABLE `match_referees` (
  `match_id` int(11) NOT NULL,
  `referee_id` int(11) NOT NULL,
  `assigned_role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_referees`
--

INSERT INTO `match_referees` (`match_id`, `referee_id`, `assigned_role`) VALUES
(1, 1, 'Head Referee'),
(2, 2, 'Head Referee'),
(3, 3, 'Head Referee'),
(4, 4, 'Head Referee'),
(5, 5, 'Head Referee'),
(6, 6, 'Head Referee'),
(7, 7, 'Head Referee'),
(8, 8, 'Head Referee'),
(9, 9, 'Head Referee'),
(10, 10, 'Head Referee');

-- --------------------------------------------------------

--
-- Table structure for table `match_results`
--

CREATE TABLE `match_results` (
  `result_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `winning_team_id` int(11) DEFAULT NULL,
  `team_1_score` int(11) DEFAULT 0 CHECK (`team_1_score` >= 0),
  `team_2_score` int(11) DEFAULT 0 CHECK (`team_2_score` >= 0),
  `result_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_results`
--

INSERT INTO `match_results` (`result_id`, `match_id`, `winning_team_id`, `team_1_score`, `team_2_score`, `result_notes`) VALUES
(1, 1, 1, 2, 1, 'Manila Titans won the series.'),
(2, 2, 2, 2, 0, 'Davao Dragons won the series.'),
(3, 3, 4, 1, 2, 'Luzon Legends won the series.'),
(4, 4, 5, 1, 2, 'Visayas Vanguard won the series.'),
(5, 5, 6, 1, 2, 'Mindanao Warriors won the series.'),
(6, 6, 7, 1, 2, 'Metro Phoenix won the series.'),
(7, 7, 8, 1, 2, 'Baguio Frost won the series.'),
(8, 8, 9, 1, 2, 'Bacolod Blaze won the series.'),
(9, 9, 10, 1, 2, 'Iloilo Elite won the series.'),
(10, 10, 1, 2, 3, 'Manila Titans won the final series.');

-- --------------------------------------------------------

--
-- Table structure for table `match_schedules`
--

CREATE TABLE `match_schedules` (
  `schedule_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `scheduled_start` datetime NOT NULL,
  `scheduled_end` datetime DEFAULT NULL,
  `stream_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_schedules`
--

INSERT INTO `match_schedules` (`schedule_id`, `match_id`, `venue_id`, `scheduled_start`, `scheduled_end`, `stream_url`) VALUES
(1, 1, 1, '2026-06-01 10:00:00', '2026-06-01 12:00:00', 'https://example.com/stream1'),
(2, 2, 2, '2026-06-10 13:00:00', '2026-06-10 15:00:00', 'https://example.com/stream2'),
(3, 3, 3, '2026-06-20 14:00:00', '2026-06-20 16:00:00', 'https://example.com/stream3'),
(4, 4, 4, '2026-07-01 15:00:00', '2026-07-01 17:00:00', 'https://example.com/stream4'),
(5, 5, 5, '2026-07-10 16:00:00', '2026-07-10 18:00:00', 'https://example.com/stream5'),
(6, 6, 6, '2026-07-20 17:00:00', '2026-07-20 19:00:00', 'https://example.com/stream6'),
(7, 7, 7, '2026-08-01 10:00:00', '2026-08-01 12:00:00', 'https://example.com/stream7'),
(8, 8, 8, '2026-08-10 13:00:00', '2026-08-10 15:00:00', 'https://example.com/stream8'),
(9, 9, 9, '2026-08-15 14:00:00', '2026-08-15 16:00:00', 'https://example.com/stream9'),
(10, 10, 10, '2026-08-20 18:00:00', '2026-08-20 21:00:00', 'https://example.com/stream10');

-- --------------------------------------------------------

--
-- Table structure for table `match_teams`
--

CREATE TABLE `match_teams` (
  `match_team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `side` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `match_teams`
--

INSERT INTO `match_teams` (`match_team_id`, `match_id`, `team_id`, `side`, `score`) VALUES
(1, 1, 1, 'Blue', 2),
(2, 1, 2, 'Red', 1),
(3, 2, 2, 'Blue', 2),
(4, 2, 3, 'Red', 0),
(5, 3, 3, 'Blue', 1),
(6, 3, 4, 'Red', 2),
(7, 4, 4, 'Blue', 1),
(8, 4, 5, 'Red', 2),
(9, 5, 5, 'Blue', 1),
(10, 5, 6, 'Red', 2),
(11, 6, 6, 'Blue', 1),
(12, 6, 7, 'Red', 2),
(13, 7, 7, 'Blue', 1),
(14, 7, 8, 'Red', 2),
(15, 8, 8, 'Blue', 1),
(16, 8, 9, 'Red', 2),
(17, 9, 9, 'Blue', 1),
(18, 9, 10, 'Red', 2),
(19, 10, 10, 'Blue', 2),
(20, 10, 1, 'Red', 3);

-- --------------------------------------------------------

--
-- Table structure for table `organizers`
--

CREATE TABLE `organizers` (
  `organizer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizers`
--

INSERT INTO `organizers` (`organizer_id`, `first_name`, `last_name`, `email`, `phone`, `position`, `hire_date`) VALUES
(1, 'Alex', 'Cruz', 'alex.cruz@example.com', '09170000001', 'Tournament Director', '2023-01-01'),
(2, 'Bea', 'Santos', 'bea.santos@example.com', '09170000002', 'Event Manager', '2023-01-15'),
(3, 'Carlos', 'Reyes', 'carlos.reyes@example.com', '09170000003', 'Tournament Admin', '2023-02-01'),
(4, 'Diana', 'Garcia', 'diana.garcia@example.com', '09170000004', 'Event Coordinator', '2023-02-15'),
(5, 'Ethan', 'Ramos', 'ethan.ramos@example.com', '09170000005', 'Tournament Admin', '2023-03-01'),
(6, 'Fiona', 'Torres', 'fiona.torres@example.com', '09170000006', 'Event Manager', '2023-03-15'),
(7, 'George', 'Mendoza', 'george.mendoza@example.com', '09170000007', 'Technical Director', '2023-04-01'),
(8, 'Hannah', 'Castillo', 'hannah.castillo@example.com', '09170000008', 'Tournament Admin', '2023-04-15'),
(9, 'Ian', 'Navarro', 'ian.navarro@example.com', '09170000009', 'Event Coordinator', '2023-05-01'),
(10, 'Julia', 'Villanueva', 'julia.villanueva@example.com', '09170000010', 'Tournament Director', '2023-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `country` varchar(50) DEFAULT 'Philippines',
  `registration_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `username`, `first_name`, `last_name`, `email`, `date_of_birth`, `country`, `registration_date`) VALUES
(1, 'ShadowPH', 'Juan', 'Dela Cruz', 'shadowph@example.com', '2002-04-15', 'Philippines', '2026-10-08'),
(2, 'Blaze', 'Marco', 'Santos', 'blaze@example.com', '2001-08-21', 'Philippines', '2026-10-08'),
(3, 'Viper', 'Carlo', 'Reyes', 'viper@example.com', '2003-01-12', 'Philippines', '2026-10-08'),
(4, 'Nova', 'Miguel', 'Garcia', 'nova@example.com', '2002-11-30', 'Philippines', '2026-10-08'),
(5, 'Ace', 'Joshua', 'Ramos', 'ace@example.com', '2000-07-09', 'Philippines', '2026-10-08'),
(6, 'Phantom', 'Daniel', 'Torres', 'phantom@example.com', '2004-03-18', 'Philippines', '2026-10-08'),
(7, 'Frost', 'Kevin', 'Mendoza', 'frost@example.com', '2001-09-25', 'Philippines', '2026-10-08'),
(8, 'Raven', 'Adrian', 'Castillo', 'raven@example.com', '2003-06-14', 'Philippines', '2026-10-08'),
(9, 'Titan', 'Gabriel', 'Navarro', 'titan@example.com', '2002-12-05', 'Philippines', '2026-10-08'),
(10, 'Echo', 'Ryan', 'Villanueva', 'echo@example.com', '2001-05-27', 'Philippines', '2026-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `player_statistics`
--

CREATE TABLE `player_statistics` (
  `statistic_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `kills` int(11) DEFAULT 0 CHECK (`kills` >= 0),
  `deaths` int(11) DEFAULT 0 CHECK (`deaths` >= 0),
  `assists` int(11) DEFAULT 0 CHECK (`assists` >= 0),
  `damage` int(11) DEFAULT 0 CHECK (`damage` >= 0),
  `objectives` int(11) DEFAULT 0 CHECK (`objectives` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_statistics`
--

INSERT INTO `player_statistics` (`statistic_id`, `player_id`, `match_id`, `kills`, `deaths`, `assists`, `damage`, `objectives`) VALUES
(1, 1, 1, 15, 5, 10, 18500, 4),
(2, 2, 2, 18, 4, 12, 21000, 5),
(3, 3, 3, 12, 8, 15, 16500, 3),
(4, 4, 4, 20, 6, 8, 23000, 6),
(5, 5, 5, 17, 7, 11, 19500, 4),
(6, 6, 6, 14, 5, 14, 18000, 5),
(7, 7, 7, 19, 6, 10, 22000, 5),
(8, 8, 8, 16, 8, 13, 17500, 4),
(9, 9, 9, 21, 5, 9, 24000, 6),
(10, 10, 10, 23, 7, 15, 26000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `prizes`
--

CREATE TABLE `prizes` (
  `prize_id` int(11) NOT NULL,
  `prize_name` varchar(100) NOT NULL,
  `prize_type` varchar(30) DEFAULT NULL,
  `prize_amount` decimal(12,2) DEFAULT 0.00 CHECK (`prize_amount` >= 0),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prizes`
--

INSERT INTO `prizes` (`prize_id`, `prize_name`, `prize_type`, `prize_amount`, `description`) VALUES
(1, 'Champion Prize', 'Cash', 50000.00, 'First place tournament prize'),
(2, 'Runner-up Prize', 'Cash', 25000.00, 'Second place tournament prize'),
(3, 'Third Place Prize', 'Cash', 15000.00, 'Third place tournament prize'),
(4, 'MVP Award', 'Cash', 10000.00, 'Most Valuable Player award'),
(5, 'Best Player Award', 'Cash', 8000.00, 'Best individual player award'),
(6, 'Best Team Award', 'Cash', 12000.00, 'Outstanding team award'),
(7, 'Gaming Gear Package', 'Equipment', 10000.00, 'Gaming peripherals package'),
(8, 'Sponsor Award', 'Cash', 5000.00, 'Special sponsor award'),
(9, 'Rookie Award', 'Cash', 5000.00, 'Best newcomer award'),
(10, 'Fan Favorite Award', 'Cash', 5000.00, 'Audience-selected award');

-- --------------------------------------------------------

--
-- Table structure for table `referees`
--

CREATE TABLE `referees` (
  `referee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `certification_level` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referees`
--

INSERT INTO `referees` (`referee_id`, `first_name`, `last_name`, `email`, `certification_level`, `phone`) VALUES
(1, 'Mark', 'Aquino', 'mark.aquino@example.com', 'Level 1', '09180000001'),
(2, 'Sarah', 'Bautista', 'sarah.bautista@example.com', 'Level 2', '09180000002'),
(3, 'Kevin', 'Chua', 'kevin.chua@example.com', 'Level 1', '09180000003'),
(4, 'Anna', 'Diaz', 'anna.diaz@example.com', 'Level 3', '09180000004'),
(5, 'Paul', 'Espiritu', 'paul.espiritu@example.com', 'Level 2', '09180000005'),
(6, 'Rachel', 'Flores', 'rachel.flores@example.com', 'Level 1', '09180000006'),
(7, 'James', 'Gonzales', 'james.gonzales@example.com', 'Level 3', '09180000007'),
(8, 'Nicole', 'Hernandez', 'nicole.hernandez@example.com', 'Level 2', '09180000008'),
(9, 'Brian', 'Ignacio', 'brian.ignacio@example.com', 'Level 1', '09180000009'),
(10, 'Karen', 'Javier', 'karen.javier@example.com', 'Level 2', '09180000010');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `sponsor_id` int(11) NOT NULL,
  `sponsor_name` varchar(100) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `sponsorship_level` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`sponsor_id`, `sponsor_name`, `industry`, `contact_person`, `contact_email`, `sponsorship_level`) VALUES
(1, 'TechCore Philippines', 'Technology', 'Robert Lim', 'robert@techcore.example', 'Platinum'),
(2, 'GameFuel PH', 'Food and Beverage', 'Maria Tan', 'maria@gamefuel.example', 'Gold'),
(3, 'CyberNet', 'Internet Services', 'John Lee', 'john@cybernet.example', 'Gold'),
(4, 'PixelGear', 'Gaming Hardware', 'Angela Cruz', 'angela@pixelgear.example', 'Silver'),
(5, 'ByteWorks', 'Technology', 'David Ong', 'david@byteworks.example', 'Silver'),
(6, 'PowerPlay', 'Energy Drinks', 'Mark Yu', 'mark@powerplay.example', 'Gold'),
(7, 'NextGen PCs', 'Computer Hardware', 'Kevin Tan', 'kevin@nextgen.example', 'Platinum'),
(8, 'StreamHub', 'Streaming', 'Laura Reyes', 'laura@streamhub.example', 'Silver'),
(9, 'GameZone', 'Gaming Retail', 'Peter Santos', 'peter@gamezone.example', 'Bronze'),
(10, 'Arena Telecom', 'Telecommunications', 'Sofia Garcia', 'sofia@arena.example', 'Platinum');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `team_tag` varchar(20) NOT NULL,
  `country` varchar(50) DEFAULT 'Philippines',
  `date_created` date DEFAULT NULL,
  `team_status` varchar(20) DEFAULT 'Active' CHECK (`team_status` in ('Active','Inactive','Disbanded'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `team_tag`, `country`, `date_created`, `team_status`) VALUES
(1, 'Manila Titans', 'MT', 'Philippines', '2023-01-10', 'Active'),
(2, 'Davao Dragons', 'DD', 'Philippines', '2023-02-15', 'Active'),
(3, 'Cebu Storm', 'CS', 'Philippines', '2023-03-20', 'Active'),
(4, 'Luzon Legends', 'LL', 'Philippines', '2023-04-05', 'Active'),
(5, 'Visayas Vanguard', 'VV', 'Philippines', '2023-05-12', 'Active'),
(6, 'Mindanao Warriors', 'MW', 'Philippines', '2023-06-18', 'Active'),
(7, 'Metro Phoenix', 'MP', 'Philippines', '2023-07-25', 'Active'),
(8, 'Baguio Frost', 'BF', 'Philippines', '2023-08-30', 'Active'),
(9, 'Bacolod Blaze', 'BB', 'Philippines', '2023-09-14', 'Active'),
(10, 'Iloilo Elite', 'IE', 'Philippines', '2023-10-22', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `team_member_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `member_role` varchar(30) NOT NULL CHECK (`member_role` in ('Captain','Player','Substitute','Coach')),
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`team_member_id`, `team_id`, `player_id`, `member_role`, `join_date`, `leave_date`) VALUES
(1, 1, 1, 'Captain', '2024-01-10', NULL),
(2, 2, 2, 'Captain', '2024-01-15', NULL),
(3, 3, 3, 'Captain', '2024-02-01', NULL),
(4, 4, 4, 'Captain', '2024-02-10', NULL),
(5, 5, 5, 'Captain', '2024-03-01', NULL),
(6, 6, 6, 'Captain', '2024-03-15', NULL),
(7, 7, 7, 'Captain', '2024-04-01', NULL),
(8, 8, 8, 'Captain', '2024-04-15', NULL),
(9, 9, 9, 'Captain', '2024-05-01', NULL),
(10, 10, 10, 'Captain', '2024-05-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `tournament_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `tournament_name` varchar(150) NOT NULL,
  `tournament_type` varchar(30) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `registration_fee` decimal(12,2) DEFAULT 0.00 CHECK (`registration_fee` >= 0),
  `max_teams` int(11) DEFAULT NULL CHECK (`max_teams` > 0),
  `status` varchar(20) DEFAULT 'Upcoming' CHECK (`status` in ('Upcoming','Ongoing','Completed','Cancelled'))
) ;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`tournament_id`, `game_id`, `tournament_name`, `tournament_type`, `start_date`, `end_date`, `registration_fee`, `max_teams`, `status`) VALUES
(1, 1, 'ArenaPH MLBB Summer Cup', 'Knockout', '2026-06-01', '2026-06-05', 500.00, 16, 'Completed'),
(2, 2, 'ArenaPH Valorant Open', 'Double Elimination', '2026-06-10', '2026-06-15', 1000.00, 16, 'Completed'),
(3, 3, 'ArenaPH Dota 2 Championship', 'Double Elimination', '2026-06-20', '2026-06-25', 1500.00, 16, 'Completed'),
(4, 4, 'ArenaPH League Invitational', 'Round Robin', '2026-07-01', '2026-07-07', 1000.00, 12, 'Completed'),
(5, 5, 'ArenaPH CS2 Open', 'Knockout', '2026-07-10', '2026-07-15', 1000.00, 16, 'Completed'),
(6, 6, 'ArenaPH Apex Cup', 'League', '2026-07-20', '2026-07-25', 500.00, 20, 'Completed'),
(7, 7, 'ArenaPH PUBG Mobile Cup', 'League', '2026-08-01', '2026-08-05', 500.00, 20, 'Completed'),
(8, 8, 'ArenaPH Tekken Challenge', 'Knockout', '2026-08-10', '2026-08-11', 300.00, 32, 'Completed'),
(9, 9, 'ArenaPH Street Fighter Cup', 'Knockout', '2026-08-15', '2026-08-16', 300.00, 32, 'Completed'),
(10, 10, 'ArenaPH Overwatch Open', 'Double Elimination', '2026-08-20', '2026-08-25', 1000.00, 16, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_organizers`
--

CREATE TABLE `tournament_organizers` (
  `tournament_id` int(11) NOT NULL,
  `organizer_id` int(11) NOT NULL,
  `organizer_role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournament_organizers`
--

INSERT INTO `tournament_organizers` (`tournament_id`, `organizer_id`, `organizer_role`) VALUES
(1, 1, 'Tournament Director'),
(2, 2, 'Event Manager'),
(3, 3, 'Tournament Admin'),
(4, 4, 'Event Coordinator'),
(5, 5, 'Tournament Admin'),
(6, 6, 'Event Manager'),
(7, 7, 'Technical Director'),
(8, 8, 'Tournament Admin'),
(9, 9, 'Event Coordinator'),
(10, 10, 'Tournament Director');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_prizes`
--

CREATE TABLE `tournament_prizes` (
  `tournament_prize_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `winning_team_id` int(11) DEFAULT NULL,
  `winning_player_id` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `tournament_prizes`
--

INSERT INTO `tournament_prizes` (`tournament_prize_id`, `tournament_id`, `prize_id`, `winning_team_id`, `winning_player_id`) VALUES
(1, 1, 1, 1, NULL),
(2, 2, 2, 2, NULL),
(3, 3, 3, 3, NULL),
(4, 4, 4, NULL, 4),
(5, 5, 5, NULL, 5),
(6, 6, 6, 6, NULL),
(7, 7, 7, 7, NULL),
(8, 8, 8, NULL, 8),
(9, 9, 9, NULL, 9),
(10, 10, 10, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_sponsors`
--

CREATE TABLE `tournament_sponsors` (
  `tournament_id` int(11) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  `sponsorship_amount` decimal(12,2) DEFAULT 0.00 CHECK (`sponsorship_amount` >= 0),
  `sponsorship_start` date DEFAULT NULL,
  `sponsorship_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournament_sponsors`
--

INSERT INTO `tournament_sponsors` (`tournament_id`, `sponsor_id`, `sponsorship_amount`, `sponsorship_start`, `sponsorship_end`) VALUES
(1, 1, 100000.00, '2026-05-01', '2026-06-05'),
(2, 2, 75000.00, '2026-05-01', '2026-06-15'),
(3, 3, 80000.00, '2026-05-01', '2026-06-25'),
(4, 4, 50000.00, '2026-06-01', '2026-07-07'),
(5, 5, 60000.00, '2026-06-01', '2026-07-15'),
(6, 6, 70000.00, '2026-06-15', '2026-07-25'),
(7, 7, 90000.00, '2026-07-01', '2026-08-05'),
(8, 8, 40000.00, '2026-07-15', '2026-08-11'),
(9, 9, 35000.00, '2026-08-01', '2026-08-16'),
(10, 10, 100000.00, '2026-08-01', '2026-08-25');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_stages`
--

CREATE TABLE `tournament_stages` (
  `stage_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `stage_name` varchar(50) NOT NULL,
  `stage_order` int(11) NOT NULL,
  `format` varchar(50) DEFAULT NULL,
  `number_of_teams` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournament_stages`
--

INSERT INTO `tournament_stages` (`stage_id`, `tournament_id`, `stage_name`, `stage_order`, `format`, `number_of_teams`) VALUES
(1, 1, 'Finals', 1, 'Single Elimination', 16),
(2, 2, 'Group Stage', 1, 'Round Robin', 16),
(3, 3, 'Group Stage', 1, 'Round Robin', 16),
(4, 4, 'Regular Season', 1, 'Round Robin', 12),
(5, 5, 'Finals', 1, 'Single Elimination', 16),
(6, 6, 'League Stage', 1, 'League', 20),
(7, 7, 'Group Stage', 1, 'Round Robin', 20),
(8, 8, 'Finals', 1, 'Single Elimination', 32),
(9, 9, 'Finals', 1, 'Single Elimination', 32),
(10, 10, 'Playoffs', 1, 'Double Elimination', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_teams`
--

CREATE TABLE `tournament_teams` (
  `tournament_team_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `registration_date` date NOT NULL,
  `seed_number` int(11) DEFAULT NULL,
  `final_rank` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `tournament_teams`
--

INSERT INTO `tournament_teams` (`tournament_team_id`, `tournament_id`, `team_id`, `registration_date`, `seed_number`, `final_rank`) VALUES
(1, 1, 1, '2026-05-01', 1, 1),
(2, 2, 2, '2026-05-02', 2, 2),
(3, 3, 3, '2026-05-03', 3, 3),
(4, 4, 4, '2026-05-04', 4, 4),
(5, 5, 5, '2026-05-05', 5, 5),
(6, 6, 6, '2026-05-06', 6, 6),
(7, 7, 7, '2026-05-07', 7, 7),
(8, 8, 8, '2026-05-08', 8, 8),
(9, 9, 9, '2026-05-09', 9, 9),
(10, 10, 10, '2026-05-10', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(100) NOT NULL,
  `venue_type` varchar(30) NOT NULL CHECK (`venue_type` in ('LAN','Online','Hybrid')),
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL CHECK (`capacity` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`venue_id`, `venue_name`, `venue_type`, `address`, `city`, `capacity`) VALUES
(1, 'ArenaPH Manila', 'LAN', 'Makati Avenue', 'Manila', 500),
(2, 'ArenaPH Davao', 'LAN', 'J.P. Laurel Avenue', 'Davao City', 400),
(3, 'Cebu Gaming Hub', 'LAN', 'IT Park', 'Cebu City', 350),
(4, 'Quezon Esports Center', 'LAN', 'Quezon Avenue', 'Quezon City', 600),
(5, 'Baguio Game Arena', 'LAN', 'Session Road', 'Baguio', 250),
(6, 'Iloilo Esports Hall', 'LAN', 'Mandurriao', 'Iloilo City', 300),
(7, 'Online Server PH1', 'Online', 'Online', 'Philippines', 1000),
(8, 'Online Server PH2', 'Online', 'Online', 'Philippines', 1000),
(9, 'SMX Convention Hall', 'LAN', 'Mall of Asia Complex', 'Pasay', 1500),
(10, 'Clark Esports Arena', 'Hybrid', 'Clark Freeport', 'Pampanga', 800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`),
  ADD UNIQUE KEY `game_name` (`game_name`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD UNIQUE KEY `uq_stage_match_number` (`stage_id`,`match_number`);

--
-- Indexes for table `match_referees`
--
ALTER TABLE `match_referees`
  ADD PRIMARY KEY (`match_id`,`referee_id`),
  ADD KEY `fk_mr_referee` (`referee_id`);

--
-- Indexes for table `match_results`
--
ALTER TABLE `match_results`
  ADD PRIMARY KEY (`result_id`),
  ADD UNIQUE KEY `match_id` (`match_id`),
  ADD KEY `fk_result_winner` (`winning_team_id`);

--
-- Indexes for table `match_schedules`
--
ALTER TABLE `match_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `match_id` (`match_id`),
  ADD KEY `fk_schedule_venue` (`venue_id`);

--
-- Indexes for table `match_teams`
--
ALTER TABLE `match_teams`
  ADD PRIMARY KEY (`match_team_id`),
  ADD UNIQUE KEY `unique_match_team` (`match_id`,`team_id`),
  ADD KEY `fk_match_team_team` (`team_id`);

--
-- Indexes for table `organizers`
--
ALTER TABLE `organizers`
  ADD PRIMARY KEY (`organizer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `player_statistics`
--
ALTER TABLE `player_statistics`
  ADD PRIMARY KEY (`statistic_id`),
  ADD UNIQUE KEY `unique_player_match` (`player_id`,`match_id`),
  ADD KEY `fk_stats_match` (`match_id`);

--
-- Indexes for table `prizes`
--
ALTER TABLE `prizes`
  ADD PRIMARY KEY (`prize_id`);

--
-- Indexes for table `referees`
--
ALTER TABLE `referees`
  ADD PRIMARY KEY (`referee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`sponsor_id`),
  ADD UNIQUE KEY `sponsor_name` (`sponsor_name`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `team_name` (`team_name`),
  ADD UNIQUE KEY `team_tag` (`team_tag`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`team_member_id`),
  ADD UNIQUE KEY `unique_team_player` (`team_id`,`player_id`),
  ADD KEY `fk_team_member_player` (`player_id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`tournament_id`),
  ADD KEY `fk_tournament_game` (`game_id`);

--
-- Indexes for table `tournament_organizers`
--
ALTER TABLE `tournament_organizers`
  ADD PRIMARY KEY (`tournament_id`,`organizer_id`),
  ADD KEY `fk_to_organizer` (`organizer_id`);

--
-- Indexes for table `tournament_prizes`
--
ALTER TABLE `tournament_prizes`
  ADD PRIMARY KEY (`tournament_prize_id`),
  ADD UNIQUE KEY `uq_tournament_prize` (`tournament_id`,`prize_id`),
  ADD KEY `fk_tp_prize` (`prize_id`),
  ADD KEY `fk_tp_team` (`winning_team_id`),
  ADD KEY `fk_tp_player` (`winning_player_id`);

--
-- Indexes for table `tournament_sponsors`
--
ALTER TABLE `tournament_sponsors`
  ADD PRIMARY KEY (`tournament_id`,`sponsor_id`),
  ADD KEY `fk_ts_sponsor` (`sponsor_id`);

--
-- Indexes for table `tournament_stages`
--
ALTER TABLE `tournament_stages`
  ADD PRIMARY KEY (`stage_id`),
  ADD UNIQUE KEY `unique_stage_order` (`tournament_id`,`stage_order`);

--
-- Indexes for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  ADD PRIMARY KEY (`tournament_team_id`),
  ADD UNIQUE KEY `unique_tournament_team` (`tournament_id`,`team_id`),
  ADD UNIQUE KEY `uq_tournament_final_rank` (`tournament_id`,`final_rank`),
  ADD KEY `fk_tt_team` (`team_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `match_results`
--
ALTER TABLE `match_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `match_schedules`
--
ALTER TABLE `match_schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `match_teams`
--
ALTER TABLE `match_teams`
  MODIFY `match_team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizers`
--
ALTER TABLE `organizers`
  MODIFY `organizer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `player_statistics`
--
ALTER TABLE `player_statistics`
  MODIFY `statistic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prizes`
--
ALTER TABLE `prizes`
  MODIFY `prize_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `referees`
--
ALTER TABLE `referees`
  MODIFY `referee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `team_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `tournament_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tournament_prizes`
--
ALTER TABLE `tournament_prizes`
  MODIFY `tournament_prize_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tournament_stages`
--
ALTER TABLE `tournament_stages`
  MODIFY `stage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  MODIFY `tournament_team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `fk_match_stage` FOREIGN KEY (`stage_id`) REFERENCES `tournament_stages` (`stage_id`) ON DELETE CASCADE;

--
-- Constraints for table `match_referees`
--
ALTER TABLE `match_referees`
  ADD CONSTRAINT `fk_mr_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mr_referee` FOREIGN KEY (`referee_id`) REFERENCES `referees` (`referee_id`) ON DELETE CASCADE;

--
-- Constraints for table `match_results`
--
ALTER TABLE `match_results`
  ADD CONSTRAINT `fk_result_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_result_winner` FOREIGN KEY (`winning_team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL;

--
-- Constraints for table `match_schedules`
--
ALTER TABLE `match_schedules`
  ADD CONSTRAINT `fk_schedule_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_schedule_venue` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`);

--
-- Constraints for table `match_teams`
--
ALTER TABLE `match_teams`
  ADD CONSTRAINT `fk_match_team_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_match_team_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE;

--
-- Constraints for table `player_statistics`
--
ALTER TABLE `player_statistics`
  ADD CONSTRAINT `fk_stats_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_stats_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `fk_team_member_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_team_member_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE;

--
-- Constraints for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD CONSTRAINT `fk_tournament_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`);

--
-- Constraints for table `tournament_organizers`
--
ALTER TABLE `tournament_organizers`
  ADD CONSTRAINT `fk_to_organizer` FOREIGN KEY (`organizer_id`) REFERENCES `organizers` (`organizer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_to_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE CASCADE;

--
-- Constraints for table `tournament_prizes`
--
ALTER TABLE `tournament_prizes`
  ADD CONSTRAINT `fk_tp_player` FOREIGN KEY (`winning_player_id`) REFERENCES `players` (`player_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tp_prize` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`prize_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tp_team` FOREIGN KEY (`winning_team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tp_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE CASCADE;

--
-- Constraints for table `tournament_sponsors`
--
ALTER TABLE `tournament_sponsors`
  ADD CONSTRAINT `fk_ts_sponsor` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ts_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE CASCADE;

--
-- Constraints for table `tournament_stages`
--
ALTER TABLE `tournament_stages`
  ADD CONSTRAINT `fk_stage_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE CASCADE;

--
-- Constraints for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  ADD CONSTRAINT `fk_tt_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tt_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
