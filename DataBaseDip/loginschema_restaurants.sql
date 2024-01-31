-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: loginschema
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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `idrestaurants` int NOT NULL AUTO_INCREMENT,
  `namerestaurants` varchar(45) DEFAULT NULL,
  `descrestaurants` varchar(1500) DEFAULT NULL,
  `addressrestaurants` varchar(45) DEFAULT NULL,
  `ratingrestaurants` varchar(45) DEFAULT NULL,
  `imagerestaurants` varchar(500) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `owner_id` int NOT NULL,
  `owner_id2` int DEFAULT NULL,
  PRIMARY KEY (`idrestaurants`),
  UNIQUE KEY `owner_id_UNIQUE` (`owner_id`),
  KEY `owner_id2_idx` (`owner_id2`),
  CONSTRAINT `owner_id2` FOREIGN KEY (`owner_id2`) REFERENCES `register` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'China','Chinasinfaosfijaosijdoija','Sofiq, Bl. 99','5','http://anitalianinmykitchen.com/wp-content/uploads/2015/06/pasta-1-1-of-1-1.jpg',5,1,NULL),(5,'tedhewsg','sedgawg','aegawgwag','6','https://www.timeoutdoha.com/public/images/2020/07/29/MAYADOHA-2.jpg',6,19,19),(11,'Noodles Shop','Here at Noodles Shop, our name pretty much says it all. Were all about Noodles and the company that makes them all that much more enjoyable. Its why every dish we make is handmade exactly the way you like and why every order is served with the flavors and experiences to make it truly special.','America, New York','5','https://www.timeoutdoha.com/public/images/2020/07/29/MAYADOHA-2.jpg',NULL,9,9),(12,'Bikini Bottom','An exquisite restaurant made from the all time favorite cartoon called \"SpongeBob\". In this restaurant you will be able to find one of the best seafood offers to ever exist in Sofia.','Bikini Bottom, 15','5','https://vignette.wikia.nocookie.net/spongebob/images/4/42/Bottle_Burglars_072.png/revision/latest?cb=20180414142257',NULL,21,21),(13,'Happy Bar&Grill','Happy Bar & Grill &#1077; &#1074;&#1077;&#1088;&#1080;&#1075;&#1072; &#1086;&#1090; &#1077;&#1078;&#1077;&#1076;&#1085;&#1077;&#1074;&#1085;&#1080; &#1088;&#1077;&#1089;&#1090;&#1086;&#1088;&#1072;&#1085;&#1090;&#1080; &#1074; &#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1080;&#1103; &#1080; &#1041;&#1072;&#1088;&#1089;&#1077;&#1083;&#1086;&#1085;&#1072;, &#1080;&#1079;&#1074;&#1077;&#1089;&#1090;&#1085;&#1072; &#1089;&#1098;&#1089; &#1089;&#1074;&#1086;&#1077;&#1090;&#1086; &#1080;&#1079;&#1082;&#1083;&#1102;&#1095;&#1080;&#1090;&#1077;&#1083;&#1085;&#1086; &#1082;&#1072;&#1095;&#1077;&#1089;&#1090;&#1074;&#1086; &#1085;&#1072; &#1093;&#1088;&#1072;&#1085;&#1072;&#1090;&#1072; &#1080; &#1077;&#1084;&#1073;&#1083;&#1077;&#1084;&#1072;&#1090;&#1080;&#1095;&#1085;&#1086; &#1086;&#1073;&#1089;&#1083;&#1091;&#1078;&#1074;&#1072;&#1085;&#1077;.','Plovdiv, na mainata si','8','https://media-cdn.tripadvisor.com/media/photo-s/10/de/13/ab/in-the-centre-of-plovdiv.jpg',NULL,24,NULL),(16,'Prolet','Proleten restorant','Prolet','3','https://i.pinimg.com/originals/32/ae/08/32ae0812052c320df139cce03cab5931.jpg',NULL,26,NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 15:59:51
