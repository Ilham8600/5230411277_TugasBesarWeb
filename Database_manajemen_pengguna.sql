-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2025 at 12:06 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_pengguna`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(25) NOT NULL,
  `password_hash` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password_hash`) VALUES
(1, 'rudi', 'ilhamyunanto53@gmail.com', 'user', 'scrypt:32768:8:1$ylhkmFcciXIGqmA6$eb7fa88c6b5edd310a9bc5f7febeb2078e3fdad44bba8db0def0235c8f0065d7f1359ee1d1b428cc6d0d49da21c2fbd36e1efd33f9c1bff495445af9315694e0'),
(2, 'ilham', 'ilham20@gmail.com', 'user', 'scrypt:32768:8:1$xJH01AIMAD4fcZBZ$5dc47d4d883fb8a5a6f9e5691f587acd780164a33842ba339f4767935abb274f5d0d6f3b13887a3a1004a361d3d8a017335f2bf1300ef5645f63dd7719b0c533'),
(3, 'doni', 'doni@gmail.com', 'user', 'scrypt:32768:8:1$m4NZY6lUyUS8Lyib$b0b69ca50fcb2ea6ccdaef9f1395e30fbce523a6ceec8f290c2a0e4ed440a2620dee98c67a3e4047565f19b3db09f3dfdec8959a9ff73e73eef3bf0454cb4972'),
(4, 'c', 'c@gmail.com', 'user', 'scrypt:32768:8:1$mJckXFaMiB6ScXpO$6efc2be62557b0df211391142af0afb23db7799e4cc19a4cd96da0ef657aa66dc3e18f2f185230bfe8f6f2cf43b62c58774ba1e96cddcca5f39501f4b71b9227'),
(5, 'tono ganteng', 'tono@gmail.com', 'admin', 'scrypt:32768:8:1$a4NDcoMmtC5qFube$0165b87eacaa832d898d24766ac9d7e7d1d446d5efb89c6950f8edde5656b335c934621da90c697d10e1a853b163f7a220abc85085df7e0b4f638ed594dd043c'),
(6, 'v', 'v@gmail.com', 'user', 'scrypt:32768:8:1$5J8Y6v0e5B0AUQlh$3fcaba22a9ebd07506faa022fb5658d3b3418bb01600ddab2dc38d6b440b8baab63d7af9e3eb7cc7d258520ecfeaa67e0801808bf15269d8dc14e0d43688e313');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
