-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 01:07 PM
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
-- Database: `traindb`
--

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist`
--

CREATE TABLE `token_blacklist` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist`
--

INSERT INTO `token_blacklist` (`id`, `token`, `created_at`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJmbGFza3VzZXIiLCJlbWFpbCI6ImZsYXNrdXNlckBleGFtcGxlLmNvbSIsImV4cCI6MTc3NDE2Mjg2N30.oaBpOLMNZZIEKRc8E1Ua_EgfYVF6g47sFEP7lWTt2L8', '2026-03-21 07:01:07'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwiaWF0IjoxNzc0NDM1OTM4LCJleHAiOjE3NzQ1MjIzMzh9.YUAS0mHsj3mZiUb3X4VHjYn0Z5cu_dxJY1_sCi5Ks7g', '2026-03-25 11:02:25'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwidXNlcm5hbWUiOiJ0ZXN0IiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSJ9.ZcpHXbTcZv34e4MWOoi05FYot3OvZORiFnxGvXjgDkI', '2026-03-25 14:34:47'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywidXNlcm5hbWUiOiJjbGFpcmVAZ21haWwuY29tIiwiZW1haWwiOiJjbGFpcmVAZ21haWwuY29tIn0.pJVSplzboUiMWYg5fAd4_oMdMvjJzZnmNsmW3ctBt_8', '2026-03-25 14:46:07'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwiaWF0IjoxNzc0NDUwNDcwLCJleHAiOjE3NzQ1MzY4NzB9.BD7GI47fm_3IQrTSdhHJGQDrllzFNqLde9Rdq8tX1r0', '2026-03-25 15:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `id` int(11) NOT NULL,
  `train_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `route` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_name`, `price`, `route`, `created_at`, `updated_at`) VALUES
(1, 'LRT Line 1', 20.00, 'Baclaran - Fernando Poe Jr. Station', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(2, 'LRT Line 2', 25.00, 'Recto - Antipolo', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(3, 'MRT Line 3', 24.00, 'North Avenue - Taft Avenue', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(4, 'PNR Metro Commuter Line', 30.00, 'Tutuban - Alabang', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(5, 'PNR Bicol Express', 450.00, 'Manila - Naga', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(6, 'PNR Mayon Limited', 500.00, 'Manila - Legazpi', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(7, 'LRT Cavite Extension', 35.00, 'Baclaran - Niog', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(8, 'MRT Line 7', 28.00, 'North Avenue - San Jose del Monte', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(9, 'North–South Commuter Railway', 60.00, 'Clark - Calamba', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(10, 'Metro Manila Subway', 35.00, 'Valenzuela - NAIA Terminal 3', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(11, 'PNR South Long Haul', 800.00, 'Manila - Matnog', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(12, 'Clark Airport Express', 120.00, 'Clark Airport - Manila', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(13, 'Mindanao Railway Phase 1', 50.00, 'Tagum - Davao - Digos', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(14, 'Panay Rail Revival', 40.00, 'Iloilo - Roxas City', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(15, 'Cebu Monorail', 25.00, 'Cebu City - Mactan Airport', '2026-03-19 15:09:13', '2026-03-19 15:09:13'),
(16, 'Express 1', 250.75, 'City A - City B', '2026-03-21 07:01:07', '2026-03-21 07:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2b$10$.t/V2iY38PVjPGuHLcVLDea99RE20BCs4iM4SLc9JGMR.PxNMnFEe', '2026-03-19 15:11:37'),
(2, 'flaskuser', 'flaskuser@example.com', '$2b$12$yn8k1NMGdZ4iTMDhsJi7.OIb7SjQyEVJpudQPfdAM/C8menBLjLTW', '2026-03-21 07:01:06'),
(3, 'admin2', 'admin2@gmail.com', '$2b$10$hrznkSL0LuaClefS4gwSy.uGx4dp39SEk4.Wx6X1i8/luTR6M0jLO', '2026-03-25 10:52:05'),
(4, 'admin3', 'admin3@gmail.com', '$2b$12$bgbuWX5weczP9VWTlNlVYuwAxZwWpYnhmIFhwkWcluSDWXVDkm4xS', '2026-03-25 05:38:50'),
(5, 'admdsdsadadsadsain3', 'admdsdsadadsadsain3@gmail.com', '$2b$12$Z684KGzPbFQJnEtE1NAPMe1yWQGpWSqLnYv5Jpiqe568ZItZ/sPIK', '2026-03-25 13:49:40'),
(6, 'test', 'test@gmail.com', '$2b$12$rW.XZeJPaAsJ/vcY4StQoOeUDV3.It86Nib5FMxxjTigIHunTA5MG', '2026-03-25 14:15:11'),
(7, 'claire@gmail.com', 'claire@gmail.com', '$2b$12$JGtX8gYCh.4HDS46V64QpucXZW0DhYBeU.ZHdBxod3TmYxBidr8gi', '2026-03-25 14:44:02'),
(8, 'Jes', 'jes@gmail.com', '$2b$12$eaK2OkNEXDUQEolcHL8bB.nNiskvv23L0Zx2wvvBH/IvWm15TD9na', '2026-03-30 10:48:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
