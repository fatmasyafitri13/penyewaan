-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 08:26 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persewaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` char(5) NOT NULL,
  `kd_kategori` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_sewa` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `kd_kategori`, `nama_barang`, `harga_sewa`) VALUES
('B001', 'K001', 'Gelas Kaca', 2500),
('B002', 'K002', 'Wajan', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kd_kategori` char(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kd_kategori`, `nama_kategori`) VALUES
('K001', 'Perlengkapan Makan'),
('K002', 'Perlengkapan Dapur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kd_pelanggan` char(5) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(13) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telpon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kd_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `alamat`, `no_telpon`) VALUES
('P001', 'Anisa', 'Perempuan', 'Tipes', '085668163401'),
('P002', 'Fatma', 'Perempuan', 'Jetis', '085668163409'),
('P003', 'Fafa', 'Perempuan', 'Karanganyar', '085668163402');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi1`
--

CREATE TABLE `tbl_transaksi1` (
  `no_peminjaman` char(5) NOT NULL,
  `id_user` char(5) NOT NULL,
  `tgl_peminjaman` varchar(12) NOT NULL,
  `tgl_pengembalian` varchar(12) NOT NULL,
  `kd_pelanggan` char(5) NOT NULL,
  `ket_acara` varchar(50) NOT NULL,
  `kd_barang` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_sewa` int(9) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total` double NOT NULL,
  `bayar` int(12) NOT NULL,
  `kembali` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi1`
--

INSERT INTO `tbl_transaksi1` (`no_peminjaman`, `id_user`, `tgl_peminjaman`, `tgl_pengembalian`, `kd_pelanggan`, `ket_acara`, `kd_barang`, `nama_barang`, `harga_sewa`, `jumlah`, `total`, `bayar`, `kembali`) VALUES
('PJ001', 'U001', '18/07/2019', '20/07/2019', 'P001', 'Ngunduh Mantu', 'B001', 'Gelas Kaca', 2500, 2, 5000, 7000, 2000),
('PJ002', 'U001', '17/09/2018', '18/09/2018', 'P001', 'NIKAH', 'B001', 'Gelas Kaca', 2500, 2, 5000, 10000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` char(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `hp` varchar(12) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama_user`, `alamat`, `hp`, `level`) VALUES
('U001', 'admin', 'admin', 'Fatma', 'Surakarta', '089522596108', 'admin'),
('U002', 'user', 'user', 'Syafitri', 'Tipes', '085668163402', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`),
  ADD KEY `kd_kategori` (`kd_kategori`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indexes for table `tbl_transaksi1`
--
ALTER TABLE `tbl_transaksi1`
  ADD PRIMARY KEY (`no_peminjaman`),
  ADD KEY `pelanggan` (`kd_pelanggan`),
  ADD KEY `kd_barang` (`kd_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `tbl_kategori` (`kd_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transaksi1`
--
ALTER TABLE `tbl_transaksi1`
  ADD CONSTRAINT `tbl_transaksi1_ibfk_1` FOREIGN KEY (`kd_pelanggan`) REFERENCES `tbl_pelanggan` (`kd_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi1_ibfk_2` FOREIGN KEY (`kd_barang`) REFERENCES `tbl_barang` (`kd_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi1_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
