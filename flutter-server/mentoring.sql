-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Mar 2021 pada 08.53
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mentoring`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(125) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `foto`, `tgl_berita`) VALUES
(1, 'Bebek', 'Kebutuhan daging bebek di beberapa daerah cukup tinggi,apalagi di Surabaya yang setiap sudutnya ada warung nasi bebek. Belum lagi, kebutuhan telur asin yang berasal dari bebek yang semakin meningkat. Beternak bebek pun tergolong mudah dan low maintenance. Makanannya pun murah,kamu bisa memberinya dedak,ampas tahu hingga bekicot.', 'bebek.jpg', '2021-03-04 00:00:00'),
(2, 'Ayam', 'Kamu bisa memelihara ayam untuk diambil daging atau telurnya. Bahkan,bulunya bisa digunakan sebagai bahan baku untuk membuat kemoceng. Salah satu ayam pedaging terbaik adalah ayam cornish. Dalam waktu 6-8 minggu,ayam jantan dewasa bisa tumbuh hingga 3,86 kg dan ayam betina dewasa memiliki berat maksimal 2,57 kg.', 'ayam.jpg', '2021-03-06 00:00:00'),
(3, 'Lele', 'Mungkin,selama ini kita sering meremehkan lelucon ternak lele yang bermunculan di sosial media. Padahal, ikan satu ini membawa keuntungan besar lho!. Untuk spesies lele dumbo yang berusia 18-36 bulan beratnya bisa mencapai 1-2 kg per ekor.', 'lele.jpg', '2021-03-06 00:00:00'),
(4, 'Ayam Puyuh', 'Kalau kamu tidak punya lahan yang cukup luas untuk memelihara ayam,kamu bisa beternak ayam puyuh. Ayam puyuh berukuran mungil,hanya 150-200 gram per ekor dan telurnya memiliki berat 7-15 gram per butir. Menurut laman Roys Farm ayam puyuh betina bisa mulai bertelur sejak usia 6-7 minggu.', 'puyuh.jpg', '2021-03-07 00:00:00'),
(5, 'Burung Dara', 'Meski tidak sepopuler daging ayam atau bebek,sebagian daerah suka mengonsumsi daging burung dara. Dalam usia 6 bulan burung dara sudah mulai bertelur dan rata-rata menghasilkan 2-3 ekor anak per bulan,ungkap laman Roys Farm. Telur burung dara biasanya membutuhkan waktu 18 hari untuk menetas.', 'dara.jpg', '2021-03-07 00:00:00'),
(6, 'Kelinci', 'Rata-rata orang indonesia tidak tega memakan daging kelinci. Meski begitu,di daerah tertentu makan daging kelinci adalah hal yang lazim. Thats why,daging kelinci masih dibutuhkan dan menguntungkan. Yang menarik,kelinci beranak pinak sangat cepat. Kelinci betina bisa menghasilkan 2-8 ekor anak kelinci dalam sekali melahirkan', 'kelinci.jpg', '2021-03-07 00:00:00'),
(7, 'Itik', 'Sebagai alternatif selain bebek,kamu bisa memelihara itik atau mentok untuk diambil daging dan telurnya. Itik termasuk hewan ternak yang low maintenance dan tidak gampang jatuh sakit. Kamu bisa mencoba dengan 4-5 mentok betina dan satu mentok jantan dahulu.', 'itik.jpg', '2021-03-07 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id_kamus` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `pengertian` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kamus`
--

INSERT INTO `tb_kamus` (`id_kamus`, `nama`, `pengertian`) VALUES
(1, 'hospes', 'hewan yang dimasuki bibit penyakit'),
(2, 'pangan', 'bahan yang dapat dimakan dan menyediakan zat makanan pada manusia'),
(3, 'Ad Libtium', 'sistem pemeberian pakan yang tidak terbatas'),
(4, 'Manogastrik', 'hewan berperut tunggal dan sederhana'),
(5, 'ADC', 'koefisien cerna semu'),
(6, 'Vitamin', 'senyawa organik yang merupakan komponen yang terdapat didalam makanan dengan jumlah sedikit'),
(7, 'Air Metabolis', 'air hasil oksidasi komponen organik dalam sel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `full_name` text NOT NULL,
  `sex` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_daftar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `full_name`, `sex`, `password`, `alamat`, `tgl_daftar`) VALUES
(1, 'reza', 'reza@gmail.com', 'reza pramita', 'cewe', 'e10adc3949ba59abbe56e057f20f883e', 'brebes', '4 maret 2021'),
(2, 'reza2', 'reza@gmail.com', 'reza Pramita', 'Perempuan', 'e1d29d506bbb8e1627790a570f232d74', 'brebes', '2021-03-06 23:20:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id_kamus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
