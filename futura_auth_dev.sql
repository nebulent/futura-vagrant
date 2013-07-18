-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: futura_auth_dev
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2

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
-- Table structure for table `application_types`
--

DROP TABLE IF EXISTS `application_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_types`
--

LOCK TABLES `application_types` WRITE;
/*!40000 ALTER TABLE `application_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_flags`
--

DROP TABLE IF EXISTS `feature_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `index_feature_flags_on_application_type_id` (`application_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_flags`
--

LOCK TABLES `feature_flags` WRITE;
/*!40000 ALTER TABLE `feature_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `buttons_color` varchar(255) DEFAULT NULL,
  `clinician_logo_file_name` varchar(255) DEFAULT NULL,
  `clinician_logo_content_type` varchar(255) DEFAULT NULL,
  `clinician_logo_file_size` int(11) DEFAULT NULL,
  `clinician_logo_updated_at` datetime DEFAULT NULL,
  `super` tinyint(1) DEFAULT NULL,
  `application_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'test','$2a$10$Cd731a/dMYZfcjfZi2Dr9uymo6ih0ElxAHuUQPiYx1qKF/m5p62QO','http://localhost:9292','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'super','$2a$10$gmpcR550nahpNRe3KMJXdOYZbkZIRqV/Xk6dHsyvxzHxVD9oKqgQS','super','super',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130312111438'),('20130312111542'),('20130312112133'),('20130313113014'),('20130313114018'),('20130313115246'),('20130318094333'),('20130318095048'),('20130417130939'),('20130417131217'),('20130418064335'),('20130418074806'),('20130418081234'),('20130421155631'),('20130421155849'),('20130421204322'),('20130422074451'),('20130422141943'),('20130423071608'),('20130423073332'),('20130517100211'),('20130628081938'),('20130701094552'),('20130701094856'),('20130701104423'),('20130702085326'),('20130702110313');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'doctor1','$2a$10$3OKzSXB/xS.PHlJDYPioruXCfuB.qk9W17vOzMhN5D5yIrPiv8CR2',1,1),(2,'victorg','$2a$10$ucMjd72kNgMlW18Dr.i8uuZDRhShewjlDxkhwjCN4VnvYO3B1ntP2',1,0),(3,'kazukos','$2a$10$.fgl0Nxop28Q4Y/e25TLrOJQVaNao1HTwxfc/O2jYOBIBcuaIkW1q',1,0),(4,'gastong','$2a$10$/8rXoyFsz5fpzjb4OqbCQOM1HvLJHHv1T4Qflz.U20rpgDx7bpMXS',1,0),(5,'wilfredg','$2a$10$37UvFG9yZQcfCyavs6gNh.wIBDbkqqgzqdZjk7KAfNb6uQAclS8DW',1,0),(6,'walteri','$2a$10$nQgMcdvy53LeWkHyar46k.p5x7KYf6WmH4.dxFm0HtD1adkqlGTEm',1,0),(7,'katel','$2a$10$meWUl9ydaixOo0HwJch/o.FcAADAIyVrKVR/tdi8q2vC9tW4WjJPq',1,0),(8,'michellee','$2a$10$JGFRS3sIIL.Cw869DJI/KeJqwIVF8lI1SRQIthRAs5qAPdg40xrVu',1,0),(9,'rafaelf','$2a$10$KxFHDccuJN1SviaQ4yVSYeFXHl0.3GzNQ.ChgBfCiUvepaZyEZ91i',1,0),(10,'markh','$2a$10$dT3R553uIDT61CKXHK0szORkJlEgE/IQSLIMFSliO3WOYEkK07c5y',1,0),(11,'sandyh','$2a$10$ahfRSEfaJq1Ew8g5Po2zi.3GIDqwg/MOd4tCgB1uUeSSCX3tuM0eG',1,0),(12,'anah','$2a$10$aNuFvKHOPGyGbHghZlLnbe2AdG7xfA/CL2Z3p7mj4pxsoZGOoS/Ke',1,0),(13,'username 2013-07-10 14:33:13 +0300','$2a$10$v6LXICFgR3/HGBIXChU4e.kWyIh//5JyEkz6PMYfilju4l1r1ZW6q',1,0),(14,'odettet','$2a$10$uzu3LjcP84ICcyAyfCQQgenCbebCEfvN9e3IRAkjqINw46W1UEF1u',1,0),(15,'sebastiens','$2a$10$MqViJCKiJUIY0zjWX/kaw.EaPi4w7xxtmvXRhJFjLKuWaUH3jIXKy',1,0),(16,'odettek','$2a$10$ayYotBrXildrs6DguMgUHOeU86KR7DJ498n2HwV4U6qi9yDi0jgT.',1,0),(17,'anap','$2a$10$fQHYJbnEBImC7PVNwXfvSuyW/pZXFpi4oSEfjNjRmFnY4/WlrePN6',1,0),(18,'gastoni','$2a$10$vtCHB5GY/Cefd.mGCd9ExumqdImYUlYfkLlcK1tiB0qoL.OkK09Yu',1,0),(19,'smithf','$2a$10$SRyxYl55XYgz0BoBCLZlt.4G7FAJh2CaKSGlMTKWBu5zo4da5X82K',1,0),(20,'billl','$2a$10$fybzomgt9.LMaMz7x2B.vuGBLYUUgECSSGan7Zvh3UmAYO5LxqE6C',1,0),(21,'username 2013-06-27 14:22:45 +0300','$2a$10$xJvU181DYSTnXkWHFtp0PeRLkEGl55ilbhkbYVPdbXjDfdrA1m43S',1,0),(22,'marial','$2a$10$8adZLEMh2gl7pguUh.b1UuOQPML3mNnWW0lDRuUZAu9sSwBN6fXKC',1,0),(23,'noelt','$2a$10$7d.wD5xI/yfukNHLsAZtwOZ4oc5wD29iOI6GuXevmiVznLGG7AADm',1,0),(24,'peteri','$2a$10$4znL8yaeuuo8iEOy..wtQO.4HbdCjJ5vYDHNWjMYLFNy7xX3CDd.q',1,0),(25,'vincey','$2a$10$50H5nFrokK5OKUvlkj.JbuMrw2fWRUswOTfMdlbtsZqjNmhcoXE9W',1,0),(26,'paulap','$2a$10$LwfTk1h6wrkREAJCnLfM5eRdNZIQJrzoohBuAwg2RBQsFFxOzpGpe',1,0),(27,'alexn','$2a$10$okUweXt9AEj91hRLhmXLAeadfqDPxghAfjmdg/2WsupKXel.obh4y',1,0),(28,'kirkn','$2a$10$e7pbHCiAlSgVlIXLmebv6eCoo6Uq1rVFRMI6Ew.tvP3lzhyvtp.YS',1,0),(29,'jerryl','$2a$10$ne/bnw8/qR080Nnn9RRr5uFLGv1f/X0vzIadXm6de8iFs17sX/Dye',1,0),(30,'daniellee','$2a$10$XhoFghN.w5yvV7SZrCpV4utKCjK.CARwsH0xC1RF5o5dDvdxX0XUy',1,0),(31,'pnoel','$2a$10$ZYfgx9tGIQCh5V0Q5UwquOelmJf0NGlCJYdW/2rEHp5wFvoj2lF3y',1,0),(32,'vickye','$2a$10$K1di5CXCM2HPY5K3I6brc.19NT9q/JryylVxzX.oK.mGSq/h3.oyu',1,0),(33,'herminel','$2a$10$4kreAcsIxPXZeA0xmTnyDex1hKta0emprH3epfY6ZiQX0hGbnufJC',1,0),(34,'daniellei','$2a$10$0cdpNfk4p8bB2uLD9.gLeO928EQu3Qd6j0xRCnNOG5Tm9SsCA.Kge',1,0),(35,'miharuc','$2a$10$QxbIwIXWc6lnCxdz0Yw/6ugsJ5lIo85egZOfx9RrEqocXzPdBpDIq',1,0),(36,'karle','$2a$10$Rj3lHd2SckdZZCfKB30fseuIYXnZCIekEkRwyLNV/xutsIiA52yke',1,0),(37,'nicholaso','$2a$10$oXOCPx7ViZuPyMkwZdK93OTv4pDVVWm88ww7f64lULdardxVqJ5YG',1,0),(38,'claudetted','$2a$10$kxLc.MwhjqMD6dwoCjq6IOgb8pPZoI31kMTXHeeOLZRF1AQrfPzf2',1,0),(39,'philippei','$2a$10$JuBtTZy50lESaON1H2emOuIrLix0UxtF.RZLYMbTyW3VRDV/vdogm',1,0),(40,'harveyt','$2a$10$O5D5MLvSI8EiyjNBJb9Q9.2e6Q4KXIzzzyArepP8./W9ZdHzmUN0.',1,0),(41,'kirkc','$2a$10$gg0F5tuVQWR3cjZkt6mDCe3T9gMLU.FGCSchCk8NGOnx/qqUgUafu',1,0),(42,'akib','$2a$10$jFZFT0P7rXK3W1A9Ftb/wuJVVB4lVOyhYpf34Vejc2dAgucBnnH9y',1,0),(43,'akig','$2a$10$xDP98MmpQPakYLT3heFaue9ilvmqma5fg64AXg72UXewxaoVKFLqu',1,0),(44,'sharyw','$2a$10$O.RAqcnWbtuszEaQSe.ENeXAbl2qkOHDxyS4HuPCBFFzD0LFVvwFC',1,0),(45,'naokoi','$2a$10$oNon1CsazcL6JnAo/sWhL.vlPiyX6skMCeS0vgihK.fr4EnvkowzG',1,0),(46,'tammyh','$2a$10$WxBotLGsOnM2sIIUQx9T1eGK9HMeq1cpwZo9C9JT5ZDLoVesKK2aC',1,0),(47,'yumih','$2a$10$f8kb7DXJGHLX559Ze6Ued.1sXLU7O7vEYHZbfwAVU.t1hOkXHY.XG',1,0),(48,'michiyol','$2a$10$cpofzhMjSbiLMYeTb.ED8eBPQY/V01/5MvfhATvfFJfGWDB3lWM0.',1,0),(49,'dannyy','$2a$10$CMghwBHVJzFyNNROzDVRd.SXGqe4cBnNaSzjD1sR7Jb7JtCy6a0nK',1,0),(50,'chrisv','$2a$10$yH9I3h.M/WgP7eXPe.MH9.SRsAD66vYPUcHeBvnhL24K.U120grTa',1,0),(51,'charleyf','$2a$10$OwVssXL.QaSOZ7MuiVXEdOetlyfk2Uo1D02BrUuRtT/7nYhnLbcC2',1,0),(52,'nfletch','$2a$10$JMFd/HFPJ8LZXug90KHE1eiE5LQWgkVNVeFkocbvMXV8F8WkoK2Ya',1,0),(53,'kendallb','$2a$10$azJqgNaFmtRnju/yEL6meOWGxmiTWNMBJEpm3GXZGCh45v.wgEhQe',1,1),(54,'noMeds','$2a$10$V.euxpti8WtyDf9c4dogjejxw.bxeGdqQWPmoZ/eIazJfHCv7mj12',1,0),(55,'minIUser','$2a$10$ZFdk62bYD/zvPLNo.iaCNOdt3g1HvMnFKnOtPlcBO5VxGBfmqE1xi',1,0),(56,'minNUser','$2a$10$ZLD6fcwwaaryKonbi5WEZe0CyZH78tk28Da1zoP18ZbfYWAQm0FQi',1,0),(57,'vasea','$2a$10$T2V1VvLzme47cmbr/J9KvugLzGLiib8N1Yckftld04y5/tmjSZx0S',1,NULL),(58,'GXEDW','$2a$10$eltalAyB8KesROobr3EDHuIWdx6kI43PQN00HKGn4fIuSs71/9KmK',1,0),(59,'testuser','$2a$10$3UGguIkvgqP2VY6yLoS4FuZo2V7aQv0i99v5dfr4ehRnNALeH93K6',1,0),(60,'testuser2','$2a$10$.EHIjFIHg07c4A/fYQQmRuJiY2zrlBDotCv.tV/AXzwjcQDJXIR.C',1,0),(61,'testuser3','$2a$10$VHyKt25w1tP6cqnqgUUm9edfCgn2l0SHNydCuB324R4fHsb6Biosa',1,0),(62,'monitor','$2a$10$najI05IFNm.4crWV9O35UOxYL23qQOSTHg/2w9SakA7Ds67bL8smu',1,0),(63,'bktest24','$2a$10$ssoF4jQtp8gWEASFelGDueYzWCQ/kL82410cG9SNEGA5HcQX6rJOS',1,0),(64,'bktest247@test.com','$2a$10$uBTQuDXECXnY1TRD7BBc.u6vfztVGdDVz2P5UDseC/4Ol809Akbpe',1,0),(65,'bktest248@test.com','$2a$10$gY6QaibG6RulIGoKq16CK..O5nACjUaCeHdoRBaNnHhyl880op.zy',1,0),(66,'bktest249@test.com','$2a$10$obrkxtn9vpd8YYC5rHqKlO4ZZQm1DSd0Gc5DC7IrgOtsEPbqYiRA2',1,0),(67,'bktest250@test.com','$2a$10$PFRVtOIGTLiK56smTKJs6.kl/FQo3iaXVZxuwyA1ZgzkpcQwtAWqq',1,0),(68,'bktest251@test.com','$2a$10$UFPCsK7zz5CMmdvBp6Awhe0670RL1U7hYItejUUBGmalCRYaAKs22',1,0),(69,'vasea2','$2a$10$RwAs5bvwYWBA7unl8wYJQuu/WeKXq/iqiYgtB6GVAWgS9HDir3B5m',1,0),(70,'bktest252@test.com','$2a$10$DHp2S/hxUUnV9T3hpBQDUe0jlMsIcQPclGq.7EjY1IbKPFeicUeMO',1,0),(71,'bktest253@test.com','$2a$10$V/np2ns72isOlfXfoTVyOe7rhW8oA1giHj4fMiSREf6tH0HtPp8KK',1,0),(72,'bktest365@test.net','$2a$10$ypVWsQjFflti0V7qKtqBL.vGus6HeU5kQsdC8cUk5QGg1jcltqVWW',1,0),(73,'bktest366@test.net','$2a$10$tnwhKkgxbWeyLoRwMeNZcOLmu5jTnX15q4yLbGUZE.ur4a8aFfsT2',1,0),(74,'bktest367@test.net','$2a$10$017Qo1RSUIHvVsLTh4JapORbc56xU0.Pqlxt39llm1FfNZFbeheTi',1,0),(75,'bktest368@test.net','$2a$10$HsN.4aZOGHzcrUlGa8dCt.fVTAG4ELPTczxDJPo4RyfgE0yJU8tBW',1,0),(76,'bktest369@test.net','$2a$10$7ng9u5nhNZ1H6NX10hMRz..QWiyeJ76AgqiukaAUlguIe/r.87Pgi',1,0),(77,'user1','$2a$10$v1WyjKW.a8aMiHwrK9FxUuIPbs8/eNH0XSnZ7489SPCGdhPONYZB2',1,0),(78,'Nkerry','$2a$10$ydOyCZ1gAUfrlHLzF4JyQe7M8aL19lm5jI0zes.2ga7dt4x4wSEqm',1,0),(79,'fedorovc','$2a$10$U75ORB36uIPiJPB8kdQwsun/RHUsF1cWHSyNBO3gDuPEz6NkpicRq',1,1),(80,'mfedorov','$2a$10$1bpe4LIkUcQV5URjl/EQaeQAII/JTztbZYgYB0rf.3QPqC.rvyklq',1,0),(81,'doctor2','$2a$10$Bc6dDFgswKfg4CRnEzVNOucs34oXb0Na5VPS7gC3E/negt3yd2YJ2',1,0),(82,'mfedorov2','$2a$10$Oh90iZlrkPcOuofI5fgdV.Ihe3oADqvpJYywSykk9d7N5hdNeHXoe',1,0),(83,'mfedorov3','$2a$10$BWmopBTJGFZbVgFPFMm0JeeBLEWfOCFONNHoOKlNo56KQS94Yr5bq',1,0),(84,'fedor','$2a$10$m9mBiVJXC786P3ZTFrP8sOCafbHjvmXUEhrC/vyrCCd8zxp8T3cYa',1,0),(85,'bktest370@test.net','$2a$10$QXewnNo0e/J2ewnsHnH7u.OcObtr0d3Zb/JIDJJTEoV.sFEUJPyzS',1,0),(86,'createtest','$2a$10$XHUZmXZlaMgpSMSylsTdRuQi31gs1c7rt1v9QPxRtm62cnmpc15vG',1,0),(87,'bktest371@test.net','$2a$10$05Wn92NZrPMae5R3LI.FyujDzEev0GdoYVjxiY6rZ3fpVDkXXi6Ky',1,0),(88,'mfedorov14','$2a$10$RJnbeI61w801nTK.AtRf8uapjqZIahzzVUhGk1cNPjfyP20JnR1Xu',1,0),(89,'apatient','$2a$10$elxTVk/Ua.sLTmYtNM9LA.I24XscGvNhJq3OqmW6/e7P9GiWLUDQW',1,0),(90,'bktest','$2a$10$vr1j8g/nh5/kPF1jWvQuJO5CmO/WSu9nh.BWgjoY5mAfJEzEIhagS',1,0),(91,'briankendalltest','$2a$10$0hs.Zghr0ZDLcWqVSjg8dujgGnBVDtIO0FzSc.PhFe0jPwlYf3vzS',1,0),(92,'test3','$2a$10$JXW3Txr1aS4vX1Gyt3tGeOKWpjOOhjZ7Efi7lZUdQqUnt9xvqh3PG',1,0),(93,'doctora','$2a$10$abm3sweQQ7J0FlnFoIvTXuH5ihuS02aBrczdMAQY2sNonNedMs/hG',1,1),(94,'createtest3','$2a$10$JaYqLK3I.uN5AAlEACrv0uNcjkFbQOAoBFugSaQY5AOkGo2TWOqsq',1,0),(95,'newnurse','$2a$10$toqFlx4ECSBkj9Zw72xU4u0Bua21xFfFvIFJzsimn3l7ph8E4B7TK',1,0),(96,'jsmith','$2a$10$rF0DzcZU5adQl0s6.kq7POSpcp2UftcjQUdnSY7Nq/dnCW9N3hOSC',1,0),(97,'brightg','$2a$10$tr2txjDVc4qZ8e8s9maK5.OWEqV0DeeW1e2q.a/aWZKDl./cFRRJK',1,0),(98,'kerryn','$2a$10$KiTcswINDphOk3n3cfmrnOZlgqEIhaQVNdTOzTKEqlvgXwtFQmbnO',1,0),(99,'bhopely','$2a$10$XbGtgotqTXcLt1Snee0F3eCGhJmzdSd07LUo9fg3HTMIZVWG0PPvq',1,0),(100,'eunger','$2a$10$KrRvO9q23MMDrYd0wPHYJepVsfeL222ulmELvYxW1/RVW7Gv8GEEG',1,0),(101,'another','$2a$10$HYs7VXf751aIvnOzqpx9fOkPFsQurDIDl1Abmvm345eeXJTZyd37i',1,1),(102,'pglatt','$2a$10$PMs7UOKkbrjb0H4F7iBRZO6iOmvivd3uTgEsrfw.NKjl18gJ8X1W6',1,0),(103,'rroman','$2a$10$uwVHTgwsHVlCgf27OeUyze3GKOjE4ZzBZslkLJUmBKPZv78qni3ty',1,0),(104,'srohde','$2a$10$ulo8CxYaBBz25qsrRyVkLeG/4FOwBNrFHwEQVFrFpxwij6NU/Vg7e',1,1),(105,'New Patient','$2a$10$EdW7erzNdxY3rT7tjlt5o.g/EhitInkEFyNs5JwOhvmpsoS9un8yq',1,0),(106,'test12','$2a$10$8l3oNML1dl1wCoBmM8nW/Ond.eEMgDwwT3xUDgvM9JurTJeF5DzPW',1,0),(107,'testmark1','$2a$10$To4FB0YMX4A2UpBBiBOdYumLO0pqkGiffw6.SoIh9wb4R/gEpHpPu',1,0),(108,'mcquadef','$2a$10$W0jegWZv9mzACnfSaqkT7uOF/eJel0Ie6EU0I/NhvqShQjRrt4bVe',1,0),(109,'alexd','$2a$10$rWAet7AOC8hZZ725J1B7ouLuA9n.P71SXkZEY6NlUT3elDqFanFNa',1,0),(110,'Nancy','$2a$10$vBORjJ12FdwRGw1XGVd3Lu78m9uaYdz8Pdk2ceuRQGmIsRLvApc82',1,0),(111,'jdoe','$2a$10$5pfPpaayaw/u.32k7Ka.sOQh3ncpMFAwTynF0GIOkAfNuhKB30RZW',1,0),(112,'nursen','$2a$10$jmVduiqpHxdPNPtQCcoOY.P21sK.Bl5FkEIdADBGOVxeXWK8RqOl.',1,0),(113,'nursed','$2a$10$Z3mMf0NMTWEBDSz8Lvy.reazbynkdj9yxdj87YwJX/Sk2MM15zRkm',1,0),(114,'drbob','$2a$10$zC8lu1nt.7psm83eA13Fde2gRxU7CzKnPEEo.6Ijbzgak61.NYziO',1,0),(115,'drjane','$2a$10$oOUf1JfQqr7pwusvZw8JHO4LjaUskJbUN2KHdO.0X/C8HVSvGVSXK',1,0),(116,'bobc','$2a$10$hIT0bd2kxxm7J9BYvWTHB.8tcaWGeqLU1aBDGGw8IUsCIETN.oJxO',1,0),(117,'maryc','$2a$10$9y9hixqc8MTXNPNyyOYtJeLCnXZunzuPtAIPgACiW8xWF4FyyiiTa',1,0),(118,'garyl','$2a$10$sdqdYoIPqK.ZEZp/H8cC6.8m8jxoi9NplchXJRnYXbXd7SiJ.cYRS',1,0),(119,'Florencen','$2a$10$AgsY4LtoyVm7/nxkILVmcuPDiPgpupv8q3FHmYGqpT0fc90F2km3W',1,0),(120,'karenm','$2a$10$S8P8APLfLFO7RbIf24JkxeSHeKgWOBv2WxGkvutcbviDfHco9uZYC',1,0),(121,'marcusw','$2a$10$J5AYza8mVxNGpdX5NtCw1OI2ycgrKNSc4K2GyFjW7MdiTTHK/QD2i',1,0),(122,'ajones','$2a$10$Do1zX5lMNH9WzIPOUg8Fg.hCji66iQVw7WesGXh35.Ly9/Y.l3mf.',1,0),(123,'strout','$2a$10$5CUp0/qZ.ucdm4Esniq0o.qPMK97Q6n00FRY9c/1gR5lER6AyXb12',1,1),(124,'scohen','$2a$10$b2On3Wqvoh2Tjf789GWSLeCsDti01mwI7vLjnrowNpmeisTgQ7SQu',1,0),(125,'arst','$2a$10$objN2GLr9AwZfYKq9VChs.enU9fygA/r/9tk/rI6R1LaV72/iyIwe',1,0),(126,'rap','$2a$10$ztGe64HT4zRByQ0G8pJf/e9FLsjxsX18zgxwVQ/BnOvbmeOOh69HW',1,0),(127,'firstlast','$2a$10$ujJgeRj9dO8DS90yX2o/OOd7iPFfvHo9KEwCbtnfn9b/uzi.3hax6',1,0),(128,'qwf1','$2a$10$pmH0Du.wZ9nk841AQ31jJeFHA.Xyy375IMQ9FXamo31LWRhAwZEVC',1,0),(129,'mfed','$2a$10$7YbSCD.Ke5W97QhKmT4tfu0v2OfFjDbqsdalsgBNoBTO3uPRVQScy',1,0),(130,'mfed22','$2a$10$llnXVYhTdvzFYOoKfwdduuyQlyCYLzuo8m8foRlcdAn0DSNRUXsHK',1,0),(131,'mfed23','$2a$10$bIhez007KoqBqOMTO/MrZOIfPe3mtZv7XWjMYDjgIQuMQMG3ISGJe',1,0),(132,'New','$2a$10$Bl2JdtQu41id8bLb6zG4JeR1ckBdP5lxZ6XsstsD9Hkb3NAQFmZpa',1,0),(133,'system','$2a$10$EefG4rFmkhhkzS/0KhdHDuMLKiIluiSWv/9ewEEiwK7Ume2bcLowW',1,0),(134,'ars1','$2a$10$vEt8oimVc8aNasMk.V.wQONRlHRnKqA/QjpRzDEipftAIdB.hmdIm',1,0),(135,'aarsarsras','$2a$10$CN3Crt9ExbQpsJ7mjssWW.cN.BLa1YDh8PcKkkzWMFlAVpRSAg5HO',1,0),(136,'dude','$2a$10$moDXXx/aaOvNmBl8EbePeOM0X0JE03P0VJE/RhuObDIZEBzmhR5S.',1,0),(137,'ars1111','$2a$10$1rvgg3mKdfONlwVNeDjgbOa2ECaiukjMoxDU/pedpW/m7Iq6NBIE2',1,0),(138,'ars1212121','$2a$10$L9O8J8IHplcuqHz2bOhOAONOp6hNpJsWFXG1h0O/PgI2vI5STe0U6',1,0),(139,'arsarsra111','$2a$10$RxoyRiYNisxd.oKmtL/0Hugiu.5a4eQEWygctvtzd86.Y/Xyfs6Li',1,0),(140,'drdr','$2a$10$dNkxYzl6nzLZPYK5kvz.iuA8UCDmt0JGmdUxDFmW.BFeStlLvb0ce',1,0),(141,'fffffff','$2a$10$9Il.ti6RwXudrVg9.zpcE.NlVMfVO4NtEBU0u2nlzZEmLcoNIJqaG',1,0),(142,'lenurse','$2a$10$RZm/YfDhJE5ij14K0ZED4O/NPJqkBhP5/FNr8LBB/TjilT0yVbRvq',1,0),(143,'newpatt','$2a$10$YxWZ8lg2AdWZV9z/6/qesuaVt4Uz1KSc.f3CaSNkbM5mGpghPBZ9W',1,0),(144,'newpatt2','$2a$10$8SQleBNMzryf7aY671994OJ0MKC9I5sCuXDySoCx2SQRnD7p2zOiO',1,0),(145,'supervisor','$2a$10$.s5olmNC/C4L.kWABNBEcuse/L1amVUl3cdt5DcY17M7Ar3K8ENyy',1,0),(146,'supervisor3','$2a$10$tIEeR4P3oQ0BkGpjYsnvZuWL5irI3z5l96KN2fADunvcjwsyiOZo6',1,0),(147,'supervisor4','$2a$10$CRz/TrxjOxelSAWCZMbB7OztSdX6ubHGo1HvvS16rlYHWw1LBjcyS',1,0),(148,'supervisor5','$2a$10$ZVz8UcoBrFCRA2s2uEgEVuOrLoExaT9BKKH3SqRVCN6DidFPYUftG',1,0),(149,'supervisor6','$2a$10$k.0wa53TMTDIZ5m8maPFyuQQTq5Nh8dpBXG3vAiBdwfmtW25nCftS',1,0),(150,'patt2','$2a$10$4dRsyRP6NGQqyYWbgOOWdezCG/hBpv/OW7h/ZXZe115iSkpv4hfp.',1,0),(151,'sandya3','$2a$10$un6RnnrGl3u9ofzJ.J1fE.8zwCrDV12w3yds6zcCcMR.U1b1I2eGK',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-18  9:33:04
