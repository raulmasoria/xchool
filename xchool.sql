CREATE DATABASE  IF NOT EXISTS `xchool` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `xchool`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: xchool
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Design 488',NULL,NULL),(2,'Criminology 425',NULL,NULL),(3,'Computer Science 235',NULL,NULL),(4,'Creative Arts 297',NULL,NULL),(5,'Applied Science (Psychology) 543',NULL,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `pass_score` int NOT NULL,
  `progress` int NOT NULL,
  `score` int NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `graduate` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inscriptions_course_id_foreign` (`course_id`),
  KEY `inscriptions_user_id_foreign` (`user_id`),
  CONSTRAINT `inscriptions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,2,1,50,100,80,1,0,NULL,'2023-03-10 09:23:26'),(2,1,1,80,100,100,1,0,NULL,'2023-03-10 09:05:20'),(3,4,1,50,100,100,1,0,NULL,'2023-03-10 09:05:20'),(4,5,1,80,100,80,1,0,NULL,'2023-03-10 09:05:20'),(5,3,1,50,99,100,0,0,NULL,'2023-03-10 09:05:20'),(6,2,2,80,90,80,0,0,NULL,NULL),(7,5,3,50,100,100,1,0,NULL,NULL),(8,2,3,50,75,25,0,0,NULL,NULL),(9,3,3,80,90,100,0,0,NULL,NULL),(10,5,4,50,100,80,1,0,NULL,NULL),(11,4,4,50,75,80,0,0,NULL,NULL),(12,3,4,80,75,80,0,0,NULL,NULL),(13,2,4,80,90,100,0,0,NULL,NULL),(14,1,5,80,75,100,0,0,NULL,NULL),(15,2,5,50,90,100,0,0,NULL,NULL),(16,5,5,50,75,100,0,0,NULL,NULL),(17,4,5,80,100,25,1,0,NULL,NULL),(18,1,6,80,100,25,1,0,NULL,NULL),(19,3,6,50,75,80,0,0,NULL,NULL),(20,1,7,80,90,80,0,0,NULL,NULL),(21,5,7,80,75,25,0,0,NULL,NULL),(22,2,7,80,75,80,0,0,NULL,NULL),(23,1,8,50,100,25,1,0,NULL,NULL),(24,4,8,50,100,100,1,0,NULL,NULL),(25,4,9,50,75,100,0,0,NULL,NULL),(26,3,9,80,75,100,0,0,NULL,NULL),(27,5,9,80,90,100,0,0,NULL,NULL),(28,1,9,50,90,80,0,0,NULL,NULL),(29,5,10,50,75,80,0,0,NULL,NULL),(30,1,10,80,90,80,0,0,NULL,NULL),(31,5,11,50,75,80,0,0,NULL,NULL),(32,1,11,80,100,25,1,0,NULL,NULL),(33,2,11,80,75,80,0,0,NULL,NULL),(34,3,12,50,75,25,0,0,NULL,NULL),(35,5,12,80,75,80,0,0,NULL,NULL),(36,5,13,80,100,100,1,0,NULL,NULL),(37,2,13,80,100,80,1,0,NULL,NULL),(38,4,13,50,75,100,0,0,NULL,NULL),(39,4,14,80,75,25,0,0,NULL,NULL),(40,5,14,50,75,25,0,0,NULL,NULL),(41,2,14,50,75,80,0,0,NULL,NULL),(42,5,15,80,100,25,1,0,NULL,NULL),(43,4,15,50,90,25,0,0,NULL,NULL),(44,5,16,50,75,80,0,0,NULL,NULL),(45,3,17,80,90,80,0,0,NULL,NULL),(46,4,17,80,75,100,0,0,NULL,NULL),(47,5,17,80,75,100,0,0,NULL,NULL),(48,1,17,50,100,25,1,0,NULL,NULL),(49,2,17,80,75,25,0,0,NULL,NULL),(50,1,18,80,75,80,0,0,NULL,NULL),(51,5,18,80,90,100,0,0,NULL,NULL),(52,2,18,50,90,100,0,0,NULL,NULL),(53,4,19,80,90,80,0,0,NULL,NULL),(54,5,20,50,75,80,0,0,NULL,NULL);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_03_07_113243_create_courses_table',1),(6,'2023_03_07_114103_create_inscriptions_table',1),(7,'2023_03_07_114103_create_enrollments_table',1),(8,'2023_03_08_162043_add_rol_to_users_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'María Teresa Montenegro Orta','maria.teresa.montenegro.orta@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(2,'César Correa Solano','cesar.correa.solano@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(3,'Luz Correa Ontiveros','luz.correa.ontiveros@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(4,'Elvira Caballero Montemayor','elvira.caballero.montemayor@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(5,'Luis Miguel Apodaca Rael','luis.miguel.apodaca.rael@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(6,'Guadalupe Vela Fuentes','guadalupe.vela.fuentes@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(7,'Gregorio Ríos Sisneros','gregorio.rios.sisneros@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(8,'Daniel Cavazos Jaramillo','daniel.cavazos.jaramillo@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(9,'Luz Téllez Rodrígez','luz.tellez.rodrigez@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(10,'Adela Barragán Rosas','adela.barragan.rosas@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(11,'Sta. Luisa Banda Lucero','sta.luisa.banda.lucero@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(12,'Mariano Dávila Becerra','mariano.davila.becerra@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(13,'Rocio Valentín Arellano','rocio.valentin.arellano@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(14,'Amalia Alarcón Pacheco','amalia.alarcon.pacheco@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(15,'Sta. Alicia Orellana Arroyo','sta.alicia.orellana.arroyo@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(16,'Francisca Jaramillo Jáquez','francisca.jaramillo.jaquez@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(17,'Enrique Prado Chapa','enrique.prado.chapa@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(18,'Claudio Parra Gil','claudio.parra.gil@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(19,'Sra. Margarita Salcedo Mateo','sra.margarita.salcedo.mateo@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(20,'Josefina Reséndez Atencio','josefina.resendez.atencio@not_mail.com',NULL,NULL,NULL,NULL,NULL,0),(21,'Administrador','admin@xchool.es',NULL,'$2a$12$1qoGpmVG.BjRDLVjyER3X.hbrk9Q9caEMDfCyCXuBiSx581C0/1uC',NULL,NULL,NULL,1);
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

-- Dump completed on 2023-03-14 15:03:03
