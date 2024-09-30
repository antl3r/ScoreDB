-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Sep 2024 pada 13.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scoredb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `calculation`
--

CREATE TABLE `calculation` (
  `id_calculation` varchar(6) NOT NULL,
  `id_score` varchar(6) DEFAULT NULL,
  `id_referee` varchar(6) DEFAULT NULL,
  `personal_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `camp`
--

CREATE TABLE `camp` (
  `id_camp` varchar(6) NOT NULL,
  `camp_name` varchar(99) DEFAULT NULL,
  `address` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `camp`
--

INSERT INTO `camp` (`id_camp`, `camp_name`, `address`) VALUES
('S01', 'WUSHU UDAYANA', 'DENPASAR'),
('S02', 'BLUE SPIDER', 'TANGERANG'),
('S03', '8 NAGA', 'BANDUNG'),
('S04', 'SWI LABA-LABA SAKTI', 'JAKARTA'),
('S05', 'ALMA WUSHU', 'SALATIGA'),
('S06', 'YAYASAN INTI BAYANGAN', 'JAKARTA'),
('S07', 'UNNES', 'JAKARTA'),
('S08', 'TIAN EN', 'SURAKARTA'),
('S09', 'HARMONY WUSHU INDONESIA', 'BOGOR'),
('S10', 'ACMA', 'BOGOR'),
('S11', 'WUXIA ACADEMY', 'SIDOARJO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` varchar(6) NOT NULL,
  `id_style` varchar(6) DEFAULT NULL,
  `category` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `id_style`, `category`) VALUES
