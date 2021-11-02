CREATE DATABASE  IF NOT EXISTS `quanlyvattu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlyvattu`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlyvattu
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `ctdhId` int NOT NULL AUTO_INCREMENT,
  `ddhId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongDat` int DEFAULT NULL,
  PRIMARY KEY (`ctdhId`),
  KEY `ddhId` (`ddhId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`ddhId`) REFERENCES `dondathang` (`ddhId`),
  CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (1,1,1,400),(2,2,2,700),(3,3,3,600),(4,1,4,1000),(5,1,5,350),(6,2,3,1100),(7,4,1,5000);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `ctpnId` int NOT NULL AUTO_INCREMENT,
  `pnId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongNhap` int DEFAULT NULL,
  `donGiaNhap` int DEFAULT NULL,
  PRIMARY KEY (`ctpnId`),
  KEY `pnId` (`pnId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`pnId`) REFERENCES `phieunhap` (`pnId`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieunhap`
--

LOCK TABLES `chitietphieunhap` WRITE;
/*!40000 ALTER TABLE `chitietphieunhap` DISABLE KEYS */;
INSERT INTO `chitietphieunhap` VALUES (1,1,1,400,160000000),(2,1,4,1000,630000000),(3,1,5,350,350000000),(4,2,2,700,210000000),(5,2,3,1100,275000000),(6,3,3,600,150000000);
/*!40000 ALTER TABLE `chitietphieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieuxuat`
--

DROP TABLE IF EXISTS `chitietphieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieuxuat` (
  `ctpxId` int NOT NULL AUTO_INCREMENT,
  `pxId` int NOT NULL,
  `vtId` int NOT NULL,
  `soLuongXuat` int DEFAULT NULL,
  `donGiaXuat` int DEFAULT NULL,
  PRIMARY KEY (`ctpxId`),
  KEY `pxId` (`pxId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `chitietphieuxuat_ibfk_1` FOREIGN KEY (`pxId`) REFERENCES `phieuxuat` (`pxId`),
  CONSTRAINT `chitietphieuxuat_ibfk_2` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieuxuat`
--

LOCK TABLES `chitietphieuxuat` WRITE;
/*!40000 ALTER TABLE `chitietphieuxuat` DISABLE KEYS */;
INSERT INTO `chitietphieuxuat` VALUES (1,1,1,120,48000000),(2,1,3,230,57500000),(3,1,4,340,214200000),(4,2,2,450,135000000),(5,2,3,130,32500000),(6,3,5,150,150000000);
/*!40000 ALTER TABLE `chitietphieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dondathang` (
  `ddhId` int NOT NULL AUTO_INCREMENT,
  `nccId` int NOT NULL,
  `ddhCode` varchar(255) DEFAULT NULL,
  `ddhNgayDatHang` date DEFAULT NULL,
  PRIMARY KEY (`ddhId`),
  KEY `nccId` (`nccId`),
  CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`nccId`) REFERENCES `nhacungcap` (`nccId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dondathang`
--

LOCK TABLES `dondathang` WRITE;
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
INSERT INTO `dondathang` VALUES (1,1,'DH1','2021-11-01'),(2,2,'DH2','2021-10-20'),(3,3,'DH3','2021-10-11'),(4,3,'DDH4','2020-02-01');
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhacungcap` (
  `nccId` int NOT NULL AUTO_INCREMENT,
  `nccCode` varchar(255) DEFAULT NULL,
  `nccName` varchar(255) DEFAULT NULL,
  `nccAddress` varchar(255) DEFAULT NULL,
  `nccPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nccId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhacungcap`
--

LOCK TABLES `nhacungcap` WRITE;
/*!40000 ALTER TABLE `nhacungcap` DISABLE KEYS */;
INSERT INTO `nhacungcap` VALUES (1,'Apple','NCC Apple','Mỹ','012345689'),(2,'Amazon','NCC Amazon','Mỹ','012467648'),(3,'Xiaomi','NCC Xiaomi','Trung Quốc','091247588');
/*!40000 ALTER TABLE `nhacungcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `pnId` int NOT NULL AUTO_INCREMENT,
  `ddhId` int NOT NULL,
  `pnCode` varchar(255) DEFAULT NULL,
  `pnNgayNhap` date DEFAULT NULL,
  PRIMARY KEY (`pnId`),
  KEY `ddhId` (`ddhId`),
  CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`ddhId`) REFERENCES `dondathang` (`ddhId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhap`
--

LOCK TABLES `phieunhap` WRITE;
/*!40000 ALTER TABLE `phieunhap` DISABLE KEYS */;
INSERT INTO `phieunhap` VALUES (1,1,'Nhập hàng Apple','2021-11-03'),(2,2,'Nhập hàng Amazon','2021-10-26'),(3,3,'Nhập hàng Xiaomi','2021-11-11');
/*!40000 ALTER TABLE `phieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuat`
--

DROP TABLE IF EXISTS `phieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuat` (
  `pxId` int NOT NULL AUTO_INCREMENT,
  `pxCode` varchar(255) DEFAULT NULL,
  `pxNgayXuat` date DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pxId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuat`
--

LOCK TABLES `phieuxuat` WRITE;
/*!40000 ALTER TABLE `phieuxuat` DISABLE KEYS */;
INSERT INTO `phieuxuat` VALUES (1,'PX1','2021-11-26','Lộc'),(2,'PX2','2021-11-30','Khánh'),(3,'PX3','2021-12-01','Bình');
/*!40000 ALTER TABLE `phieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tonkho`
--

DROP TABLE IF EXISTS `tonkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tonkho` (
  `tkId` int NOT NULL AUTO_INCREMENT,
  `vtId` int NOT NULL,
  `tkSoLuongDau` int DEFAULT NULL,
  `tkSoLuongNhap` int DEFAULT NULL,
  `tkSoLuongXuat` int DEFAULT NULL,
  PRIMARY KEY (`tkId`),
  KEY `vtId` (`vtId`),
  CONSTRAINT `tonkho_ibfk_1` FOREIGN KEY (`vtId`) REFERENCES `vattu` (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tonkho`
--

LOCK TABLES `tonkho` WRITE;
/*!40000 ALTER TABLE `tonkho` DISABLE KEYS */;
INSERT INTO `tonkho` VALUES (1,1,10,400,120),(2,2,5,640,450),(3,3,20,1700,360),(4,4,12,1000,340),(5,5,20,350,150);
/*!40000 ALTER TABLE `tonkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vattu`
--

DROP TABLE IF EXISTS `vattu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vattu` (
  `vtId` int NOT NULL AUTO_INCREMENT,
  `vtCode` varchar(255) DEFAULT NULL,
  `vtName` varchar(255) DEFAULT NULL,
  `vtDonViTinh` varchar(255) DEFAULT NULL,
  `vtPrice` int DEFAULT NULL,
  PRIMARY KEY (`vtId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vattu`
--

LOCK TABLES `vattu` WRITE;
/*!40000 ALTER TABLE `vattu` DISABLE KEYS */;
INSERT INTO `vattu` VALUES (1,'TuLanh','Tủ lạnh','cai',400000),(2,'DieuHoa','Điều hòa','cai',300000),(3,'BepDien','Bếp điện','cai',250000),(4,'MaySayToc','Máy sấy tóc','bo',630000),(5,'Laptop','Laptop','cai',1000000);
/*!40000 ALTER TABLE `vattu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_ctpnhap`
--

DROP TABLE IF EXISTS `vw_ctpnhap`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap` AS SELECT 
 1 AS `pnCode`,
 1 AS `pnId`,
 1 AS `vtId`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpnhap_loc1`
--

DROP TABLE IF EXISTS `vw_ctpnhap_loc1`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_loc1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap_loc1` AS SELECT 
 1 AS `pnCode`,
 1 AS `vtId`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien nhap`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpnhap_vt`
--

DROP TABLE IF EXISTS `vw_ctpnhap_vt`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap_vt` AS SELECT 
 1 AS `pnCode`,
 1 AS `vtId`,
 1 AS `vtName`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien nhap`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpnhap_vt_loc`
--

DROP TABLE IF EXISTS `vw_ctpnhap_vt_loc`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_loc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap_vt_loc` AS SELECT 
 1 AS `pnCode`,
 1 AS `vtId`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien nhap`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpnhap_vt_pn`
--

DROP TABLE IF EXISTS `vw_ctpnhap_vt_pn`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_pn`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap_vt_pn` AS SELECT 
 1 AS `pnCode`,
 1 AS `pnNgayNhap`,
 1 AS `ddhId`,
 1 AS `soLuongDat`,
 1 AS `vtId`,
 1 AS `vtName`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien nhap`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpnhap_vt_pn_dh`
--

DROP TABLE IF EXISTS `vw_ctpnhap_vt_pn_dh`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_pn_dh`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpnhap_vt_pn_dh` AS SELECT 
 1 AS `pnCode`,
 1 AS `ddhNgayDatHang`,
 1 AS `soLuongDat`,
 1 AS `nccCode`,
 1 AS `vtId`,
 1 AS `vtName`,
 1 AS `soLuongNhap`,
 1 AS `donGiaNhap`,
 1 AS `Thanh tien nhap`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpxuat`
--

DROP TABLE IF EXISTS `vw_ctpxuat`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpxuat` AS SELECT 
 1 AS `pxCode`,
 1 AS `vtCode`,
 1 AS `soLuongXuat`,
 1 AS `donGiaXuat`,
 1 AS `Thanh Tien Xuat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpxuat_vt`
--

DROP TABLE IF EXISTS `vw_ctpxuat_vt`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat_vt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpxuat_vt` AS SELECT 
 1 AS `pxCode`,
 1 AS `vtCode`,
 1 AS `vtName`,
 1 AS `soLuongXuat`,
 1 AS `donGiaXuat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ctpxuat_vt_px`
--

DROP TABLE IF EXISTS `vw_ctpxuat_vt_px`;
/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat_vt_px`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ctpxuat_vt_px` AS SELECT 
 1 AS `pxCode`,
 1 AS `customerName`,
 1 AS `vtCode`,
 1 AS `vtName`,
 1 AS `soLuongXuat`,
 1 AS `donGiaXuat`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_ctpnhap`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap` AS select `p`.`pnCode` AS `pnCode`,`p`.`pnId` AS `pnId`,`v`.`vtId` AS `vtId`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien` from ((`phieunhap` `p` join `chitietphieunhap` `c` on((`p`.`pnId` = `c`.`pnId`))) join `vattu` `v` on((`v`.`vtId` = `c`.`vtId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpnhap_loc1`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_loc1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap_loc1` AS select `p`.`pnCode` AS `pnCode`,`v`.`vtId` AS `vtId`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien nhap` from ((`phieunhap` `p` join `chitietphieunhap` `c` on((`p`.`pnId` = `c`.`pnId`))) join `vattu` `v` on((`v`.`vtId` = `c`.`vtId`))) where (`c`.`soLuongNhap` < 500) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpnhap_vt`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap_vt` AS select `p`.`pnCode` AS `pnCode`,`v`.`vtId` AS `vtId`,`v`.`vtName` AS `vtName`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien nhap` from ((`phieunhap` `p` join `chitietphieunhap` `c` on((`p`.`pnId` = `c`.`pnId`))) join `vattu` `v` on((`v`.`vtId` = `c`.`vtId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpnhap_vt_loc`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_loc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap_vt_loc` AS select `p`.`pnCode` AS `pnCode`,`v`.`vtId` AS `vtId`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien nhap` from ((`phieunhap` `p` join `chitietphieunhap` `c` on((`p`.`pnId` = `c`.`pnId`))) join `vattu` `v` on((`v`.`vtId` = `c`.`vtId`))) where (`v`.`vtDonViTinh` = 'bo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpnhap_vt_pn`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_pn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap_vt_pn` AS select `p`.`pnCode` AS `pnCode`,`p`.`pnNgayNhap` AS `pnNgayNhap`,`c2`.`ddhId` AS `ddhId`,`c2`.`soLuongDat` AS `soLuongDat`,`v`.`vtId` AS `vtId`,`v`.`vtName` AS `vtName`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien nhap` from (((`chitietphieunhap` `c` join `vattu` `v` on((`c`.`vtId` = `v`.`vtId`))) join `phieunhap` `p` on((`p`.`pnId` = `c`.`pnId`))) join `chitietdonhang` `c2` on(((`v`.`vtId` = `c2`.`vtId`) and (`p`.`ddhId` = `c2`.`ddhId`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpnhap_vt_pn_dh`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpnhap_vt_pn_dh`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpnhap_vt_pn_dh` AS select `p`.`pnCode` AS `pnCode`,`d`.`ddhNgayDatHang` AS `ddhNgayDatHang`,`c2`.`soLuongDat` AS `soLuongDat`,`n`.`nccCode` AS `nccCode`,`v`.`vtId` AS `vtId`,`v`.`vtName` AS `vtName`,`c`.`soLuongNhap` AS `soLuongNhap`,`c`.`donGiaNhap` AS `donGiaNhap`,(`c`.`soLuongNhap` * `c`.`donGiaNhap`) AS `Thanh tien nhap` from (((((`phieunhap` `p` join `chitietphieunhap` `c` on((`p`.`pnId` = `c`.`pnId`))) join `vattu` `v` on((`v`.`vtId` = `c`.`vtId`))) join `dondathang` `d` on((`p`.`ddhId` = `d`.`ddhId`))) join `chitietdonhang` `c2` on((`c2`.`ctdhId` = `c`.`ctpnId`))) join `nhacungcap` `n` on((`d`.`nccId` = `n`.`nccId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpxuat`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpxuat` AS select `p`.`pxCode` AS `pxCode`,`v`.`vtCode` AS `vtCode`,`c`.`soLuongXuat` AS `soLuongXuat`,`c`.`donGiaXuat` AS `donGiaXuat`,(`c`.`soLuongXuat` * `c`.`donGiaXuat`) AS `Thanh Tien Xuat` from ((`vattu` `v` join `chitietphieuxuat` `c` on((`v`.`vtId` = `c`.`vtId`))) join `phieuxuat` `p` on((`c`.`pxId` = `p`.`pxId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpxuat_vt`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat_vt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpxuat_vt` AS select `p`.`pxCode` AS `pxCode`,`v`.`vtCode` AS `vtCode`,`v`.`vtName` AS `vtName`,`c`.`soLuongXuat` AS `soLuongXuat`,`c`.`donGiaXuat` AS `donGiaXuat` from ((`vattu` `v` join `chitietphieuxuat` `c` on((`v`.`vtId` = `c`.`vtId`))) join `phieuxuat` `p` on((`c`.`pxId` = `p`.`pxId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ctpxuat_vt_px`
--

/*!50001 DROP VIEW IF EXISTS `vw_ctpxuat_vt_px`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ctpxuat_vt_px` AS select `p`.`pxCode` AS `pxCode`,`p`.`customerName` AS `customerName`,`v`.`vtCode` AS `vtCode`,`v`.`vtName` AS `vtName`,`c`.`soLuongXuat` AS `soLuongXuat`,`c`.`donGiaXuat` AS `donGiaXuat` from ((`vattu` `v` join `chitietphieuxuat` `c` on((`v`.`vtId` = `c`.`vtId`))) join `phieuxuat` `p` on((`c`.`pxId` = `p`.`pxId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 10:14:28
