-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 06 2024 г., 23:48
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `obd_tournament1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `location`
--

CREATE TABLE `location` (
  `location_id` bigint(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city_name` varchar(20) NOT NULL,
  `stadium_name` varchar(50) NOT NULL,
  `stadium_capacity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `location`
--

INSERT INTO `location` (`location_id`, `country`, `city_name`, `stadium_name`, `stadium_capacity`) VALUES
(1, 'North Korea', 'Pyongyang', '1st of May Stadium', 150000);

-- --------------------------------------------------------

--
-- Структура таблицы `map stats`
--

CREATE TABLE `map stats` (
  `map_stats_id` bigint(20) NOT NULL,
  `map_result` enum('Radiant victory','Dire victory') NOT NULL,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `score_dire` int(3) NOT NULL,
  `score_radiant` int(3) NOT NULL,
  `map_duration` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `map stats`
--

INSERT INTO `map stats` (`map_stats_id`, `map_result`, `match_id`, `map_id`, `score_dire`, `score_radiant`, `map_duration`) VALUES
(501, 'Radiant victory', 101, 501, 34, 51, '46:01'),
(502, 'Dire victory', 101, 502, 40, 16, '27:13'),
(601, 'Dire victory', 102, 601, 54, 51, '39:34'),
(602, 'Dire victory', 102, 602, 29, 21, '34:49'),
(603, 'Radiant victory', 102, 603, 49, 63, '68:10'),
(701, 'Radiant victory', 103, 701, 19, 27, '29:45'),
(702, 'Dire victory', 103, 702, 41, 42, '55:02'),
(703, 'Radiant victory', 103, 703, 31, 46, '43:30'),
(801, 'Dire victory', 104, 801, 34, 42, '42:55'),
(802, 'Dire victory', 104, 802, 51, 30, '38:14'),
(901, 'Radiant victory', 105, 901, 46, 34, '49:03'),
(902, 'Dire victory', 105, 902, 52, 39, '42:59'),
(903, 'Radiant victory', 105, 903, 55, 22, '32:33'),
(1001, 'Radiant victory', 106, 1001, 47, 45, '44:55'),
(1002, 'Radiant victory', 106, 1002, 28, 50, '40:01');

-- --------------------------------------------------------

--
-- Структура таблицы `match`
--

CREATE TABLE `match` (
  `match_id` bigint(20) NOT NULL,
  `win_team_id` bigint(20) NOT NULL COMMENT 'Win Team',
  `loss_team_id` bigint(20) NOT NULL COMMENT 'Loss Team',
  `match_result` enum('2:0','0:2','2:1','1:2') NOT NULL,
  `tournament_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `match`
--

