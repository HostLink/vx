-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: raymond
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `ACL`
--

DROP TABLE IF EXISTS `ACL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACL` (
  `acl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `usergroup_id` int(10) unsigned DEFAULT NULL,
  `value` enum('allow','deny') NOT NULL,
  `special_user` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `remark` text,
  `code` text,
  `path` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acl_id`),
  KEY `user_id` (`user_id`),
  KEY `usergroup_id` (`usergroup_id`),
  KEY `value` (`value`),
  KEY `special_user` (`special_user`),
  KEY `field` (`field`),
  CONSTRAINT `FK_ACL_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACL_2` FOREIGN KEY (`usergroup_id`) REFERENCES `UserGroup` (`usergroup_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL`
--

LOCK TABLES `ACL` WRITE;
/*!40000 ALTER TABLE `ACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthLock`
--

DROP TABLE IF EXISTS `AuthLock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthLock` (
  `authlock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`authlock_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthLock`
--

LOCK TABLES `AuthLock` WRITE;
/*!40000 ALTER TABLE `AuthLock` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthLock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config`
--

DROP TABLE IF EXISTS `Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `remark` text,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config`
--

LOCK TABLES `Config` WRITE;
/*!40000 ALTER TABLE `Config` DISABLE KEYS */;
INSERT INTO `Config` VALUES (1,'company','HostLink',0,1,NULL,NULL),(2,'company_logo','/images/logo/logo.png',0,1,NULL,NULL),(3,'company_url','https://www.hostlink.com.hk',0,1,NULL,NULL),(4,'copyright_name','HostLink',0,1,NULL,NULL),(5,'copyright_year','2021',0,1,NULL,NULL),(6,'copyright_url','https://www.hostlink.com.hk',0,1,NULL,NULL),(7,'login_version','v1',0,1,NULL,NULL),(8,'two_step_verification','0',0,1,NULL,NULL),(9,'biometric_authentication','0',0,1,NULL,NULL),(10,'vx_url',NULL,0,1,NULL,NULL);
/*!40000 ALTER TABLE `Config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventLog`
--

DROP TABLE IF EXISTS `EventLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventLog` (
  `eventlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL,
  `action` varchar(64) DEFAULT NULL,
  `source` json DEFAULT NULL,
  `target` json DEFAULT NULL,
  `remark` text,
  `user_id` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(10) unsigned DEFAULT '0',
  `different` json DEFAULT NULL,
  PRIMARY KEY (`eventlog_id`),
  KEY `class` (`class`),
  KEY `user_id` (`user_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventLog`
--

LOCK TABLES `EventLog` WRITE;
/*!40000 ALTER TABLE `EventLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MailLog`
--

DROP TABLE IF EXISTS `MailLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MailLog` (
  `maillog_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `body` text,
  `subject` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `altbody` text,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maillog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MailLog`
--

LOCK TABLES `MailLog` WRITE;
/*!40000 ALTER TABLE `MailLog` DISABLE KEYS */;
INSERT INTO `MailLog` VALUES (6,'2016-11-15 12:57:26','admin@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Your password has been reset.<br/>\r\n<br/>\r\nusername: admin<br/>\r\npassword: ehuqug','raymond.hostlink.com.hk reset password',NULL,NULL,'Your password has been reset.\r\n\r\nusername: admin\r\npassword: ehuqug','localhost'),(5,'2016-11-15 12:55:17','admin@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Your password has been reset.<br/>\r\n<br/>\r\nusername: admin<br/>\r\npassword: panuqa','raymond.hostlink.com.hk reset password',NULL,NULL,'Your password has been reset.\r\n\r\nusername: admin\r\npassword: panuqa','localhost'),(7,'2016-12-22 16:54:54','raymond1@hostlink.com.hk','raymond@hostlink.com.hk','<b>bca</b>','subject','raymond','raymond','bca','localhost'),(8,'2017-11-13 13:00:33','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject',NULL,NULL,'This is a test mail','localhost'),(9,'2020-08-26 16:31:41','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(10,'2020-08-26 16:31:41','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(11,'2020-08-26 16:31:58','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(12,'2020-08-26 16:31:58','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(13,'2020-08-26 16:32:50','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(14,'2020-08-26 16:32:50','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(15,'2020-08-26 16:34:19','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(16,'2020-08-26 16:34:19','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(17,'2020-08-26 16:35:11','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(18,'2020-08-26 16:35:11','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(19,'2020-08-26 16:35:26','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(20,'2020-08-26 16:35:26','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(21,'2020-08-26 16:37:38','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(22,'2020-08-26 16:37:38','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(23,'2020-08-26 16:37:57','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(24,'2020-08-26 16:37:57','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(25,'2020-08-26 16:38:31','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(26,'2020-08-26 16:38:31','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','localhost'),(27,'2020-08-26 16:38:42','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(28,'2020-08-26 16:38:42','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(29,'2020-08-26 16:39:44','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(30,'2020-08-26 16:39:44','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(31,'2020-08-26 16:41:26','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(32,'2020-08-26 16:41:26','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(33,'2020-08-26 16:42:45','postmaster@dnslink.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(34,'2020-08-26 16:42:45','postmaster@dnslink.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(35,'2020-08-26 16:44:44','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','mail.hostlink.com.hk'),(36,'2020-08-26 16:44:44','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','mail.hostlink.com.hk'),(37,'2020-08-26 16:45:11','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(38,'2020-08-26 16:45:11','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(39,'2020-08-26 16:47:20','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(40,'2020-08-26 16:47:20','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','smtp5.hostlink.com.hk'),(41,'2020-08-26 16:47:59','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(42,'2020-08-26 16:47:59','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(43,'2020-08-26 16:48:31','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(44,'2020-08-26 16:48:31','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(45,'2020-08-26 16:48:36','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(46,'2020-08-26 16:48:36','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(47,'2020-08-26 16:48:53','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(48,'2020-08-26 16:48:53','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(49,'2020-08-26 16:49:30','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(50,'2020-08-26 16:49:30','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(51,'2020-08-26 16:50:13','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(52,'2020-08-26 16:50:13','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(53,'2020-08-26 16:50:43','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(54,'2020-08-26 16:50:43','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(55,'2020-08-26 16:51:39','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(56,'2020-08-26 16:51:39','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(57,'2020-08-26 16:54:58','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(58,'2020-08-26 16:54:58','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(59,'2020-08-26 16:56:01','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(60,'2020-08-26 16:56:01','raymond@hostlink.com.hk','raymond@hostlink.com.hk','This is a test mail','subject','','','This is a test mail','117.18.106.114'),(61,'2020-08-26 16:58:59','root@localhost','raymond@hostlink.com.hk','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE</a>','Forget password','Root User','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE','117.18.106.114'),(62,'2020-08-26 16:58:59','root@localhost','raymond@hostlink.com.hk','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE</a>','Forget password','Root User','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzIzMzksImV4cCI6MTU5ODQzNTkzOSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.i2Khi6f1sxth-JD8WxBtPohiIlISrr93A-yCe25imwE','117.18.106.114'),(63,'2020-08-26 17:00:49','no-reply@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4</a>','Forget password','','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4','117.18.106.114'),(64,'2020-08-26 17:00:49','no-reply@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4</a>','Forget password','','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI0NDksImV4cCI6MTU5ODQzNjA0OSwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.uG2bgWt4ij0wFN4hjMge_glO84kO9IZcfPvXMJzXyD4','117.18.106.114'),(65,'2020-08-26 17:03:26','no-reply@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Dear admin:<br />\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.<br />\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo</a>','Forget password','','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo','117.18.106.114'),(66,'2020-08-26 17:03:26','no-reply@raymond.hostlink.com.hk','raymond@hostlink.com.hk','Dear admin:<br />\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.<br />\r\n\r\n<a href=\"http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo\">http://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo</a>','Forget password','','','Dear admin:\r\n\r\nYou can use the following link to login to system. After login, please reset your new password.\r\n\r\nhttp://127.0.0.1/alt3/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTg0MzI2MDYsImV4cCI6MTU5ODQzNjIwNiwiaWQiOjEsInR5cGUiOiJhY2Nlc3NfdG9rZW4ifQ.029pdmSifCTKCw4m-ByavLZMPH_KR4InOfXqhi492jo','117.18.106.114');
/*!40000 ALTER TABLE `MailLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyFavorite`
--

DROP TABLE IF EXISTS `MyFavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyFavorite` (
  `my_favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`my_favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyFavorite`
--

LOCK TABLES `MyFavorite` WRITE;
/*!40000 ALTER TABLE `MyFavorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `MyFavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemValue`
--

DROP TABLE IF EXISTS `SystemValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemValue` (
  `systemvalue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `value` text,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`systemvalue_id`),
  KEY `language` (`language`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemValue`
--

LOCK TABLES `SystemValue` WRITE;
/*!40000 ALTER TABLE `SystemValue` DISABLE KEYS */;
INSERT INTO `SystemValue` VALUES (3,'UserStatus','0|Active1\r\n1|Inactive',0,1,'en'),(4,'UserStatus','0|有效\r\n1|無效',0,1,'zh-hk'),(6,'test1','0|a\r\n1|b',0,1,'zh-hk'),(8,'education','[\"University\",\"Colleage\",\"Highschool\",\"Others\"]',0,1,'zh-hk');
/*!40000 ALTER TABLE `SystemValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Translate`
--

DROP TABLE IF EXISTS `Translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Translate` (
  `translate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`translate_id`),
  KEY `language` (`language`),
  KEY `name` (`name`),
  KEY `action` (`action`),
  KEY `module` (`module`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Translate`
--

LOCK TABLES `Translate` WRITE;
/*!40000 ALTER TABLE `Translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `addr3` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `default_page` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `join_date` date NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `openid` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(16) DEFAULT NULL,
  `style` json DEFAULT NULL,
  `setting` text,
  `bs_theme` varchar(255) DEFAULT NULL,
  `skin` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `credential` json DEFAULT NULL,
  `last_online` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `photo` blob,
  `credential_creation_options` json DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `inactive` (`inactive`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','$2y$10$Yrwsfl6948/1LMQZabVwXup2O3Wfh0l6qXvQZ2.fTLrQ1sSnM8BIW','admin','admin','raymond@hostlink.com.hk','93465221','cupertino','12','2','3',0,0,0,'zh-hk','User',NULL,'2015-11-04',0,0,NULL,'{\"body\": [\"text-sm\"], \"color\": \"bg-warning\", \"layout\": \"semi-dark-layout\", \"language\": \"zh-hk\", \"bootstrap\": {\"@body-bg\": \"#ffffff\", \"@navbar-height\": \"35px\", \"@font-size-base\": \"14px\", \"@nav-link-padding\": \"7px 10px\", \"@table-condensed-cell-padding\": \"4px\"}, \"form_size\": \"medium \", \"input_size\": \"medium \", \"table_size\": \"medium \", \"collapsible\": false, \"footer_type\": \"static\", \"navbar_type\": \"static\", \"rtable_size\": \"medium \", \"navbar_color\": \"bg-primary\", \"table_border\": false, \"rtable_table_size\": true, \"rtable_small_table\": false}','{\"2step ip white list\":null,\"2step_ip_white_list\":[\"115.160.172.18\\r\",\"115.160.172.18\"],\"2-step_ip_white_list\":[\"115.160.172.18\"],\"sidebar-collapse\":\"0\"}',NULL,'skin-blue',NULL,'null',NULL,NULL,NULL,'{\"rp\": {\"name\": \"localhost:8001\"}, \"user\": {\"id\": \"MQ==\", \"name\": \"admin\", \"displayName\": \"admin admin\"}, \"timeout\": 60000, \"challenge\": \"0zIgvqxHX7foIvDOIKRAW1k10kLeqpcDjWmvQOL_pbE\", \"attestation\": \"none\", \"pubKeyCredParams\": [{\"alg\": -257, \"type\": \"public-key\"}, {\"alg\": -259, \"type\": \"public-key\"}, {\"alg\": -37, \"type\": \"public-key\"}, {\"alg\": -39, \"type\": \"public-key\"}, {\"alg\": -7, \"type\": \"public-key\"}, {\"alg\": -36, \"type\": \"public-key\"}, {\"alg\": -8, \"type\": \"public-key\"}], \"authenticatorSelection\": {\"userVerification\": \"preferred\", \"requireResidentKey\": false}}'),(2,'guest','','guest','guest',NULL,'abc2',NULL,NULL,NULL,NULL,0,0,0,'zh-hk',NULL,NULL,'2012-01-01',0,0,NULL,'{\"color\": \"bg-primary\", \"navbar_color\": \"bg-secondary\"}',NULL,NULL,NULL,NULL,'null',NULL,NULL,NULL,'null'),(3,'system','','system','system',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'en',NULL,NULL,'2012-01-02',0,0,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'raymond','$2y$10$hvFKlFKBhjspGpA3fpEKMege1b8kaxI7gdIRQ350H0uteV2ShJhgK','Raymond','Chong','raymond@hostlink.com.hk','1213','blitzer','a','b','c',0,0,1,'zh-hk','',NULL,'2013-08-05',0,0,NULL,'null','{\"sidebar-collapse\":\"0\",\"layout\":\"sidebar\",\"fixed\":\"0\"}',NULL,'skin-green',NULL,'null','2021-06-10 15:10:00',NULL,NULL,'null'),(11,'power','','power','power','power1@hostlink.com.hk','123','clear','x','y','z',0,0,1,'zh-hk','',NULL,'2020-11-18',0,0,NULL,'null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup`
--

DROP TABLE IF EXISTS `UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup` (
  `usergroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `remark` text,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usergroup_id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `inactive` (`inactive`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup`
--

LOCK TABLES `UserGroup` WRITE;
/*!40000 ALTER TABLE `UserGroup` DISABLE KEYS */;
INSERT INTO `UserGroup` VALUES (1,'Administrators',1,0,NULL,NULL,NULL),(2,'Power Users',1,0,NULL,NULL,NULL),(3,'Users',1,0,NULL,NULL,NULL),(4,'Guests',1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `UserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserList`
--

DROP TABLE IF EXISTS `UserList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserList` (
  `userlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `usergroup_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userlist_id`),
  KEY `FK_UserList_1` (`user_id`),
  KEY `FK_UserList_2` (`usergroup_id`),
  CONSTRAINT `FK_UserList_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_UserList_2` FOREIGN KEY (`usergroup_id`) REFERENCES `UserGroup` (`usergroup_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserList`
--

LOCK TABLES `UserList` WRITE;
/*!40000 ALTER TABLE `UserList` DISABLE KEYS */;
INSERT INTO `UserList` VALUES (74,1,1),(75,2,4),(76,3,1),(78,6,3),(85,11,2);
/*!40000 ALTER TABLE `UserList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserLog`
--

DROP TABLE IF EXISTS `UserLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserLog` (
  `userlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `login_dt` datetime NOT NULL,
  `logout_dt` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `result` enum('SUCCESS','FAIL') NOT NULL,
  `user_agent` text,
  PRIMARY KEY (`userlog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_UserLog_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserLog`
--

LOCK TABLES `UserLog` WRITE;
/*!40000 ALTER TABLE `UserLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserLog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-30 15:39:08