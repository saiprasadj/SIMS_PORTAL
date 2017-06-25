CREATE DATABASE  IF NOT EXISTS `schema_sims` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `schema_sims`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: schema_sims
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_credential`
--

DROP TABLE IF EXISTS `user_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_credential` (
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL DEFAULT 'welcome',
  `ENABLE` int(11) NOT NULL DEFAULT '0',
  `Role_Name` varchar(45) DEFAULT NULL,
  `ChangePassword` int(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `rolename_fk_idx` (`Role_Name`),
  KEY `fk_UserId_idx` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_credential`
--

LOCK TABLES `user_credential` WRITE;
/*!40000 ALTER TABLE `user_credential` DISABLE KEYS */;
INSERT INTO `user_credential` VALUES (100,'$2a$10$79ZDoUP0VVAymHMF/dzQOuK2v4f8qOtQ5vOoGqk2mt9rZeHPOJ4xO',1,'ROLE_USER',1),(450,'$2a$10$9VyxvjVjrBrMv8HaFe4Wte4w/3kboa/f5vLLAnz28/sYfDJ7eYXQK',1,'ROLE_USER',1),(1234,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_ADMIN',0),(4000,'$2a$10$QM/QWQ.tYQBZ4BzD6/GHNOoWmkTyNog/AVFYGQP2rx9idNtcVqKxu',1,'ROLE_USER',0),(4001,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4002,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4003,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4004,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4005,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4006,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4007,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4008,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4009,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4010,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4011,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4012,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4013,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4014,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4015,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4016,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4017,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4018,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4019,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4020,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4021,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4022,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4023,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4024,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4025,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4026,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4027,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4028,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4029,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4030,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4031,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4032,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4033,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4034,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4035,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4036,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4037,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4038,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4039,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4040,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4041,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4042,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4043,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4044,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4045,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4046,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4047,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4048,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4049,'$2a$10$bk5Jv.RLdK/8DsiB6a6JsewC6AG3DdxKb/BjF49Ev4NGR4PWwy7uu',1,'ROLE_USER',0),(4050,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4051,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4052,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4053,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4054,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4055,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4056,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4057,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4058,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4059,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4060,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4061,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4062,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4063,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4064,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4065,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4066,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4067,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4068,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4069,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4070,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4071,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4072,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4073,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4074,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4075,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4076,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4077,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4078,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4079,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4080,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4081,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4082,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4083,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4084,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4085,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4086,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4087,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4088,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4089,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4090,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4091,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4092,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4093,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4094,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4095,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4096,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4097,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4098,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4099,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4100,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4101,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4102,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4103,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4104,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4105,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4106,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4107,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4108,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4109,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4110,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4111,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4112,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4113,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4114,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4115,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4116,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4117,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4118,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4119,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4120,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4121,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4122,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4123,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4124,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4125,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4126,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4127,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4128,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4129,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4130,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4131,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4132,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4133,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4134,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4135,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4136,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4137,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4138,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4139,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4140,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4141,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4142,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4143,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4144,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4145,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4146,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4147,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4148,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4149,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4150,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4151,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4152,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(4500,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_MIS',0),(4509,'$2a$10$ljGi/A5lTLVEl8hLVEMo9ODmpsdYDW3z/4Jfh68pcBG4cyU57gn7u',1,'ROLE_USER',1),(4576,'$2a$10$OW6HTjl.ARh09pevUriFA.fFRFWC2Qkpp8AGOE2lVfrAg88Srk9Ra',1,'ROLE_USER',1),(5000,'$2a$10$ZqgDFCzsdmTR0MM/PdlbCeLT9C3Y2V6FRr94Sf38whES/Eo8ZZsj6',1,'ROLE_USER',0),(5001,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(5002,'$2a$10$lz4WMmEB63ZnS2aQQIjeuuOtJJahLXmcwqL/1ROKnLOHFPVo2Dhcy',1,'ROLE_USER',0),(5003,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(5004,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(5005,'$2a$10$lz4WMmEB63ZnS2aQQIjeuuOtJJahLXmcwqL/1ROKnLOHFPVo2Dhcy',1,'ROLE_USER',0),(5009,'$2a$12$27gT2nu8yv5p2abdiJ/W4OsjBYOn9bBjAsJ26IjLuXXusS0YFnfJC',1,'ROLE_USER',0),(5010,'$2a$10$ounbOYc0C8k4rreIM8uL1Od4/4IrYbQ.lKd/AGDzQ2nUAfMgFf6ZK',1,'ROLE_USER',0),(5011,'$2a$10$E5q2wobOM7wJ3VGEHT5Li.cR0866BcdRxkPTSQla7GByil5V8HRWC',1,'ROLE_USER',1),(5078,'$2a$10$gn0ZzhRyx0.ErIzT25SWzuTg.z.z.0OgPa.fdE6MZOgxq9XFOZKUy',1,'ROLE_USER',0),(7963,'$2a$10$avhktvHK/6zfvIptlomXWeLgcqlyuSES5v1/ISd8e30T9Vv6EFR9a',1,'ROLE_USER',0),(8963,'$2a$10$WPlcJp3X1s7j.dIModQeteVvb6Rf.x9iC..2uxkkjzvCU3aqx2s.6',1,'ROLE_USER',1),(8964,'$2a$10$DsFmZfHmqxSnRrWCSNzDYOgBNR/CKNR70fgsZ/IC2r.I3CqsmMu66',1,'ROLE_USER',0),(9638,'$2a$10$KqAGUhd1HY.FftjnGm3B/uDaOslDdFfh5mH.Fhkjgs7/BOl0AVVzK',1,'ROLE_USER',0),(50012,'$2a$10$UJaQfuSfmggLPPFqq/YWMub/8YkI/0Tbmq9qmBbB41fImsplLEJLG',1,'ROLE_USER',1),(784560,'$2a$10$pS6FMrIdDKI0.Iyt8R2XqOSvf4TibviDn65H5S3MqrA4pesmOspCO',1,'ROLE_USER',1),(789456,'$2a$10$e2mLXNjP/m9DHm9HriiC2eDQ0mme2Aghx1WU.Jnr.GC3bNCrulb4S',1,'ROLE_USER',0),(7894561,'$2a$10$WF1iJzvLqr65kUqHHieoRumDfi1LQuEKEudVHmigqSYJH/0XB2eUO',1,'ROLE_USER',1);
/*!40000 ALTER TABLE `user_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `userId` int(11) NOT NULL,
  `salesExeCode` varchar(5) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` bigint(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `roleName` varchar(25) NOT NULL,
  `managerID` int(11) NOT NULL,
  `alternativeEmp` int(11) DEFAULT NULL,
  `activeFlag` int(11) DEFAULT NULL,
  `nextApprover` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `user_id_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1234,'','ADMIN','ABC',7894561232,'mittapallynaresh96@gmail.com','Admin',0,0,1,0),(4001,'A01','Sales Rep 01-Ahm','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4002,'A02','Sales Rep 02-Ahm','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,0,0),(4003,'B00','Sales Rep 00-Ban','ABC',214748367,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4004,'B01','Sales Rep 01-Ban','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,4005,0,0),(4005,'B02','Sales Rep 02-Ban','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4006,'B03','Sales Rep 03-Ban','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4007,'B04','Sales Rep 04-Ban','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,0,0),(4008,'B05','Sales Rep 05-Ban','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4009,'C00','Sales Rep 00-Coc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4010,'C01','Sales Rep 01-Coc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4011,'C02','Sales Rep 02-Coc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4012,'D00','Sales Rep 00-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4013,'D01','Sales Rep 01-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4014,'D02','Sales Rep 02-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4015,'D03','Sales Rep 03-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4016,'D04','Sales Rep 04-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4017,'D05','Sales Rep 05-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4018,'D06','Sales Rep 06-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4019,'D07','Sales Rep 07-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4020,'D08','Sales Rep 08-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4021,'D09','Sales Rep 09-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4022,'D10','Sales Rep 10-Del','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4023,'G00','Sales Rep 00-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4024,'G01','Sales Rep 01-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4025,'G02','Sales Rep 02-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4026,'G03','Sales Rep 03-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4027,'G04','Sales Rep 04-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4028,'G05','Sales Rep 05-Guw','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4029,'H00','Sales Rep 00-Hyd','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4030,'H01','Sales Rep 01-Hyd','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4031,'H02','Sales Rep 02-Hyd','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4032,'H03','Sales Rep 03-Hyd','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4033,'H04','Sales Rep 04-Hyd','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4034,'J00','Sales Rep 00-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4035,'J01','Sales Rep 01-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4036,'J02','Sales Rep 02-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4037,'J03','Sales Rep 03-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4038,'J04','Sales Rep 04-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4039,'J05','Sales Rep 05-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4040,'J06','Sales Rep 06-Jam','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4041,'K00','Sales Rep 00-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4042,'K01','Sales Rep 01-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4043,'K02','Sales Rep 02-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4044,'K03','Sales Rep 03-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4045,'K04','Sales Rep 04-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4046,'K05','Sales Rep 05-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4047,'K06','Sales Rep 06-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4048,'K07','Sales Rep 07-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4049,'K08','Sales Rep 08-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4050,'K09','Sales Rep 09-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4051,'K10','Sales Rep 10-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4052,'K11','Sales Rep 11-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4053,'K12','Sales Rep 12-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4054,'K13','Sales Rep 13-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4055,'K14','Sales Rep 14-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4056,'K15','Sales Rep 15-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4057,'K16','Sales Rep 16-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4058,'K17','Sales Rep 17-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4059,'K18','Sales Rep 18-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4060,'K19','Sales Rep 19-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4061,'K20','Sales Rep 20-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4062,'K21','Sales Rep 21-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4063,'K22','Sales Rep 22-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4064,'K23','Sales Rep 23-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4065,'K24','Sales Rep 24-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4066,'K25','Sales Rep 25-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4067,'K26','Sales Rep 26-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4068,'K27','Sales Rep 27-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4069,'K28','Sales Rep 28-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4070,'K29','Sales Rep 29-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4071,'K30','Sales Rep 30-Kol','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4072,'L00','Sales Rep 00-Luc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4073,'L01','Sales Rep 01-Luc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4074,'L02','Sales Rep 02-Luc','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4075,'M00','Sales Rep 00-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4076,'M01','Sales Rep 01-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4077,'M02','Sales Rep 02-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4078,'M03','Sales Rep 03-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4079,'M04','Sales Rep 04-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4080,'M05','Sales Rep 05-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4081,'M06','Sales Rep 06-Mum','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4082,'N00','Sales Rep 00-Nag','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4083,'N01','Sales Rep 01-Nag','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4084,'N02','Sales Rep 02-Nag','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4085,'O00','Sales Rep 00-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4086,'O01','Sales Rep 01-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4087,'O02','Sales Rep 02-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4088,'O03','Sales Rep 03-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4089,'O04','Sales Rep 04-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4090,'O05','Sales Rep 05-Bhu','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4091,'R00','Sales Rep 00-Ran','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4092,'R01','Sales Rep 01-Ran','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4093,'R02','Sales Rep 02-Ran','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4094,'R03','Sales Rep 03-Ran','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4095,'S00','Sales Rep 00-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4096,'S01','Sales Rep 01-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4097,'S02','Sales Rep 02-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4098,'S03','Sales Rep 03-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4099,'S04','Sales Rep 04-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4100,'S05','Sales Rep 05-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4101,'S06','Sales Rep 06-Sil','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4102,'T00','Sales Rep 00-Che','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4103,'T01','Sales Rep 01-Che','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4104,'T02','Sales Rep 02-Che','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4105,'T03','Sales Rep 03-Che','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4106,'X01','Sales Exe-Kol 1(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4107,'X02','Sales Exe-Kol 2(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4108,'X03','Sales Exe-Kol 3(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4109,'X04','Sales Exe-Kol 4(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4110,'X05','Sales Exe-Kol 5(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4111,'X06','Sales Exe-Kol 6(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4112,'X07','Sales Exe-Kol 7(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4113,'X08','Sales Exe-Kol 8(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4114,'X09','Sales Exe-Kol 9(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4115,'X10','Sales Exe-Kol10(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4116,'X11','Sales Exe-Kol11(D&E)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4117,'X12','Sales Exe-KolSchool1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4118,'X13','Sales Exe-KolSchool2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4119,'X14','Sales Exe-SBSR 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4120,'X15','Sales Exe-SBSR 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4121,'X16','Sales Exe-SBSR 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4122,'X17','Sales Exe-SWBSR 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4123,'X18','Sales Exe-SWBSR 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4124,'X19','Sales Exe-NBSR 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4125,'X20','Sales Exe-NBSR 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4126,'X21','Sales Exe-CBSR 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4127,'X22','Sales Exe-CBSR 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4128,'X23','Sales Exe-Orissa 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4129,'X24','Sales Exe-Orissa 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4130,'X25','Sales Exe-Orissa 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4131,'X26','Sales Exe-Orissa 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,0,0),(4132,'X27','Sales Exe-Bihar 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4133,'X28','Sales Exe-Bihar 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4134,'X29','Sales Exe-NE 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4135,'X30','Sales Exe-NE 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4136,'X31','Sales Exe-NE 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4137,'X32','Sales Exe-NE 4','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4138,'X33','Sales Exe-Jharkhand1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4139,'X34','Sales Exe-Jharkhand2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4140,'X35','Sales Exe-Jharkhand3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4141,'X36','Sales Exe-West 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4142,'X37','Sales Exe-North 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4143,'X38','Sales Exe-South 1','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4144,'X39','Sales Exe-South 2','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4145,'X40','Sales Exe-South 3','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4146,'X41','Sales Exe-South 4','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4147,'X42','Sales Exe-South 5','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4148,'X43','Sales Exe-South 6','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4149,'X44','Sales Exe-South 7','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4150,'X59','Sales Exe-Kolkata 12','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4151,'X98','Sales Exe-Kol(Unmap)','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4152,'X99','Sales Exe-Kolkata 14','ABC',2147483647,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4500,'','test','test',7896532,'mism22439@gmail.com','MIS',0,0,1,0),(4509,'se165','se','test',7894561230,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(4576,'se165','se','test',7894561230,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(5000,'K04','salesExecutive','RAM',54678912,'salesdx123@gmail.com','Sales Executive',5001,0,1,1),(5001,NULL,'AreaHead','AreaHead',874512887,'areahead9@gmail.com','Area Head',5002,0,1,0),(5002,NULL,'ROBHead','ROBHead',78945876,'rrob289@gmail.com','ROB Head',5003,0,1,1),(5003,NULL,'Bengal Head','Bengal Head',874509872,'bengalhead100@gmail.com','Bengal Head',5005,0,1,0),(5005,NULL,'BusinessHead','BusinessHead',123456,'bussinesshead8@gmail.com','Business Head',0,0,1,1),(7963,'re6','welcome','Nareh',7894561230,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(8963,'se56','test','test',7894561230,'salesdx123@gmail.com','Sales Executive',5001,0,1,0),(8964,'se58','test','test',7894561230,'salesdx123@gmail.com','Sales Executive',5001,0,1,0);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (6,'Admin'),(5,'Area Head'),(4,'Bengal Head'),(3,'Business Head'),(7,'MIS'),(2,'ROB Head'),(1,'Sales Executive');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-06  2:36:39
