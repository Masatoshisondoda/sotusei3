-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022 年 2 月 09 日 16:03
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
(7, NULL, 'afjafjaifjia@ioajfakof', 'afafafaokgoakokaofkaokfoa', 'primary_school', '積極型');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `studyselflogin`
--
ALTER TABLE `studyselflogin`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `studyselflogin`
--
ALTER TABLE `studyselflogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
