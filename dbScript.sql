-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `s_question` varchar(500) NOT NULL,
  `s_answer` varchar(200) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('jatinder123','121','Jatinder Singh','jatinder.1064@gmail.com','Birth year?','1993'),('sarb456','654321','Sarbjot Singh','sarb@gmail.com','Birth year?','1993');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(500) NOT NULL,
  `posted_by` varchar(200) NOT NULL,
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `fk1` (`posted_by`),
  KEY `fk2` (`question_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`posted_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'nbxfgb','jeetu1','2016-11-10 08:40:40',4),(2,'fhwehglwehvlwhlhelhvbel','jeetu1','2016-11-15 05:39:08',4),(3,'ohforwehohf','jeetu1','2016-11-15 05:39:30',4),(34,'knkj','jeetu1','2016-11-29 11:01:32',17),(36,'helloooooooooo','sarb','2016-11-23 06:18:05',1),(37,'heyyyy','sarb','2016-11-23 06:18:22',1),(38,'answer1','honey','2016-11-25 07:12:46',1),(39,'abc','honey','2016-11-25 07:13:17',1),(42,'bvasdvosavoaboafiobh','honey','2016-11-29 11:01:32',17),(44,'ticicitcicigvyubiihjghcgtftd','sarb','2016-11-26 08:15:51',1),(45,'ticicitcicigvyubiihjghcgtftd','sarb','2016-11-26 08:16:10',1),(49,'hdhdjdjjdjd','sarb','2016-11-26 08:18:29',1),(50,'','sarb','2016-11-26 08:20:39',2),(57,'hdhs','sarb','2016-11-26 09:09:07',1),(58,'geelskd','sarb','2016-11-26 09:10:59',2),(59,'hello','sarb','2016-11-26 09:18:31',1),(60,'hello','sarb','2016-11-26 09:18:38',1),(61,'android','sarb','2016-11-26 09:19:03',1),(62,'hello','sarb','2016-11-26 09:23:23',6),(67,'Android','sarb','2016-11-26 09:25:51',6),(70,'hii','sarb','2016-11-26 09:33:17',6),(77,'jai ho\njà8iiiiiiii\nhoooooo','sarb','2016-11-26 09:42:04',6),(78,'rest','sarb','2016-11-26 09:54:48',19),(79,'heloooo oyehfje','jeetu1','2016-11-26 10:01:29',19),(80,'help me','jeetu1','2016-11-26 10:04:24',2),(84,'heelo','jeetu1','2016-11-26 10:36:56',1),(85,'relooo','jeetu1','2016-11-26 11:04:15',20),(86,'yes something good','jeetu1','2016-11-26 11:04:40',20),(87,'goood','jeetu1','2016-11-26 11:04:48',20),(88,'vkjvvg','jeetu1','2016-11-28 13:43:53',20),(89,'<html>answeerr1</html>','jeetu1','2016-11-29 11:12:47',18),(90,'','jeetu1','2016-11-29 13:27:39',6),(91,'<html>abc</html>','sarb','2016-11-30 09:34:21',4),(109,'<html>OHFOHFO</html>','sarb','2016-11-30 10:16:54',4),(110,'<html>gkgkgk</html>','sarb','2016-11-30 10:35:19',4),(111,'<html>abc</html>','sarb','2016-11-30 10:44:49',2),(112,'<html>abc</html>','sarb','2016-11-30 10:48:11',2),(113,'<html>hello</html>','honey','2016-12-01 06:52:35',4);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `photo` varchar(200) NOT NULL,
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('android','all detail','./images\\download.png'),('C','clanguage','images\\download.jpg'),('DS','ds','images\\download(2).jpg'),('java','core','images\\java.png'),('SQL','query','images\\download(1).jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislike_table`
--

DROP TABLE IF EXISTS `dislike_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dislike_table` (
  `dislike_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) NOT NULL,
  `disliked_by` varchar(100) NOT NULL,
  PRIMARY KEY (`dislike_id`),
  KEY `fk5` (`answer_id`),
  KEY `fk6` (`disliked_by`),
  CONSTRAINT `fk5` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk6` FOREIGN KEY (`disliked_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislike_table`
--

LOCK TABLES `dislike_table` WRITE;
/*!40000 ALTER TABLE `dislike_table` DISABLE KEYS */;
INSERT INTO `dislike_table` VALUES (4,34,'jeetu1');
/*!40000 ALTER TABLE `dislike_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followedusers`
--

DROP TABLE IF EXISTS `followedusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followedusers` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `status` varchar(400) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `fk10` (`qid`),
  KEY `fk11` (`user`),
  CONSTRAINT `fk10` FOREIGN KEY (`qid`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk11` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followedusers`
--

LOCK TABLES `followedusers` WRITE;
/*!40000 ALTER TABLE `followedusers` DISABLE KEYS */;
INSERT INTO `followedusers` VALUES (1,1,'sarb','seen'),(3,20,'jeetu1','seen'),(4,6,'sarb','unseen'),(5,6,'honey','unseen'),(6,4,'sarb','seen'),(7,2,'sarb','seen');
/*!40000 ALTER TABLE `followedusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followquestiontable`
--

DROP TABLE IF EXISTS `followquestiontable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followquestiontable` (
  `followquestionid` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL,
  `followedby` varchar(200) NOT NULL,
  PRIMARY KEY (`followquestionid`),
  KEY `fk8` (`questionid`),
  KEY `fk9` (`followedby`),
  CONSTRAINT `fk8` FOREIGN KEY (`questionid`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk9` FOREIGN KEY (`followedby`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followquestiontable`
--

LOCK TABLES `followquestiontable` WRITE;
/*!40000 ALTER TABLE `followquestiontable` DISABLE KEYS */;
INSERT INTO `followquestiontable` VALUES (2,6,'sarb'),(5,6,'honey'),(6,1,'sarb'),(7,4,'sarb'),(9,19,'sarb'),(10,2,'sarb'),(11,20,'jeetu1');
/*!40000 ALTER TABLE `followquestiontable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_table`
--

DROP TABLE IF EXISTS `like_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_table` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) NOT NULL,
  `liked_by` varchar(100) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `fk3` (`answer_id`),
  KEY `fk4` (`liked_by`),
  CONSTRAINT `fk3` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`liked_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_table`
--

LOCK TABLES `like_table` WRITE;
/*!40000 ALTER TABLE `like_table` DISABLE KEYS */;
INSERT INTO `like_table` VALUES (11,34,'jeetu1'),(12,3,'jeetu1'),(21,1,'jeetu1'),(22,2,'jeetu1'),(24,1,'honey'),(26,36,'sarb'),(27,36,'honey'),(28,37,'honey'),(29,36,'jeetu1'),(30,37,'jeetu1'),(31,38,'jeetu1'),(33,38,'honey'),(35,37,'sarb'),(36,38,'sarb'),(38,58,'sarb'),(39,50,'sarb'),(40,62,'sarb'),(42,78,'sarb'),(43,79,'jeetu1'),(44,78,'jeetu1'),(46,2,'sarb'),(47,3,'sarb'),(52,112,'sarb'),(53,113,'honey');
/*!40000 ALTER TABLE `like_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `posted_by` varchar(45) NOT NULL,
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_name` varchar(200) NOT NULL,
  `views` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_name` (`category_name`),
  KEY `posted_by` (`posted_by`),
  CONSTRAINT `category_name` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posted_by` FOREIGN KEY (`posted_by`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'hzf','interface new','java link list in stack overfloww help me waht to do with its is doing by the java link list in stack overfloww help me waht to do with it and whohat this is doing by the java link list in stack overfloww help me waht to do with it and who to slove it hekp me eoples','example1,sql,java','jeetu1','2016-11-10 07:03:55','android',1),(2,'Data Structure','reverse this link list','what this is doing by the java link list in stack overflowwlp me waht to do with it  stack overfloww help me waht to do with it and who to slove it hekp me eoples what this is doing by the java link list in stack overfloww help me waht to do with it and who to slove it hekp me eoples eoples','java,sql,data structure','jeetu1','2016-11-10 07:03:19','DS',15),(4,'sql','select * from table','execute aql query','query,sql','jeetu1','2016-11-29 11:09:50','C',48),(6,'java keywords','public, void, private, class, static, enum, struct, abstract, object, interface, extends, implements, package','various keywords in java that can\'t be changed','java, keywords','sarb','2016-11-23 06:16:37','java',2),(17,'use of pointer','how memory is allocated by using pointers .\n','how to use pointers in c language','pointer,c','sarb','2016-11-26 09:15:27','C',2),(18,'use of pointer','how memory is allocated by using pointers .\n','how to use pointers in c language','pointer,c','sarb','2016-11-26 09:15:34','C',2),(19,'data','data types in\nJava \nlanguage','data types','Java,keywords,data,types','sarb','2016-11-26 09:54:27','java',10),(20,'interfaces','what are the interfaces in java and how they are used in real word?','Interfaces in java ','interfaces,java','honey','2016-11-26 10:06:56','java',97);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_data`
--

DROP TABLE IF EXISTS `uploaded_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_data` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `uploadcontent` varchar(10000) DEFAULT NULL,
  `uploadedby` varchar(200) NOT NULL,
  `uploadedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_id`),
  KEY `fk7` (`uploadedby`),
  CONSTRAINT `fk7` FOREIGN KEY (`uploadedby`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_data`
--

LOCK TABLES `uploaded_data` WRITE;
/*!40000 ALTER TABLE `uploaded_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaded_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` mediumtext,
  `sec_question` varchar(200) NOT NULL,
  `sec_answer` varchar(200) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('hehhe','123','bejdjr','3793252','Birth Year ?','1009',NULL),('honey','123456','honey@gmail.com','987654321','Birth Year ?','asr','images\\Code3.jpg'),('jat123','256','m@e.v','562','Birth Year ?','','images\\null'),('jatinder','12345','jeetujs5281@gmail.com','12344555','Birth Year ?','tarantaran','images\\Code1.jpg'),('jeetu','123456','','','Birth Year ?','','images\\null'),('jeetu1','111','jatinder@gmail.com','98552424212','Favourite fruit?','apple','images\\Code3.jpg'),('jsjs','qqq','xjx','433','Favourite Color?','dbdn',NULL),('karan','1234','karan@gmail.com','9876543211','Birth Place ?','delhi','./images\\10336627_794384270574501_6642316503752347208_n.jpg'),('sarb','123','sarb@gmail.com','9855242400','Favourite Color?','red','images\\java.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-26 20:42:21