INSERT INTO `match` (`match_id`, `win_team_id`, `loss_team_id`, `match_result`, `tournament_id`) VALUES
(101, 2, 1, '2:0', 1),
(102, 3, 4, '2:1', 1),
(103, 3, 2, '1:2', 1),
(104, 4, 1, '2:0', 1),
(105, 2, 4, '2:1', 1),
(106, 1, 3, '0:2', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `match stats`
--

CREATE TABLE `match stats` (
  `match_stats_id` bigint(20) NOT NULL,
  `player_id` bigint(20) NOT NULL COMMENT 'mvp_match_player_id',
  `max_viewers` int(10) NOT NULL,
  `average_viewers` int(20) NOT NULL,
  `match_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `match stats`
--

INSERT INTO `match stats` (`match_stats_id`, `player_id`, `max_viewers`, `average_viewers`, `match_id`) VALUES
(101, 6, 134120, 89013, 101),
(102, 16, 176984, 115930, 102),
(103, 10, 374011, 298391, 103),
(104, 19, 298344, 178906, 104),
(105, 6, 338192, 274913, 105),
(106, 11, 312942, 242942, 106);

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE `player` (
  `player_id` bigint(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `rating` int(10) NOT NULL,
  `team_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`player_id`, `nickname`, `first_name`, `last_name`, `country`, `rating`, `team_id`) VALUES
(1, 'shiro', 'Guo', 'Xuanang', 'China', 12200, 1),
(2, 'Emo', 'Zhou ', 'Yi', 'China', 11950, 1),
(3, 'niu', 'Li', 'Kongbo', 'China', 12000, 1),
(4, 'Pyw', 'Xiong ', 'Jiahan', 'China', 12760, 1),
(5, 'y\'', 'Zhang', 'Yiping', 'China', 12660, 1),
(6, 'Yatoro', 'Ilya', 'Mulyarchuk', 'Ukraine', 12560, 2),
(7, 'Larl', 'Denis', 'Sigitov', 'Russia', 11320, 2),
(8, 'Collapse', 'Magomed', 'Khalilov', 'Russia', 12990, 2),
(9, 'Mira', 'Myroslav', 'Kolpakov', 'Ukraine', 12330, 2),
(10, 'Miposhka', 'Yaroslav', 'Naidenov', 'Russia', 11890, 2),
(11, 'dyrachyo', 'Anton', 'Shkredov', 'Russia', 12440, 3),
(12, 'Quinn', 'Quinn', 'Callahan', 'USA', 12930, 3),
(13, 'Ace', 'Marcus', 'Hoelgaard', 'Denmark', 12880, 3),
(14, 'tOfu', 'Erik', 'Engel', 'Germany', 12510, 3),
(15, 'Hillenkamp', 'Seleri', 'Melchior', 'Netherlands', 12480, 3),
(16, 'NAPASS991', 'Mikhail', 'Shuklin', 'Ukraine', 3400, 4),
(17, 'Sviatoslav_sby', 'Sviatoslav', 'Bobarik', 'Ukraine', 1500, 4),
(18, 'no enemies', 'Oleksandr', 'Petruk', 'Ukraine', 1800, 4),
(19, 'MP', 'Mat', 'Patryka', 'Ukraine', 6000, 4),
(20, 'Arthas', 'Vitaliy', 'Tsal', 'Italy', 13010, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `team`
--

CREATE TABLE `team` (
  `team_id` bigint(20) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `player_id` bigint(20) NOT NULL,
  `team_region` varchar(20) NOT NULL,
  `team_seed` int(20) NOT NULL,
  `team_tier` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `player_id`, `team_region`, `team_seed`, `team_tier`) VALUES
(1, 'LGD Gaming', 1, 'China', 3, 1),
(2, 'Team Spirit', 6, 'CIS', 1, 1),
(3, 'Gaimin Gladiators', 11, 'Europe', 2, 1),
(4, 'beastcoast', 16, 'South America', 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tournament`
--

CREATE TABLE `tournament` (
  `tournament_id` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `prize_pool` int(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tournament`
--

INSERT INTO `tournament` (`tournament_id`, `title`, `location_id`, `prize_pool`, `start_date`, `end_date`) VALUES
(1, 'The International 2024', 1, 25934111, '2023-06-01 12:00:00', '2023-06-03 18:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `tournament stats`
--

CREATE TABLE `tournament stats` (
  `tournament_stats_id` bigint(20) NOT NULL,
  `tournament_id` bigint(20) NOT NULL,
  `tickets_sold` int(10) NOT NULL,
  `max_viewers` int(10) NOT NULL,
  `maps_played` int(5) NOT NULL,
  `plyaer_id` bigint(20) NOT NULL COMMENT 'mvp_tournament_played_id',
  `most_pickable_hero` varchar(50) NOT NULL,
  `most_bannable_hero` varchar(50) NOT NULL,
  `non_selected_heroes` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tournament stats`
--

INSERT INTO `tournament stats` (`tournament_stats_id`, `tournament_id`, `tickets_sold`, `max_viewers`, `maps_played`, `plyaer_id`, `most_pickable_hero`, `most_bannable_hero`, `non_selected_heroes`) VALUES
(100, 1, 625433, 374011, 15, 6, 'Brislteback', 'Wraith King', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `usertbl`
--

CREATE TABLE `usertbl` (
  `id` int(11) NOT NULL,
  `full_name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `usertbl`
--

INSERT INTO `usertbl` (`id`, `full_name`, `email`, `username`, `password`) VALUES
(0, 'Petryk AHAHHAHA', 'Petryk@mp.com', 'noenemies', 'petryk'),
(0, 'Vladislav', 'petrikey.vladislav@gmail.com', 'existans', 'root');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Индексы таблицы `map stats`
--
ALTER TABLE `map stats`
  ADD PRIMARY KEY (`map_stats_id`),
  ADD KEY `match_id` (`match_id`);

--
-- Индексы таблицы `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `team_id` (`win_team_id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `loss_team_id` (`loss_team_id`);

--
-- Индексы таблицы `match stats`
--
ALTER TABLE `match stats`
  ADD PRIMARY KEY (`match_stats_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Индексы таблицы `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Индексы таблицы `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Индексы таблицы `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`tournament_id`),
  ADD KEY `location` (`location_id`);

--
-- Индексы таблицы `tournament stats`
--
ALTER TABLE `tournament stats`
  ADD PRIMARY KEY (`tournament_stats_id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `plyaer_id` (`plyaer_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `map stats`
--
ALTER TABLE `map stats`
  ADD CONSTRAINT `map stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`win_team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`loss_team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `match stats`
--
ALTER TABLE `match stats`
  ADD CONSTRAINT `match stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match stats_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tournament stats`
--
ALTER TABLE `tournament stats`
  ADD CONSTRAINT `tournament stats_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tournament stats_ibfk_2` FOREIGN KEY (`plyaer_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
