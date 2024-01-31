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
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `fullname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL DEFAULT 'User',
  `money` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('Bearship Admin','BearShip','admin@bear.com','1q2w3e4r',6,'admin',NULL,NULL,NULL,NULL),('Please Worke','workee','workee@gmail.com','111222',8,'user',NULL,NULL,NULL,NULL),('AdminLol','AdminLol','adminlol@gmail.com','adminlol',9,'admin','1800',NULL,'0882222222','ASDSGER aids 2'),('qweqweqw','sdfdsdfs','sdgds@gma.com','111',13,'user','300','male','0882222222','ASDSGER aids 2'),('restOwnerTest','restOwnerTest','test1@gmail.com','test1',15,'restaurant owner','999999','company','092489123498','sfasd asd'),('Customer Support','custsupport','supp@gmail.com','supp',16,'user','846','female','08812388123','Worke Worke'),('sdrfgshg','dfhrhdfr','login@mail.bg','11',18,'user','300','female','0882222222','ASDSGER aids 2'),('Carmen Winstead','carmen','carmenwinstead@gmail.com','carmen',19,'restaurant owner','123','female','2423123123','Somewhere I dont Care'),('Freddy Faz Bear','freddy','freddy@gmail.com','freddy',20,'restaurant owner','200','male','15124123','Freddys Pizzaria'),('Second Admin','secadmin','sec123@gmail.com','sec',21,'admin','771','male','1230182309','Bulgariq, Sofiq, bl 100'),('3admin','admin','admin@gmail.com','admin',22,'admin','286','male','123901823','asdfa admin 3'),('ergeegs','loler','loler@gmail.com','loler',26,'restaurant owner','300','company','777996765','qdqadqd 2313');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
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
