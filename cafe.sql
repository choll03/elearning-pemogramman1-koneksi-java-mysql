-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03 Jul 2018 pada 16.43
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `orang` int(5) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `jam` varchar(20) NOT NULL,
  `pesanan_khusus` text,
  `confirm` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`id`, `nama`, `orang`, `tanggal`, `jam`, `pesanan_khusus`, `confirm`) VALUES
(18, 'member', 2, '05/20/2018', '00 : 14 : AM', 'ya', 1),
(19, 'choll03', 3, '05/15/2018', '08 : 52 : PM', '', 1),
(20, 'member', 5, '06/14/2018', '08 : 35 : PM', 'Saya menginginkan meja di lantai 2', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_upload`
--

CREATE TABLE `image_upload` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `path` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `image_upload`
--

INSERT INTO `image_upload` (`id`, `item_id`, `file_name`, `path`) VALUES
(7, 4, 'cc64553241258eaad579d26844703f41.JPG', './upload-foto/cc64553241258eaad579d26844703f41.JPG'),
(8, 3, '11e7cc941e71b3954e59f6c75220e7d5.jpg', './upload-foto/11e7cc941e71b3954e59f6c75220e7d5.jpg'),
(9, 5, '48af0d9d6bf201a3a082a9c827d85b13.png', './upload-foto/48af0d9d6bf201a3a082a9c827d85b13.png'),
(10, 6, '9d051d1fd947946c859912799016f372.png', './upload-foto/9d051d1fd947946c859912799016f372.png'),
(11, 7, '5e358573a757e5f813042209f57f07bf.jpg', './upload-foto/5e358573a757e5f813042209f57f07bf.jpg'),
(12, 8, 'e43344b0f756658f2f8a1e2552e81b69.png', './upload-foto/e43344b0f756658f2f8a1e2552e81b69.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(30) NOT NULL,
  `diskon` int(3) NOT NULL DEFAULT '0',
  `kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `nama`, `harga`, `diskon`, `kategori`) VALUES
(3, 'Nasi goreng', 12000, 20, 'makanan'),
(4, 'bubur ayam', 10000, 5, 'makanan'),
(5, 'Ayam Penyet', 14000, 0, 'makanan'),
(6, 'soto', 9000, 0, 'makanan'),
(7, 'mie ayam', 10000, 0, 'makanan'),
(8, 'es coffee', 19000, 0, 'minuman'),
(9, 'es teh manis', 3000, 0, 'minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `send_to` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `message`
--

INSERT INTO `message` (`id`, `send_to`, `title`, `msg`, `status`) VALUES
(17, 'admin', 'admin', 'member memesan sesuatu', 1),
(18, 'member', 'pesanan', 'pesanan anda telah kami konfirmasi, terima kasih', 0),
(19, 'admin', 'admin', 'choll03 memesan sesuatu', 1),
(20, 'admin', 'admin', 'choll03 memesan sesuatu', 1),
(21, 'admin', 'admin', 'choll03 memesan sesuatu', 1),
(22, 'admin', 'admin', 'choll03 memesan sesuatu', 1),
(23, 'admin', 'admin/booking', 'choll03 booking tempat ', 1),
(24, 'choll03', 'bookingan', 'bookingan anda telah di konfirm', 1),
(25, 'admin', 'admin', 'choll03 memesan sesuatu', 1),
(26, 'choll03', 'pesanan', 'pesanan anda telah kami konfirmasi, terima kasih', 1),
(27, 'admin', 'admin/booking', 'member booking tempat ', 0),
(28, 'admin', 'admin', 'member memesan sesuatu', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `jam` varchar(8) NOT NULL,
  `item_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `alamat` text NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `username`, `tanggal`, `jam`, `item_id`, `qty`, `alamat`, `status`) VALUES
(1, 'choll03', '23-05-2018', '03:47 pm', 4, 1, '', 'menunggu'),
(2, 'choll03', '23-05-2018', '03:50 pm', 4, 1, '', 'menunggu'),
(3, 'choll03', '27-05-2018', '05:14 am', 3, 1, 'tarikolot', 'dikonfirmasi'),
(4, 'member', '13-06-2018', '03:38 pm', 5, 2, 'rumah Rt 2', 'menunggu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `phone`, `level`) VALUES
(1, 'member@member.com', '1234', 'member', '0899880010', 'member'),
(2, 'admin@admin.com', '1234', 'admin', '060120201', 'admin'),
(3, 'con@col.com', 'dengan147', 'choll03', '09900', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_upload`
--
ALTER TABLE `image_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `image_upload`
--
ALTER TABLE `image_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