('D010', 'J01', 'FREESTYLE'),
('D011', 'J02', 'WEAPON'),
('D012', 'J02', 'EMPTY HAND'),
('D013', 'J03', 'SD'),
('D014', 'J03', 'SMP'),
('D015', 'J03', 'SMA'),
('D016', 'J04', 'SD'),
('D017', 'J04', 'SMP'),
('D018', 'J04', 'SMA'),
('D019', 'J04', 'MAHASISWA'),
('D020', 'J06', 'SMA'),
('D021', 'J06', 'FREESTYLE'),
('D022', 'J07', 'SMA'),
('D023', 'J07', 'MAHASISWA'),
('D100', 'J10', 'SD'),
('D111', 'J11', 'SMP'),
('D112', 'J11', 'SMA'),
('D113', 'J11', 'FREESTYLE'),
('D114', 'J12', 'SD'),
('D115', 'J12', 'SMP'),
('D116', 'J12', 'SMA'),
('D117', 'J13', 'SMP'),
('D118', 'J13', 'SMA'),
('D119', 'J13', 'MAHASISWA'),
('D120', 'J14', 'MHS'),
('D121', 'J14', 'VETERAN'),
('D122', 'J14', 'SD'),
('D123', 'J16', 'SMP'),
('D124', 'J16', 'SMA'),
('D125', 'J19', 'SMA'),
('D126', 'J19', 'MAHASISWA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `judge`
--

CREATE TABLE `judge` (
  `id_referee` varchar(6) NOT NULL,
  `ref_name` varchar(99) DEFAULT NULL,
  `ref_address` varchar(99) DEFAULT NULL,
  `position` varchar(99) DEFAULT NULL,
  `licence_number` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `judge`
--

INSERT INTO `judge` (`id_referee`, `ref_name`, `ref_address`, `position`, `licence_number`) VALUES
('W101', 'Agus', 'Semarang', 'Side Judge', 'LIS-NAS2022'),
('W102', 'Asep', 'Bandung', 'Side Judge', 'LIS-DJB2019'),
('W103', 'Jeje', 'Jakarta', 'Juri Sisi', 'LIS-INT2022'),
('W104', 'Darmaji', 'Yogyakarta', 'Chairman', 'LIS-NAS2020'),
('W105', 'Edward', 'Surabaya', 'Side Judge', 'LIS-NAS2022'),
('W106', 'Jo', 'Depok', 'Side Judge', 'LIS-DJB2020'),
('W107', 'Johar', 'Jakarta', 'Vice Chairman', 'LIS-NAS2022'),
('W108', 'Lena', 'Jakarta', 'Side Judge', 'LIS-NAS2020'),
('W109', 'Nyoman', 'Bali', 'Chief of Field', 'LIS-NAS2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mainmatch`
--

CREATE TABLE `mainmatch` (
  `id_match` varchar(6) NOT NULL,
  `id_athlete` varchar(6) DEFAULT NULL,
  `id_style` varchar(6) DEFAULT NULL,
  `id_category` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mainmatch`
--

INSERT INTO `mainmatch` (`id_match`, `id_athlete`, `id_style`, `id_category`) VALUES
('A001', '7005', 'J01', 'D010'),
('A002', '7003', 'J01', 'D010'),
('A003', '7000', 'J01', 'D011'),
('A004', '7007', 'J01', 'D012'),
('A005', '7005', 'J03', 'D014'),
('A006', '7002', 'J03', 'D022'),
('A007', '7004', 'J03', 'D022'),
('A008', '7000', 'J04', 'D014'),
('A009', '7004', 'J04', 'D111'),
('A010', '7008', 'J04', 'D017'),
('A011', '7001', 'J06', 'D117'),
('A012', '7005', 'J06', 'D012'),
('A013', '7001', 'J07', 'D023'),
('A014', '7001', 'J11', 'D115'),
('A015', '7002', 'J11', 'D113'),
('A016', '7005', 'J11', 'D113'),
('A017', '7003', 'J12', 'D114'),
('A018', '7003', 'J13', 'D119'),
('A019', '7010', 'J13', 'D119'),
('A020', '7004', 'J14', 'D117'),
('A021', '7007', 'J14', 'D121'),
('A022', '7008', 'J16', 'D123'),
('A023', '7011', 'J19', 'D126');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_athlete` varchar(6) NOT NULL,
  `id_camp` varchar(6) DEFAULT NULL,
  `athlete_name` varchar(99) DEFAULT NULL,
  `camp_name` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_athlete`, `id_camp`, `athlete_name`, `camp_name`) VALUES
('7000', 'S06', 'enrico', 'INTI BAYANGAN'),
('7001', 'S06', 'NIMAS', 'INTI BAYANGAN'),
('7002', 'S01', 'NI LUH RATNA', 'UDAYANA'),
('7003', 'S01', 'KOMANG AGUS', 'UDAYANA'),
('7004', 'S09', 'ZOURA', 'HARMONY WUSHU'),
('7005', 'S09', 'GOVIN', 'HARMONY WUSHU'),
('7006', 'S10', 'ALICIA', 'ACMA'),
('7007', 'S10', 'JACKY', 'ACMA'),
('7008', 'S05', 'CAROLINE', 'ALMA WUSHU'),
('7009', 'S05', 'KEZIA', 'ALMA WUSHU'),
('7010', 'S08', 'BRIGITA', 'TIAN EN'),
('7011', 'S08', 'AXELIA', 'TIAN EN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `score`
--

CREATE TABLE `score` (
  `id_score` varchar(6) NOT NULL,
  `id_match` varchar(6) DEFAULT NULL,
  `final_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `score`
--

INSERT INTO `score` (`id_score`, `id_match`, `final_score`) VALUES
('N001', 'A001', NULL),
('N002', 'A002', NULL),
('N003', 'A003', NULL),
('N004', 'A004', NULL),
('N005', 'A005', NULL),
('N006', 'A006', NULL),
('N007', 'A007', NULL),
('N008', 'A008', NULL),
('N009', 'A009', NULL),
('N010', 'A010', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `style`
--

CREATE TABLE `style` (
  `id_style` varchar(6) NOT NULL,
  `style_name` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `style`
--

INSERT INTO `style` (`id_style`, `style_name`) VALUES
('J01', 'DRUNKEN MASTER'),
('J02', 'MONKEY KING'),
('J03', 'CHANG QUAN'),
('J04', 'JIAN SHU'),
('J05', 'DAO SHU'),
('J06', 'QIANG SHU'),
('J07', 'GUN SHU'),
('J08', 'CHUJI NAN QUAN'),
('J09', 'MOK YAN JONG'),
('J10', 'CHUJI NAN GUN'),
('J11', 'NAN QUAN'),
('J12', 'NAN DAO'),
('J13', 'NAN GUN'),
('J14', 'TAIJI QUAN'),
('J15', 'TAIJI JIAN'),
('J16', 'BAAT JARM DAO'),
('J17', 'DUILIAN'),
('J18', 'JITI EMPTY HANDS'),
('J19', 'JITI WEAPON');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `calculation`
--
ALTER TABLE `calculation`
  ADD PRIMARY KEY (`id_calculation`),
  ADD KEY `idx_calculation_id_score` (`id_score`),
  ADD KEY `idx_calculation_id_referee` (`id_referee`);

--
-- Indeks untuk tabel `camp`
--
ALTER TABLE `camp`
  ADD PRIMARY KEY (`id_camp`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `id_style` (`id_style`);

--
-- Indeks untuk tabel `judge`
--
ALTER TABLE `judge`
  ADD PRIMARY KEY (`id_referee`);

--
-- Indeks untuk tabel `mainmatch`
--
ALTER TABLE `mainmatch`
  ADD PRIMARY KEY (`id_match`),
  ADD KEY `id_athlete` (`id_athlete`),
  ADD KEY `id_style` (`id_style`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_athlete`),
  ADD KEY `id_camp` (`id_camp`);

--
-- Indeks untuk tabel `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id_score`),
  ADD KEY `id_match` (`id_match`);

--
-- Indeks untuk tabel `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id_style`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `calculation`
--
ALTER TABLE `calculation`
  ADD CONSTRAINT `fk_calculation_referee` FOREIGN KEY (`id_referee`) REFERENCES `judge` (`id_referee`),
  ADD CONSTRAINT `fk_calculation_score` FOREIGN KEY (`id_score`) REFERENCES `score` (`id_score`);

--
-- Ketidakleluasaan untuk tabel `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_style`) REFERENCES `style` (`id_style`);

--
-- Ketidakleluasaan untuk tabel `mainmatch`
--
ALTER TABLE `mainmatch`
  ADD CONSTRAINT `mainmatch_ibfk_1` FOREIGN KEY (`id_athlete`) REFERENCES `member` (`id_athlete`),
  ADD CONSTRAINT `mainmatch_ibfk_2` FOREIGN KEY (`id_style`) REFERENCES `style` (`id_style`),
  ADD CONSTRAINT `mainmatch_ibfk_3` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Ketidakleluasaan untuk tabel `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id_camp`) REFERENCES `camp` (`id_camp`);

--
-- Ketidakleluasaan untuk tabel `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `mainmatch` (`id_match`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
