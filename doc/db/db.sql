-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 180.176.213.32    Database: slt
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bu`
--

DROP TABLE IF EXISTS `bu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bu` (
  `bucode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `login_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placebet_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settlebet_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `getbalance_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancelbet_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bucode`),
  UNIQUE KEY `bucode_UNIQUE` (`bucode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bu`
--

LOCK TABLES `bu` WRITE;
/*!40000 ALTER TABLE `bu` DISABLE KEYS */;
INSERT INTO `bu` VALUES ('BU001','http://bu001.com:8081/login','http://bu001.com:8081/placebet','http://bu001.com:8081/settle','http://bu001.com:8081/getbalance','http://bu001.com:8081/cancelbet');
/*!40000 ALTER TABLE `bu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bucoinsize`
--

DROP TABLE IF EXISTS `bucoinsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bucoinsize` (
  `bucoinsizeid` int(11) NOT NULL AUTO_INCREMENT,
  `bucode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gamesn` int(3) DEFAULT NULL,
  `coinsize_groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bucoinsizeid`),
  UNIQUE KEY `bucoinsizeid_UNIQUE` (`bucoinsizeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bucoinsize`
--

LOCK TABLES `bucoinsize` WRITE;
/*!40000 ALTER TABLE `bucoinsize` DISABLE KEYS */;
INSERT INTO `bucoinsize` VALUES (1,'BU001',9,1);
/*!40000 ALTER TABLE `bucoinsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinsize`
--

DROP TABLE IF EXISTS `coinsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coinsize` (
  `coinsizeid` int(11) NOT NULL AUTO_INCREMENT,
  `coinsize` decimal(4,2) DEFAULT NULL,
  `coinsize_groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`coinsizeid`),
  UNIQUE KEY `coinsizeid_UNIQUE` (`coinsizeid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinsize`
--

LOCK TABLES `coinsize` WRITE;
/*!40000 ALTER TABLE `coinsize` DISABLE KEYS */;
INSERT INTO `coinsize` VALUES (1,0.10,1),(2,0.50,1),(3,1.00,1),(4,2.00,1),(5,5.00,1),(6,10.00,1),(7,0.05,2),(8,0.10,2),(9,0.25,2),(10,0.50,2),(11,1.00,2),(12,5.00,2);
/*!40000 ALTER TABLE `coinsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinsizegroup`
--

DROP TABLE IF EXISTS `coinsizegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coinsizegroup` (
  `coinsize_groupid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`coinsize_groupid`),
  UNIQUE KEY `coinsize_groupid_UNIQUE` (`coinsize_groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinsizegroup`
--

LOCK TABLES `coinsizegroup` WRITE;
/*!40000 ALTER TABLE `coinsizegroup` DISABLE KEYS */;
INSERT INTO `coinsizegroup` VALUES (1),(2);
/*!40000 ALTER TABLE `coinsizegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `gamesn` int(3) unsigned NOT NULL,
  `min_multiplier` int(2) NOT NULL,
  `max_multiplier` int(2) NOT NULL,
  `basecredit` int(2) NOT NULL,
  `engineSN` int(2) NOT NULL,
  `coinsize_groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`gamesn`),
  UNIQUE KEY `gamesn_UNIQUE` (`gamesn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (9,1,10,50,6,NULL);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameplay`
--

DROP TABLE IF EXISTS `gameplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameplay` (
  `gameplayid` int(11) NOT NULL AUTO_INCREMENT,
  `wagerid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalpayout_c` decimal(13,2) DEFAULT NULL,
  `totalpayout_m` decimal(13,2) DEFAULT NULL,
  `result` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SymbolResult      [][]string\nPayoutResultList  []*PayoutResult\n\n*PayoutResult:\n            TotalCreditPayout uint64 //這一個中獎線的結果乘上FREE倍數後的CreditPayout\n	CreditPayout      uint64\n	Multiplier        uint8\n	Paylines          uint8 //幾連線\n	SymbolID          string\n	Ways              [][]int8 //中幾線\n',
  PRIMARY KEY (`gameplayid`),
  UNIQUE KEY `gameplayid_UNIQUE` (`gameplayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameplay`
--

LOCK TABLES `gameplay` WRITE;
/*!40000 ALTER TABLE `gameplay` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wager`
--

DROP TABLE IF EXISTS `wager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wager` (
  `wagerid` int(11) NOT NULL AUTO_INCREMENT,
  `gamesn` int(3) DEFAULT NULL,
  `bucode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `membercode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalstake_c` decimal(13,2) DEFAULT NULL,
  `totalstake_m` decimal(13,2) DEFAULT NULL,
  `totalpayout_c` decimal(13,2) DEFAULT NULL,
  `totalpayout_m` decimal(13,2) DEFAULT NULL,
  `gamestate` int(2) DEFAULT NULL,
  `totalfreespin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currentfreespin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wagerid`),
  UNIQUE KEY `wagerid_UNIQUE` (`wagerid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wager`
--

LOCK TABLES `wager` WRITE;
/*!40000 ALTER TABLE `wager` DISABLE KEYS */;
INSERT INTO `wager` VALUES (3,1,'BU001','AllenLiao',1000.50,1000.50,1000.50,1000.50,NULL,NULL,NULL),(4,1,'BU001','AllenLiao',1000.50,1000.50,1000.50,1000.50,NULL,NULL,NULL),(5,1,'BU001','AllenLiao',1000.50,1000.50,1000.50,1000.50,NULL,NULL,NULL),(6,1,'BU001','AllenLiao',1000.50,1000.50,1000.50,1000.50,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wager` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-05  8:20:23
