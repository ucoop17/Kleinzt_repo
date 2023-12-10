/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - db_dwh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_dwh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_dwh`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL DEFAULT 0,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen` */

insert  into `dosen`(`id`,`nama`,`alamat`) values 
(1,'pegawai','menyimpan data dosen dan pegawai di seluruh unud lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah'),
(2,'mahasiswa','menyimpan data mahasiswa aktif udayana lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah'),
(3,'alumni','menyimpan data mahasiswa yang telah lulus di udayana lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL DEFAULT 0,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`id`,`nama`,`alamat`) values 
(1,'pegawai','menyimpan data dosen dan pegawai di seluruh unud lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah'),
(2,'mahasiswa','menyimpan data mahasiswa aktif ipk tinggi udayana lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah'),
(3,'alumni','menyimpan data mahasiswa yang telah lulus di udayana lengkap dengan alamat, kode pos, tgl lahir, email, golongan darah');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
