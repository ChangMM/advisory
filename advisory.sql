-- MySQL dump 10.13  Distrib 5.7.15, for osx10.11 (x86_64)
--
-- Host: localhost    Database: advisory
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `meet_advisory`
--

DROP TABLE IF EXISTS `meet_advisory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet_advisory` (
  `name` varchar(25) NOT NULL,
  `id` int(4) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `workplace` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `job_type` varchar(25) NOT NULL,
  `area` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `money` varchar(25) NOT NULL,
  `money_from` varchar(25) NOT NULL,
  `info` varchar(64) NOT NULL,
  `info_more` varchar(25) NOT NULL,
  `feedback` varchar(300) NOT NULL,
  `random` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet_advisory`
--

LOCK TABLES `meet_advisory` WRITE;
/*!40000 ALTER TABLE `meet_advisory` DISABLE KEYS */;
INSERT INTO `meet_advisory` VALUES ('子矜',0,'13476179904','1769111903@qq.com','冰岩作坊','前端','国有企业','5000','上海市','2','公司投资','卡丁车场','室内场馆','这是测试的反馈此','d4fgr');
/*!40000 ALTER TABLE `meet_advisory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speed_advisory`
--

DROP TABLE IF EXISTS `speed_advisory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speed_advisory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(25) NOT NULL DEFAULT '' COMMENT '省份',
  `district` varchar(25) NOT NULL DEFAULT '' COMMENT '地区',
  `city` varchar(25) NOT NULL DEFAULT '',
  `city_type` varchar(25) NOT NULL DEFAULT '',
  `area` varchar(25) NOT NULL DEFAULT '',
  `land` varchar(25) NOT NULL DEFAULT '',
  `land_type` varchar(25) NOT NULL DEFAULT '',
  `dis_high` varchar(25) NOT NULL DEFAULT '',
  `dis_center` varchar(25) NOT NULL DEFAULT '',
  `dis_airplane` varchar(25) NOT NULL DEFAULT '',
  `center_money` varchar(25) NOT NULL DEFAULT '',
  `business_money` varchar(25) NOT NULL DEFAULT '',
  `people_num` varchar(25) NOT NULL,
  `people_200_num` varchar(25) NOT NULL,
  `view_type` varchar(25) NOT NULL,
  `city_num` varchar(25) NOT NULL,
  `has_place` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `workplace` varchar(25) NOT NULL,
  `job` varchar(25) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `random` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_advisory`
--

LOCK TABLES `speed_advisory` WRITE;
/*!40000 ALTER TABLE `speed_advisory` DISABLE KEYS */;
INSERT INTO `speed_advisory` VALUES (1,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(2,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(3,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(4,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(5,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(6,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com',''),(7,'河南','undefined','地级市','驻马店','234','，农田，荒地','，平地','4545','345','232','2345','1','234','33','4A','45','无','常明明','华中科技大学','前端工程师','13476179904','cmm@bingyan.net','');
/*!40000 ALTER TABLE `speed_advisory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-16 20:28:06
