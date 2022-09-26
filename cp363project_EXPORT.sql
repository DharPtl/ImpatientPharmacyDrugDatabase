-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: cp363project
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_ID` int NOT NULL,
  `start_date` date NOT NULL,
  `contract_period` varchar(50) NOT NULL,
  `pharmacy_ID` int NOT NULL,
  `manufacturer_ID` int NOT NULL,
  PRIMARY KEY (`contract_ID`),
  KEY `manufacturer_ID` (`manufacturer_ID`),
  KEY `pharmacy_ID` (`pharmacy_ID`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`manufacturer_ID`) REFERENCES `pharma_company` (`manufacturer_ID`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`pharmacy_ID`) REFERENCES `inpatient_pharmacy` (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (0,'2022-01-01','Indefinite',1,1);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `license_No` int NOT NULL,
  `doctor_firstName` varchar(50) NOT NULL,
  `doctor_lastName` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `contact_no` int NOT NULL,
  PRIMARY KEY (`license_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Gregory','House','Internal Medicine',1234567891);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_item`
--

DROP TABLE IF EXISTS `drug_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_item` (
  `drug_ID` int NOT NULL,
  `trade_name` varchar(50) NOT NULL,
  `strength` int NOT NULL,
  `expiry` varchar(20) NOT NULL,
  `drug_description` varchar(50) NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`drug_ID`),
  KEY `manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `drug_item_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `pharma_company` (`manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_item`
--

LOCK TABLES `drug_item` WRITE;
/*!40000 ALTER TABLE `drug_item` DISABLE KEYS */;
INSERT INTO `drug_item` VALUES (1,'Tylenol',500,'2023-01-01','',1);
/*!40000 ALTER TABLE `drug_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_pharmacy`
--

DROP TABLE IF EXISTS `drug_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_pharmacy` (
  `drug_ID` int NOT NULL,
  `pharmacy_ID` int NOT NULL,
  `qtyonhand` int NOT NULL,
  PRIMARY KEY (`drug_ID`,`pharmacy_ID`),
  KEY `pharmacy_ID` (`pharmacy_ID`),
  CONSTRAINT `drug_pharmacy_ibfk_1` FOREIGN KEY (`drug_ID`) REFERENCES `drug_item` (`drug_ID`),
  CONSTRAINT `drug_pharmacy_ibfk_2` FOREIGN KEY (`pharmacy_ID`) REFERENCES `inpatient_pharmacy` (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_pharmacy`
--

LOCK TABLES `drug_pharmacy` WRITE;
/*!40000 ALTER TABLE `drug_pharmacy` DISABLE KEYS */;
INSERT INTO `drug_pharmacy` VALUES (1,1,999);
/*!40000 ALTER TABLE `drug_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inpatient_pharmacy`
--

DROP TABLE IF EXISTS `inpatient_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inpatient_pharmacy` (
  `pharmacy_ID` int NOT NULL,
  `pharmacyName` varchar(50) NOT NULL,
  `pharmacyAddress` varchar(50) NOT NULL,
  `contact_No` varchar(50) NOT NULL,
  PRIMARY KEY (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inpatient_pharmacy`
--

LOCK TABLES `inpatient_pharmacy` WRITE;
/*!40000 ALTER TABLE `inpatient_pharmacy` DISABLE KEYS */;
INSERT INTO `inpatient_pharmacy` VALUES (1,'CP363 Pharmacy','321 Real Street','9051234567');
/*!40000 ALTER TABLE `inpatient_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `ssn` int NOT NULL,
  `patient_firstName` varchar(50) NOT NULL,
  `patient_lastName` varchar(50) NOT NULL,
  `ohip_No` int NOT NULL,
  `room_No` int NOT NULL,
  `address` varchar(10) NOT NULL,
  `contact_No` int DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Daniel','Nguyen',12345,11,'123 Fake S',1234567890);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_unit`
--

DROP TABLE IF EXISTS `patient_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_unit` (
  `unit_ID` int NOT NULL,
  `patient_ID` int NOT NULL,
  `floor` int NOT NULL,
  PRIMARY KEY (`unit_ID`),
  KEY `patient_ID` (`patient_ID`),
  CONSTRAINT `patient_unit_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_unit`
--

LOCK TABLES `patient_unit` WRITE;
/*!40000 ALTER TABLE `patient_unit` DISABLE KEYS */;
INSERT INTO `patient_unit` VALUES (1,1,1);
/*!40000 ALTER TABLE `patient_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharma_company`
--

DROP TABLE IF EXISTS `pharma_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharma_company` (
  `manufacturer_ID` int NOT NULL,
  `manufacturer_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` int NOT NULL,
  PRIMARY KEY (`manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharma_company`
--

LOCK TABLES `pharma_company` WRITE;
/*!40000 ALTER TABLE `pharma_company` DISABLE KEYS */;
INSERT INTO `pharma_company` VALUES (1,'Apotex','1 Fake Street',2147483647);
/*!40000 ALTER TABLE `pharma_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_ID` int NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `drug_ID` int NOT NULL,
  `strength` int NOT NULL,
  `quantity` int NOT NULL,
  `refills` int NOT NULL,
  `special_instructions` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `patient_ID` int NOT NULL,
  `doctor_ID` int NOT NULL,
  PRIMARY KEY (`prescription_ID`),
  KEY `patient_ID` (`patient_ID`),
  KEY `doctor_ID` (`doctor_ID`),
  KEY `drug_ID` (`drug_ID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ssn`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`license_No`),
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`drug_ID`) REFERENCES `drug_item` (`drug_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'acetaminophen',1,5,5,5,'Take once daily','2004-10-19',1,1);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 12:24:49
