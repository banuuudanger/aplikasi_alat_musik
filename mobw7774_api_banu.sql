-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2024 at 07:40 PM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobw7774_api_banu`
--

-- --------------------------------------------------------

--
-- Table structure for table `buktipembayaran`
--

CREATE TABLE `buktipembayaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `kuantiti` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id`, `user_id`, `produk_id`, `kuantiti`) VALUES
(10, 1, 1, 0),
(11, 1, 8, 0),
(12, 1, 7, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `pembayaran` (
`id` int(11)
,`user_id` int(11)
,`total` decimal(10,2)
,`tanggal` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `harga`, `gambar`, `kategori`) VALUES
(1, 'fender telecaster', 'Fender Telecaster, gitar legendaris dengan suara jernih dan desain ikonik, sempurna untuk musisi segala genre.', 1400.00, 'https://down-id.img.susercontent.com/file/e32ace57f599902f40e0778694d43719', 'guitar'),
(2, 'fender jaguar', 'Fender Jaguar, gitar klasik dengan nada kaya dan desain unik, ideal untuk eksplorasi musik yang kreatif.', 1200.00, 'https://nafiriguitar.com/cdn/shop/products/210107132006_Banner_20Tokai3_20jpg_ori_f9bec7f8-bae4-4221-8088-545c7f3a7aad.jpg?v=1708524971', 'guitar'),
(3, 'fender stratocaster', 'Fender Stratocaster, gitar ikonik dengan suara dinamis dan ergonomis, menjadi pilihan utama musisi dunia.', 1500.00, 'https://p4.wallpaperbetter.com/wallpaper/246/201/298/guitar-stratocaster-fender-wallpaper-preview.jpg', 'guitar'),
(4, 'drum dw', 'DW Drums, dengan kualitas premium dan resonansi superior, pilihan ideal untuk drummer profesional.', 2000.00, 'https://media.sweetwater.com/m/products/image/019616c0d1vyxfAtnQhtDazvLoY4d5tnxkA8NfvK.jpg?v=019616c0d185e7b7', 'drum'),
(5, 'drum pearl', 'Pearl Drums, terkenal dengan ketahanan dan suaranya yang kaya, menjadi favorit di kalangan drummer di seluruh dunia.', 2200.00, 'https://faders.ca/cdn/shop/files/RS525SCC31_hqw.jpg?v=1685992189', 'drum'),
(6, 'drum ludwig', 'Ludwig Drums, dengan warisan legendaris dan suara yang kuat, menjadi pilihan utama bagi drummer yang mencari kualitas dan keandalan.', 2500.00, 'https://www.tomleemusic.ca/media/catalog/product/cache/7b59eeedc8a9391b10c489498e31e772/2/2/227217.jpg', 'drum'),
(7, 'bass fender precision', 'Precision Bass, dengan nada yang solid dan respons yang akurat, menjadi standar emas bagi pemain bass di berbagai genre musik.', 3000.00, 'https://nafiriguitar.com/cdn/shop/products/200321155945_Epi_206_ori.jpg?v=1708523738', 'bass'),
(8, 'bass rickenbacker 4001', 'Rickenbacker 4001 Bass, dengan desain klasik dan suara yang khas, menjadi ikon dalam dunia musik rock dan progresif.', 3200.00, 'https://loviesguitars.com/wp-content/uploads/2023/12/1P4A7815.jpg', 'bass'),
(9, 'bass fender mustang', 'Bass Mustang, dengan skala pendek dan suara yang punchy, cocok untuk gaya bermain yang energik dan dinamis.', 3500.00, 'https://nafiriguitar.com/cdn/shop/products/230111175137_IMG_5382_ori_7300b2ae-1cae-444f-adf9-9d6502663911.jpg?v=1708515932', 'bass'),
(10, 'preamp sansamp', 'Efek Sansamp Bass, dengan kemampuan untuk menghasilkan distorsi dan karakter suara yang kaya, sangat cocok untuk mengubah dan memperkaya sound bass Anda.', 4000.00, 'https://down-id.img.susercontent.com/file/47d9f80e03786aae7c97044363f49db6', 'efek'),
(11, 'boss equalizer', 'Efek Boss Bass Equalizer, memberikan kontrol presisi terhadap frekuensi bass untuk mencapai suara yang sesuai dengan preferensi musik Anda.', 4200.00, 'https://cf.shopee.co.id/file/53b9f2c5b774f7914ad718c4a441b342', 'efek'),
(12, 'boss overdrive', 'Efek Boss Bass Overdrive/Distortion, memberikan karakter distorsi yang kuat namun tetap menjaga kejernihan dan punch bass Anda, ideal untuk menambah dimensi ekspresif dalam permainan bass Anda.', 4500.00, 'https://s4.bukalapak.com/img/467750078/large/DSCF8500.JPG', 'efek');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'banu', '$2y$10$Ma4GHjx1VFRPUXDa7.8NSu7j7q7dtf7JEIPylCuQlGDargbw33PrK'),
(2, 'test@gmail.com', '$2y$10$ha8ga/FUauOpdTKBcQwxT.pQ90xFD4YG5NqixB8Luc/UJiLhdq0au'),
(4, 'kunc', '$2y$10$qGhBi7l2rmKvCD9Diaq58.3eR3y7zOsUow0rfLvKUwMVAT1yNDWtu'),
(5, 'dhio', '$2y$10$SdeamzkNoFKlO4vCAAcvpOSkYGaVOgZCL8MUCVhsiRp33V9Q..SJK');

-- --------------------------------------------------------

--
-- Structure for view `pembayaran`
--
DROP TABLE IF EXISTS `pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mobw7774`@`localhost` SQL SECURITY DEFINER VIEW `pembayaran`  AS SELECT `buktipembayaran`.`id` AS `id`, `buktipembayaran`.`user_id` AS `user_id`, `buktipembayaran`.`total` AS `total`, `buktipembayaran`.`tanggal` AS `tanggal` FROM `buktipembayaran` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buktipembayaran`
--
ALTER TABLE `buktipembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buktipembayaran`
--
ALTER TABLE `buktipembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
