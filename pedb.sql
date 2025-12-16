-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: pedb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `behavior`
--

DROP TABLE IF EXISTS `behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `behavior` (
  `behavior_id` int NOT NULL AUTO_INCREMENT,
  `species_id` int NOT NULL,
  `related_habitat_id` int DEFAULT NULL,
  `related_climate_id` int DEFAULT NULL,
  `related_weather_id` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`behavior_id`),
  KEY `species_id` (`species_id`),
  KEY `related_habitat_id` (`related_habitat_id`),
  KEY `related_climate_id` (`related_climate_id`),
  KEY `related_weather_id` (`related_weather_id`),
  CONSTRAINT `behavior_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `behavior_ibfk_2` FOREIGN KEY (`related_habitat_id`) REFERENCES `habitat` (`habitat_id`) ON DELETE SET NULL,
  CONSTRAINT `behavior_ibfk_3` FOREIGN KEY (`related_climate_id`) REFERENCES `climate` (`climate_id`) ON DELETE SET NULL,
  CONSTRAINT `behavior_ibfk_4` FOREIGN KEY (`related_weather_id`) REFERENCES `weather` (`weather_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behavior`
--

LOCK TABLES `behavior` WRITE;
/*!40000 ALTER TABLE `behavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biologicalevolution`
--

DROP TABLE IF EXISTS `biologicalevolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biologicalevolution` (
  `evolution_id` int NOT NULL AUTO_INCREMENT,
  `species_id` int NOT NULL,
  `evolution_relation` enum('CommonAncestor','Convergent','Artificial','Fusion','RegionalForm') NOT NULL,
  `notes` text,
  PRIMARY KEY (`evolution_id`),
  KEY `species_id` (`species_id`),
  CONSTRAINT `biologicalevolution_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biologicalevolution`
--

LOCK TABLES `biologicalevolution` WRITE;
/*!40000 ALTER TABLE `biologicalevolution` DISABLE KEYS */;
INSERT INTO `biologicalevolution` VALUES (1,2,'Fusion','메탕 2마리의 합체'),(2,3,'Fusion','메탕구 + 메탕 2마리의 합체'),(3,4,'Fusion','메타그로스 + 메탕구 + 메탕 2마리의 합체');
/*!40000 ALTER TABLE `biologicalevolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `climate`
--

DROP TABLE IF EXISTS `climate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `climate` (
  `climate_id` int NOT NULL,
  `climate_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`climate_id`),
  UNIQUE KEY `climate_name` (`climate_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climate`
--

LOCK TABLES `climate` WRITE;
/*!40000 ALTER TABLE `climate` DISABLE KEYS */;
/*!40000 ALTER TABLE `climate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietdetail`
--

DROP TABLE IF EXISTS `dietdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietdetail` (
  `diet_id` int NOT NULL AUTO_INCREMENT,
  `predator_id` int NOT NULL,
  `prey_id` int DEFAULT NULL,
  `prey_item` text,
  `hunting_method` varchar(100) NOT NULL,
  PRIMARY KEY (`diet_id`),
  KEY `predator_id` (`predator_id`),
  KEY `prey_id` (`prey_id`),
  CONSTRAINT `dietdetail_ibfk_1` FOREIGN KEY (`predator_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `dietdetail_ibfk_2` FOREIGN KEY (`prey_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietdetail`
--

LOCK TABLES `dietdetail` WRITE;
/*!40000 ALTER TABLE `dietdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameevolution`
--

DROP TABLE IF EXISTS `gameevolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameevolution` (
  `base_species` int NOT NULL,
  `evolve_species` int NOT NULL,
  `method_type` enum('Level','Stone','Friendship','Trade','Item','Location','Other') NOT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`base_species`,`evolve_species`),
  KEY `evolve_species` (`evolve_species`),
  CONSTRAINT `gameevolution_ibfk_1` FOREIGN KEY (`base_species`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `gameevolution_ibfk_2` FOREIGN KEY (`evolve_species`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameevolution`
--

LOCK TABLES `gameevolution` WRITE;
/*!40000 ALTER TABLE `gameevolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameevolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitat` (
  `habitat_id` int NOT NULL,
  `habitat_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`habitat_id`),
  UNIQUE KEY `habitat_name` (`habitat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humanrelation`
--

DROP TABLE IF EXISTS `humanrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanrelation` (
  `type_id` int NOT NULL,
  `type_name` enum('Coexist','Worship','Despise','Artificial','HistoricalImpact','Human_Eats_Pokemon','Pokemon_Eats_Human','Human_Harms_Pokemon','Pokemon_Harms_Human') NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanrelation`
--

LOCK TABLES `humanrelation` WRITE;
/*!40000 ALTER TABLE `humanrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `humanrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactiontype`
--

DROP TABLE IF EXISTS `interactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interactiontype` (
  `type_id` int NOT NULL,
  `type_name` enum('Mutualism','Commensalism','Parasitism','Predator','Prey','Competition') NOT NULL,
  `directionality` enum('Unidirectional','Bidirectional') NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactiontype`
--

LOCK TABLES `interactiontype` WRITE;
/*!40000 ALTER TABLE `interactiontype` DISABLE KEYS */;
INSERT INTO `interactiontype` VALUES (1,'Mutualism','Bidirectional');
/*!40000 ALTER TABLE `interactiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonclimate`
--

DROP TABLE IF EXISTS `pokemonclimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonclimate` (
  `species_id` int NOT NULL,
  `climate_id` int NOT NULL,
  PRIMARY KEY (`species_id`,`climate_id`),
  KEY `climate_id` (`climate_id`),
  CONSTRAINT `pokemonclimate_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemonclimate_ibfk_2` FOREIGN KEY (`climate_id`) REFERENCES `climate` (`climate_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonclimate`
--

LOCK TABLES `pokemonclimate` WRITE;
/*!40000 ALTER TABLE `pokemonclimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemonclimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonhabitat`
--

DROP TABLE IF EXISTS `pokemonhabitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonhabitat` (
  `species_id` int NOT NULL,
  `habitat_id` int NOT NULL,
  PRIMARY KEY (`species_id`,`habitat_id`),
  KEY `habitat_id` (`habitat_id`),
  CONSTRAINT `pokemonhabitat_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemonhabitat_ibfk_2` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`habitat_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonhabitat`
--

LOCK TABLES `pokemonhabitat` WRITE;
/*!40000 ALTER TABLE `pokemonhabitat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemonhabitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonhumanrelation`
--

DROP TABLE IF EXISTS `pokemonhumanrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonhumanrelation` (
  `species_id` int NOT NULL,
  `type_id` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`species_id`,`type_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `pokemonhumanrelation_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemonhumanrelation_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `humanrelation` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonhumanrelation`
--

LOCK TABLES `pokemonhumanrelation` WRITE;
/*!40000 ALTER TABLE `pokemonhumanrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemonhumanrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemoninteraction`
--

DROP TABLE IF EXISTS `pokemoninteraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemoninteraction` (
  `pokemon_interaction_id` int NOT NULL AUTO_INCREMENT,
  `pokemon_id_1` int NOT NULL,
  `pokemon_id_2` int NOT NULL,
  `type_id` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`pokemon_interaction_id`),
  KEY `pokemon_id_1` (`pokemon_id_1`),
  KEY `pokemon_id_2` (`pokemon_id_2`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `pokemoninteraction_ibfk_1` FOREIGN KEY (`pokemon_id_1`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemoninteraction_ibfk_2` FOREIGN KEY (`pokemon_id_2`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemoninteraction_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `interactiontype` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemoninteraction`
--

LOCK TABLES `pokemoninteraction` WRITE;
/*!40000 ALTER TABLE `pokemoninteraction` DISABLE KEYS */;
INSERT INTO `pokemoninteraction` VALUES (1,17,18,1,'플라이곤이 모래바람을 일으켜 악비아르를 숨긴다.'),(2,18,17,1,'악비아르는 모래바람 속에서 사냥을 보조한다.'),(3,17,18,1,'플라이곤이 모래바람을 일으켜 악비아르를 숨긴다.'),(4,18,17,1,'악비아르는 모래바람 속에서 사냥을 보조한다.');
/*!40000 ALTER TABLE `pokemoninteraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonregion`
--

DROP TABLE IF EXISTS `pokemonregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonregion` (
  `species_id` int NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`species_id`,`region_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `pokemonregion_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemonregion_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonregion`
--

LOCK TABLES `pokemonregion` WRITE;
/*!40000 ALTER TABLE `pokemonregion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemonregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonspecies`
--

DROP TABLE IF EXISTS `pokemonspecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonspecies` (
  `species_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type1` enum('Normal','Fire','Water','Grass','Bug','Electric','Ice','Fighting','Poison','Ground','Flying','Psychic','Rock','Ghost','Dragon','Dark','Steel','Fairy') NOT NULL,
  `type2` enum('Normal','Fire','Water','Grass','Bug','Electric','Ice','Fighting','Poison','Ground','Flying','Psychic','Rock','Ghost','Dragon','Dark','Steel','Fairy') DEFAULT NULL,
  `origin` enum('Natural','Artificial','Spirit','Paradox','UltraBeast') NOT NULL,
  `sex_rate` decimal(5,2) DEFAULT NULL,
  `activity_time` enum('Diurnal','Nocturnal','Crepuscular','All-Day','Special') NOT NULL,
  `diet_type` enum('Herbivore','Carnivore','Omnivore','Special') NOT NULL,
  `extinction_status` enum('Extinct','Alive','Restored') NOT NULL,
  `notes` text,
  PRIMARY KEY (`species_id`),
  CONSTRAINT `pokemonspecies_chk_1` CHECK (((`type1` <> `type2`) or (`type2` is null))),
  CONSTRAINT `pokemonspecies_chk_2` CHECK (((`sex_rate` is null) or (`sex_rate` between 0.00 and 100.00)))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonspecies`
--

LOCK TABLES `pokemonspecies` WRITE;
/*!40000 ALTER TABLE `pokemonspecies` DISABLE KEYS */;
INSERT INTO `pokemonspecies` VALUES (1,'메탕','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(2,'메탕구','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(3,'메타그로스','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(4,'메가메타그로스','Steel','Psychic','Artificial',0.00,'All-Day','Omnivore','Alive','메가진화 개념 적용'),(5,'메탕','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(6,'메탕구','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(7,'메타그로스','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(8,'메가메타그로스','Steel','Psychic','Artificial',0.00,'All-Day','Omnivore','Alive','메가진화 개념 적용'),(9,'메탕','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(10,'메탕구','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(11,'메타그로스','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(12,'메가메타그로스','Steel','Psychic','Artificial',0.00,'All-Day','Omnivore','Alive','메가진화 개념 적용'),(13,'메탕','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(14,'메탕구','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(15,'메타그로스','Steel','Psychic','Natural',0.00,'All-Day','Omnivore','Alive',NULL),(16,'메가메타그로스','Steel','Psychic','Artificial',0.00,'All-Day','Omnivore','Alive','메가진화 개념 적용'),(17,'플라이곤','Ground','Dragon','Natural',50.00,'All-Day','Carnivore','Alive',NULL),(18,'악비아르','Ground',NULL,'Natural',50.00,'All-Day','Carnivore','Alive',NULL),(19,'플라이곤','Ground','Dragon','Natural',50.00,'All-Day','Carnivore','Alive',NULL),(20,'악비아르','Ground',NULL,'Natural',50.00,'All-Day','Carnivore','Alive',NULL),(21,'플라이곤','Ground','Dragon','Natural',50.00,'All-Day','Carnivore','Alive',NULL),(22,'악비아르','Ground',NULL,'Natural',50.00,'All-Day','Carnivore','Alive',NULL);
/*!40000 ALTER TABLE `pokemonspecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemonweather`
--

DROP TABLE IF EXISTS `pokemonweather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemonweather` (
  `species_id` int NOT NULL,
  `weather_id` int NOT NULL,
  PRIMARY KEY (`species_id`,`weather_id`),
  KEY `weather_id` (`weather_id`),
  CONSTRAINT `pokemonweather_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE,
  CONSTRAINT `pokemonweather_ibfk_2` FOREIGN KEY (`weather_id`) REFERENCES `weather` (`weather_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemonweather`
--

LOCK TABLES `pokemonweather` WRITE;
/*!40000 ALTER TABLE `pokemonweather` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemonweather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL,
  `region_name` enum('관동','성도','호연','신오','하나','칼로스','알로라','가라르','팔데아','히스이','깨어진 세계','울트라스페이스','머나먼 고도','북신 고장') NOT NULL,
  `notes` text,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialstructure`
--

DROP TABLE IF EXISTS `socialstructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialstructure` (
  `social_id` int NOT NULL AUTO_INCREMENT,
  `species_id` int NOT NULL,
  `structure_type` enum('Leader-Based','Competitive','Parental','Colony') NOT NULL,
  `hierarchy_level` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`social_id`),
  KEY `species_id` (`species_id`),
  CONSTRAINT `socialstructure_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `pokemonspecies` (`species_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialstructure`
--

LOCK TABLES `socialstructure` WRITE;
/*!40000 ALTER TABLE `socialstructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialstructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `weather_id` int NOT NULL,
  `weather_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`weather_id`),
  UNIQUE KEY `weather_name` (`weather_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pedb'
--

--
-- Dumping routines for database 'pedb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-16  9:40:30
