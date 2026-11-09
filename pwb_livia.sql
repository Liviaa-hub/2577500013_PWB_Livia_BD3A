-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2026 at 12:54 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwb_livia`
--

-- --------------------------------------------------------

--
-- Table structure for table `ada`
--

CREATE TABLE IF NOT EXISTS `ada` (
  `no_pesanan` varchar(10) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `qty` int(3) NOT NULL,
  `harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ada`
--

INSERT INTO `ada` (`no_pesanan`, `kd_barang`, `qty`, `harga`) VALUES
('001', 'BRG001', 2, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok` int(3) NOT NULL,
  `harga` int(8) NOT NULL,
  `berat` int(3) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `stok`, `harga`, `berat`, `satuan`, `keterangan`, `gambar`) VALUES
('BRG001', 'Token Listrik', 1000, 50000, 0, 'kWh', 'token listik', 'token.jpg'),
('MB-01', 'Meibie', 100, 500000, 100, 'btl', 'parfum meibie', 'meibie.png'),
('ZA-001', 'Aries', 100, 200000, 100, 'btl', 'parfum zodiac aries', 'aries.png'),
('ZA-002', 'Libra', 100, 300000, 100, 'btl', 'parfum zodiac libra', 'libra.png'),
('ZA-003', 'Aquarius', 100, 250000, 100, 'btl', 'parfum zodiac aquarius', 'aquarius.png'),
('ZA-004', 'Scorpio', 100, 300000, 100, 'btl', 'parfum zodiac scorpio', 'scorpio.png'),
('ZA-005', 'Virgo', 100, 200000, 100, 'btl', 'parfum zodiac virgo', 'virgo.png'),
('ZA-006', 'Leo', 100, 270000, 100, 'btl', 'parfum zodiac leo', 'leo.png'),
('ZA-007', 'Taurus', 100, 400000, 200, 'btl', 'parfum zodiac taurus', 'taurus.png'),
('ZA-008', 'Sagitarius', 100, 300000, 150, 'btl', 'parfum zodiac sagitarius', 'sagitarius.png'),
('ZA-009', 'Pisces', 100, 200000, 100, 'btl', 'parfum zodiac pisces', 'pisces.png'),
('ZA-010', 'Gemini', 100, 300000, 100, 'btl', 'parfum zodiac gemini', 'gemini.png'),
('ZA-011', 'Capricon', 100, 150000, 100, 'btl', 'parfum zodiac capricon', 'capricon.png'),
('ZA-012', 'Cancer', 100, 100000, 100, 'btl', 'parfum zodiac cancer', 'cancer.png');

-- --------------------------------------------------------

--
-- Table structure for table `ekspedisi`
--

CREATE TABLE IF NOT EXISTS `ekspedisi` (
  `kd_ekspedisi` varchar(10) NOT NULL,
  `nama_ekspedisi` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `ongkir` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ekspedisi`
--

INSERT INTO `ekspedisi` (`kd_ekspedisi`, `nama_ekspedisi`, `tujuan`, `ongkir`) VALUES
('EK001', 'Chaya', 'Pangkalpinang', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `kd_pelanggan` int(3) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `kota_pelanggan` varchar(50) NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `kota_pelanggan`, `telp_pelanggan`, `email_pelanggan`, `password`) VALUES
(2, 'Andi', 'Jl.Jasmine', 'Jakarta', '085544332211', 'andi@gmail.com', 'andi123'),
(4, 'Cilla', 'Jl.Kenangan', 'Pangkalpinang', '087766554433', 'cilla@gmail.com', 'cilla123');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `kd_pembayaran` varchar(10) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `bukti_transfer` varchar(100) NOT NULL,
  `no_pesanan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`kd_pembayaran`, `tanggal_pembayaran`, `bukti_transfer`, `no_pesanan`) VALUES
('1', '2024-06-04', 'bukti_tf1.PNG', '001');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE IF NOT EXISTS `pesanan` (
  `no_pesanan` varchar(10) NOT NULL,
  `tanggal_pesanan` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `status` varchar(50) NOT NULL,
  `kd_ekspedisi` varchar(10) NOT NULL,
  `kd_pelanggan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`no_pesanan`, `tanggal_pesanan`, `nama`, `alamat`, `telp`, `status`, `kd_ekspedisi`, `kd_pelanggan`) VALUES
('001', '2024-05-28', 'Livia', 'Pangkalpinang', '081122334455', 'keranjang', 'EK001', '001'),
('001', '2024-05-28', 'Livia', 'Pangkalan Baru', '081122334455', 'keranjang', 'EK001', '2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `user_role`) VALUES
(1, 'livia', '202cb962ac59075b964b07152d234b70', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ada`
--
ALTER TABLE `ada`
  ADD PRIMARY KEY (`no_pesanan`,`kd_barang`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`kd_ekspedisi`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kd_pembayaran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `kd_pelanggan` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
