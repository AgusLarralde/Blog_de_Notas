-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: blog_de_notas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan Carlos','juanca45@gmail.com'),(2,'Pedro Enrique Almirón','pedrito00@gmail.com'),(3,'Dalmasio Barba Buena','dalmabb@gmail.com'),(4,'Andres Gonzalez','gonzalezandres@gmail.com'),(5,'Juan Perez','jp34@gmail.com'),(6,'Ricardo Fort','rick7878@gmail.com'),(7,'Estaban Quito','banquito@gmail.com'),(8,'Carla Conte','nomela@gmail.com'),(9,'Tomás Ignacio Bonaparte','tomi18@gmail.com'),(10,'Maia Gimenez','maianez@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `release_date` datetime NOT NULL,
  `last_modificated` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `can_be_removed` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_FK` (`user_id`),
  CONSTRAINT `notes_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Compras del jueves en el super','2021-09-27 21:50:33','2021-09-27 22:50:33','lechuga, tomate, pepinillos',0,7),(2,'Proyecto integrador','2021-08-20 11:50:33','2021-09-03 10:40:33','Terminar de incorporar las correcciones del 6to Sprint',0,3),(3,'La Empresa Invencible','2021-08-29 11:50:33','2021-09-10 13:40:09','Me re gusto, a pesar de que tenias que leerlo bien concentrado',0,4),(4,'Terminar lo de Panorama','2021-06-12 11:20:10','2021-09-10 09:18:00','Lo tengo que tener terminado para el jueves que viene',0,8),(5,'Juanta Directiva','2021-05-12 09:45:45','2021-07-10 13:56:01','Asegurarme de que todos los inversionistas reciban la invitación y se presenten',0,4),(6,'Casco de seguridad','2021-03-12 17:03:46','2021-03-13 13:21:14','Revisar el prototipo y hacerle los ajustes de diseño',0,4),(7,'Mes de Enero','2021-01-28 19:30:56','2021-01-28 19:35:34','$45.899,65 Compras Varias',0,1),(8,'Tares para el sábado','2021-05-03 20:45:23','2021-05-03 21:07:21','Barrer la cocina, lavar la ropa, repasar todas las repisas y tender la cama de invitados',0,10),(9,'Boku no Hero Academi T5','2021-08-15 14:20:00','2021-09-26 23:34:59','Mirarla en Anime.flv',0,9),(10,'Tensei Shitara Datta Slime T2 parte 2','2021-07-15 22:48:39','2021-09-24 23:59:59','Mirarla en Anime.flv',0,2);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Compras'),(4,'Cosas de la facu'),(9,'Gastos del mes'),(7,'Libros leidos'),(10,'Medicamentos de la abuela'),(6,'Peliculas para mirar'),(2,'Proyectos del trabajo'),(8,'Reuniones importantes'),(1,'Series para mirar'),(3,'Tareas del hogar');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_note`
--

DROP TABLE IF EXISTS `category_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_note_FK` (`category_id`),
  KEY `category_note_FK_1` (`note_id`),
  CONSTRAINT `category_note_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_note_FK_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_note`
--

LOCK TABLES `category_note` WRITE;
/*!40000 ALTER TABLE `category_note` DISABLE KEYS */;
INSERT INTO `category_note` VALUES (1,1,5),(2,2,2),(3,3,7),(4,4,4),(5,5,8),(6,6,2),(7,7,9),(8,8,3),(9,9,1),(10,10,1);
/*!40000 ALTER TABLE `category_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog_de_notas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-27 22:35:12
