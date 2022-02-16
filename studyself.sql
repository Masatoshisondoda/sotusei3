-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022 年 2 月 16 日 06:22
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `studyself`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `studyselflogin`
--

CREATE TABLE `studyselflogin` (
  `id` int(11) NOT NULL,
  `field1` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `field2` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `field3` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `field4` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `identify` varchar(5) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `studyselflogin`
--

INSERT INTO `studyselflogin` (`id`, `field1`, `field2`, `field3`, `field4`, `identify`) VALUES
(1, NULL, 'afjafjaifjia@ioajfakof', 'aokfoakfokafokaofkaofkoakoakfo', 'primary_school', '積極型'),
(2, NULL, 'afjafjaifjia@ioajfakof', 'aokfoakfoakfokaofkaokfoakfoaf', 'primary_school', '積極型'),
(3, NULL, 'afjafjaifjia@ioajfakof', 'kokokaokfoakfoakofkaofkoakfoakfo', 'primary_school', '積極型'),
(4, NULL, 'afjafjaifjia@ioajfakof', 'dkoakofkaofkoakfoakfoakofkaf', 'primary_school', '積極型'),
(5, NULL, 'afjafjaifjia@ioajfakof', 'oaskofkaokofkaofkoakfoakfoakofa', 'primary_school', '積極型'),
(6, NULL, 'afjafjaifjia@ioajfakof', 'oaskoafkfoakofkaofkaofkaokfoakfoakf', 'primary_school', '積極型'),
(7, NULL, 'afjafjaifjia@ioajfakof', 'afafafaokgoakokaofkaokfoa', 'primary_school', '積極型'),
(8, NULL, 'afokaofkaofkao@oakfoakof', 'afokaofkaofkaofkaof', 'university', '保守型'),
(9, NULL, 'afokaofkaofkao@oakfoakof', 'kaokoakfoakfokafka', 'university', '保守型'),
(10, NULL, 'afokaofkaofkao@oakfoakof', 'afaffkokoko', 'high_school', '保守型'),
(11, NULL, 'afokaofkaof@aokfaofka', 'afokaofkaofkaofkoaf', 'before_primary_school', '保守型'),
(12, NULL, 'afakfmafkalkf@oakofkao', 'afafakfakljfklajlafafa', 'high_school', '保守型'),
(13, NULL, 'agafafafafa@afafaf', 'afafafafaf', 'junior_high_school', '保守型');

-- --------------------------------------------------------

--
-- テーブルの構造 `studyselfnote`
--

CREATE TABLE `studyselfnote` (
  `id` int(12) NOT NULL,
  `notename` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `usepurpose` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `noteindex` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `studyselfnote`
--

INSERT INTO `studyselfnote` (`id`, `notename`, `usepurpose`, `noteindex`, `created_at`, `updated_at`) VALUES
(17, 'あディ出す009000', 'other', NULL, '2022-02-16 12:04:59', '2022-02-16 12:10:10'),
(18, 'adada50', 'understand', NULL, '2022-02-16 12:09:49', '2022-02-16 12:09:54'),
(19, 'adada', 'understand', NULL, '2022-02-16 12:11:40', '2022-02-16 12:11:40'),
(20, 'aokoako', 'understand', NULL, '2022-02-16 12:18:08', '2022-02-16 12:18:08'),
(21, 'aokoakoafafafafagkaokgaoagaag', 'other', NULL, '2022-02-16 12:18:21', '2022-02-16 12:18:21'),
(22, 'adada', 'understand', NULL, '2022-02-16 12:20:36', '2022-02-16 12:20:36'),
(23, 'adad', 'memorize', NULL, '2022-02-16 12:24:29', '2022-02-16 12:24:29'),
(24, 'adad', 'understand', NULL, '2022-02-16 12:24:36', '2022-02-16 12:24:36'),
(25, 'aaa', 'memorize', NULL, '2022-02-16 12:26:00', '2022-02-16 12:26:00'),
(26, 'aaaaaadadfa', 'other', NULL, '2022-02-16 12:26:38', '2022-02-16 12:26:38'),
(27, 'aadadf45566', 'understand', NULL, '2022-02-16 12:28:14', '2022-02-16 12:28:14'),
(28, 'kokokokok', 'understand', NULL, '2022-02-16 12:37:26', '2022-02-16 12:37:26'),
(29, 'kokoko', 'understand', NULL, '2022-02-16 12:37:56', '2022-02-16 12:37:56'),
(30, 'kokok23', 'memorize', NULL, '2022-02-16 12:41:01', '2022-02-16 12:41:09'),
(31, '00000', 'memorize', NULL, '2022-02-16 12:42:51', '2022-02-16 12:42:51'),
(32, '998989----', 'other', NULL, '2022-02-16 12:47:18', '2022-02-16 12:47:51'),
(33, 'aoaoa', 'other', NULL, '2022-02-16 12:48:01', '2022-02-16 12:48:01'),
(34, '0000^^^000', 'memorize', NULL, '2022-02-16 12:49:56', '2022-02-16 12:50:01');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `studyselflogin`
--
ALTER TABLE `studyselflogin`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `studyselfnote`
--
ALTER TABLE `studyselfnote`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `studyselflogin`
--
ALTER TABLE `studyselflogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルの AUTO_INCREMENT `studyselfnote`
--
ALTER TABLE `studyselfnote`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
