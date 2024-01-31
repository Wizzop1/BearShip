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
-- Table structure for table `restaurantsmenu`
--

DROP TABLE IF EXISTS `restaurantsmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantsmenu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `food_name` varchar(45) DEFAULT NULL,
  `rest_iid` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `id_menu_UNIQUE` (`id_menu`),
  KEY `rest_iid_idx` (`rest_iid`),
  CONSTRAINT `rest_iid` FOREIGN KEY (`rest_iid`) REFERENCES `restaurants` (`idrestaurants`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantsmenu`
--

LOCK TABLES `restaurantsmenu` WRITE;
/*!40000 ALTER TABLE `restaurantsmenu` DISABLE KEYS */;
INSERT INTO `restaurantsmenu` VALUES (1,NULL,20,4,'https://s3-us-west-2.amazonaws.com/craftbeerdotcom/wp-content/uploads/fall-beer-stein.jpg','Beer',1,NULL),(5,'salad',5,6,'https://totsfamily.com/wp-content/uploads/2017/03/IMG_4223.jpg','Salad',NULL,NULL),(6,'asian',12,18,'https://cdn.lifehack.org/wp-content/uploads/2014/08/Michael-Jaccarino-Sushi-Make-Roll.jpg','Sushi',NULL,NULL),(7,'asian',12,19,'https://cdn.lifehack.org/wp-content/uploads/2014/08/Michael-Jaccarino-Sushi-Make-Roll.jpg','Sushi',NULL,NULL),(8,'asian',12,19,'https://cdn.lifehack.org/wp-content/uploads/2014/08/Michael-Jaccarino-Sushi-Make-Roll.jpg','Sushi',NULL,NULL),(9,'asian',12,18,'https://cdn.lifehack.org/wp-content/uploads/2014/08/Michael-Jaccarino-Sushi-Make-Roll.jpg','Sushi',11,NULL),(11,'meat',10,3,'https://i.imgur.com/vAiSw9P.png','Chum burger',12,NULL),(13,'meat',6,20,'https://kitchmenow.com/wp-content/uploads/2020/10/JUICY-ROASTED-CHICKEN.jpg','Chicken',5,800),(15,'meat',20,8,'https://i.pinimg.com/originals/fa/56/52/fa5652815965cb47d40a346e1dd562f6.jpg','Burgir',13,400);
/*!40000 ALTER TABLE `restaurantsmenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 15:59:50
