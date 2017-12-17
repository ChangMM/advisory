-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: advisory
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1-log

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet_advisory`
--

LOCK TABLES `meet_advisory` WRITE;
/*!40000 ALTER TABLE `meet_advisory` DISABLE KEYS */;
INSERT INTO `meet_advisory` VALUES (1,'子矜','13476179904','1769111903@qq.com','冰岩作坊','前端','国有企业','5000','上海市','2','公司投资','卡丁车场','室内场馆','这是测试的反馈此','d4fgr'),(6,'沈一川','18616230727','shenyichuan@jennyao.com','同济','无','国有企业','500','杭州','2','自有','城市 SUV 体验赛道','竞速型','','C0HUK'),(11,'侯毅','13580547329','429379525@qq.com','香港嘉华公司','经理','民营企业','600','广州','100','自有','赛车场、赛道','二级','汽车产业综合平台','MHQCF'),(15,'张飞鹏','13991380443','1359520227@qq.com','个人','个人','民营企业','400','陕西西安','1.5','自有','赛车场、赛道','三级','整体规划1000亩汽车主题公园，其中赛场我不知道需要投多少钱合适，赛场只是配套项目，请告诉我f3赛道或者其他赛道的平均投资额度大小，包括设计，听其他人说300亩就可以，当然也可以到400亩，目前深圳豪庭赛车联系过我们，想让我们提供场地让他们自己建设，或者我们建好交与他们运行，由于我们是做房地产开发的，这方面也不懂，故才在网上找到你们，打扰你们了','FS4IQ');
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
  `business_area` varchar(25) NOT NULL,
  `result` varchar(640) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_advisory`
--

LOCK TABLES `speed_advisory` WRITE;
/*!40000 ALTER TABLE `speed_advisory` DISABLE KEYS */;
INSERT INTO `speed_advisory` VALUES (2,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com','','',''),(3,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com','','',''),(4,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com','','',''),(5,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com','','',''),(6,'上海','华东地区','上海','省会城市','300','荒地','林地','345','324','600','230','340','5000','234','5A','45','有','子矜','华中科技大学','前端','13476179904','1769111903@qq.com','','',''),(7,'河南','undefined','地级市','驻马店','234','，农田，荒地','，平地','4545','345','232','2345','1','234','33','4A','45','无','常明明','华中科技大学','前端工程师','13476179904','cmm@bingyan.net','','',''),(15,'山东','undefined','副省级城市','青岛','1500','建设用地，林地','平地','19','10','20','150000','10','200','600','5A','2','无','姚启明','同济','1','1','1','','',''),(17,'北京','undefined','省会城市','北京','500','林地','平地','5','20','15','2000','0.5','20','3000','5A','5','无','王先生','北京嘉盈嘉集团','副总','13501355556','king626@qq.com','','',''),(22,'','undefined','省会城市','西安','300','建设用地','平地','10','30','60','100000','0','870','1000','5A','9','无','张飞鹏','个人','个人','13991380443','1359520227@qq.com','','700','您的场地地理位置一般、交通便捷、周边人口密度一般、周边已有赛车场。\r\n 现有用地可以建设国际赛道。\r\n现有资金适合建设体验赛道。\r\n');
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

-- Dump completed on 2017-12-17 17:14:58
