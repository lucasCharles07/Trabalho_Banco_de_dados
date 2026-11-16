-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: brmw_hotel
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo` (
  `id_consumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_servico` int(11) NOT NULL,
  `id_hospedagem` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id_consumo`),
  KEY `fk_consumo_servico` (`id_servico`),
  KEY `fk_consumo_hospedagem` (`id_hospedagem`),
  CONSTRAINT `fk_consumo_hospedagem` FOREIGN KEY (`id_hospedagem`) REFERENCES `hospedagem` (`id_hospedagem`),
  CONSTRAINT `fk_consumo_servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
INSERT INTO `consumo` VALUES (1,1,1,2,'2026-11-15 08:00:00'),(2,2,2,1,'2026-11-16 13:00:00'),(3,3,3,1,'2026-11-17 20:00:00'),(4,4,4,3,'2026-11-18 10:00:00'),(5,5,5,1,'2026-11-19 15:00:00'),(6,6,6,1,'2026-11-20 16:00:00'),(7,7,7,2,'2026-11-21 18:00:00'),(8,8,8,1,'2026-11-22 22:00:00'),(9,9,9,1,'2026-11-23 09:00:00'),(10,10,10,4,'2026-11-24 11:00:00');
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Carlos Silva','Recepcionista'),(2,'Amanda Souza','Gerente'),(3,'Pedro Santos','Camareiro'),(4,'Juliana Costa','Recepcionista'),(5,'Rafael Lima','Segurança'),(6,'Marina Alves','Camareira'),(7,'Bruno Rocha','Supervisor'),(8,'Paula Martins','Financeiro'),(9,'Lucas Pereira','Recepcionista'),(10,'Fernanda Gomes','Gerente'),(11,'Carlos Silva','Recepcionista'),(12,'Amanda Souza','Gerente'),(13,'Pedro Santos','Camareiro'),(14,'Juliana Costa','Recepcionista'),(15,'Rafael Lima','Segurança'),(16,'Marina Alves','Camareira'),(17,'Bruno Rocha','Supervisor'),(18,'Paula Martins','Financeiro'),(19,'Lucas Pereira','Recepcionista'),(20,'Fernanda Gomes','Gerente');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedagem` (
  `id_hospedagem` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hospedagem`),
  KEY `fk_hospedagem_reserva` (`id_reserva`),
  KEY `fk_hospedagem_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_hospedagem_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_hospedagem_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedagem`
--

LOCK TABLES `hospedagem` WRITE;
/*!40000 ALTER TABLE `hospedagem` DISABLE KEYS */;
INSERT INTO `hospedagem` VALUES (1,1,1,'2026-11-15 14:00:00','2026-11-18 12:00:00'),(2,2,2,'2026-11-16 14:00:00','2026-11-20 12:00:00'),(3,3,3,'2026-11-17 14:00:00','2026-11-19 12:00:00'),(4,4,4,'2026-11-18 14:00:00','2026-11-21 12:00:00'),(5,5,5,'2026-11-19 14:00:00','2026-11-22 12:00:00'),(6,6,6,'2026-11-20 14:00:00','2026-11-23 12:00:00'),(7,7,7,'2026-11-21 14:00:00','2026-11-24 12:00:00'),(8,8,8,'2026-11-22 14:00:00','2026-11-25 12:00:00'),(9,9,9,'2026-11-23 14:00:00','2026-11-26 12:00:00'),(10,10,10,'2026-11-24 14:00:00','2026-11-27 12:00:00');
/*!40000 ALTER TABLE `hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospede`
--

DROP TABLE IF EXISTS `hospede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospede` (
  `id_hospede` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_hospede`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospede`
--

LOCK TABLES `hospede` WRITE;
/*!40000 ALTER TABLE `hospede` DISABLE KEYS */;
INSERT INTO `hospede` VALUES (1,'João Oliveira','111.111.111-11','21999990001','joao@gmail.com'),(2,'Maria Silva','222.222.222-22','21999990002','maria@gmail.com'),(3,'Pedro Costa','333.333.333-33','21999990003','pedro@gmail.com'),(4,'Ana Santos','444.444.444-44','21999990004','ana@gmail.com'),(5,'Lucas Almeida','555.555.555-55','21999990005','lucas@gmail.com'),(6,'Beatriz Lima','666.666.666-66','21999990006','beatriz@gmail.com'),(7,'José Ferreira','777.777.777-77','21999990007','jose@gmail.com'),(8,'Larissa Gomes','888.888.888-88','21999990008','larissa@gmail.com'),(9,'Gabriel Rocha','999.999.999-99','21999990009','gabriel@gmail.com'),(10,'Patricia Martins','101.101.101-10','21999990010','patricia@gmail.com');
/*!40000 ALTER TABLE `hospede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_hospedagem` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_pagamento_hospedagem` (`id_hospedagem`),
  CONSTRAINT `fk_pagamento_hospedagem` FOREIGN KEY (`id_hospedagem`) REFERENCES `hospedagem` (`id_hospedagem`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,450.00,'Cartao Credito','2026-11-18 11:00:00'),(2,2,720.00,'PIX','2026-11-20 11:00:00'),(3,3,300.00,'Dinheiro','2026-11-19 11:00:00'),(4,4,550.00,'Cartao Debito','2026-11-21 11:00:00'),(5,5,480.00,'PIX','2026-11-22 11:00:00'),(6,6,760.00,'Cartao Credito','2026-11-23 11:00:00'),(7,7,680.00,'PIX','2026-11-24 11:00:00'),(8,8,950.00,'Cartao Credito','2026-11-25 11:00:00'),(9,9,1100.00,'Transferencia','2026-11-26 11:00:00'),(10,10,1500.00,'PIX','2026-11-27 11:00:00');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `situacao` varchar(30) NOT NULL,
  PRIMARY KEY (`id_quarto`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_quarto_tipo` (`id_tipo`),
  CONSTRAINT `fk_quarto_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_quarto` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,1,'101','Disponivel'),(2,2,'102','Disponivel'),(3,3,'103','Ocupado'),(4,4,'104','Disponivel'),(5,5,'105','Reservado'),(6,6,'106','Disponivel'),(7,7,'107','Disponivel'),(8,8,'108','Ocupado'),(9,9,'109','Disponivel'),(10,10,'110','Manutencao');
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_hospede` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_entrada` date NOT NULL,
  `data_saida` date NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_reserva_hospede` (`id_hospede`),
  CONSTRAINT `fk_reserva_hospede` FOREIGN KEY (`id_hospede`) REFERENCES `hospede` (`id_hospede`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,'2026-11-01','2026-11-15','2026-11-18','Confirmada'),(2,2,'2026-11-02','2026-11-16','2026-11-20','Confirmada'),(3,3,'2026-11-03','2026-11-17','2026-11-19','Pendente'),(4,4,'2026-11-04','2026-11-18','2026-11-21','Confirmada'),(5,5,'2026-11-05','2026-11-19','2026-11-22','Cancelada'),(6,6,'2026-11-06','2026-11-20','2026-11-23','Confirmada'),(7,7,'2026-11-07','2026-11-21','2026-11-24','Confirmada'),(8,8,'2026-11-08','2026-11-22','2026-11-25','Pendente'),(9,9,'2026-11-09','2026-11-23','2026-11-26','Confirmada'),(10,10,'2026-11-10','2026-11-24','2026-11-27','Confirmada');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_quarto`
--

DROP TABLE IF EXISTS `reserva_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_quarto` (
  `id_reserva` int(11) NOT NULL,
  `id_quarto` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva`,`id_quarto`),
  KEY `fk_rq_quarto` (`id_quarto`),
  CONSTRAINT `fk_rq_quarto` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`),
  CONSTRAINT `fk_rq_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_quarto`
--

LOCK TABLES `reserva_quarto` WRITE;
/*!40000 ALTER TABLE `reserva_quarto` DISABLE KEYS */;
INSERT INTO `reserva_quarto` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `reserva_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_servico`
--

DROP TABLE IF EXISTS `reserva_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_servico` (
  `id_reserva` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva`,`id_servico`),
  KEY `fk_rs_servico` (`id_servico`),
  CONSTRAINT `fk_rs_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `fk_rs_servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_servico`
--

LOCK TABLES `reserva_servico` WRITE;
/*!40000 ALTER TABLE `reserva_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Café da Manhã',35.00),(2,'Almoço',60.00),(3,'Jantar',80.00),(4,'Lavanderia',25.00),(5,'Spa',120.00),(6,'Massagem',150.00),(7,'Academia',30.00),(8,'Room Service',45.00),(9,'Transfer Aeroporto',90.00),(10,'Estacionamento',20.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_quarto` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `valor_diaria` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_quarto`
--

LOCK TABLES `tipo_quarto` WRITE;
/*!40000 ALTER TABLE `tipo_quarto` DISABLE KEYS */;
INSERT INTO `tipo_quarto` VALUES (1,'Standard Solteiro',1,120.00),(2,'Standard Casal',2,180.00),(3,'Luxo Solteiro',1,220.00),(4,'Luxo Casal',2,280.00),(5,'Premium Casal',2,350.00),(6,'Master',3,450.00),(7,'Executivo',2,390.00),(8,'Familiar',4,520.00),(9,'Presidencial',5,900.00),(10,'Suíte Premium',4,650.00),(11,'Standard Solteiro',1,120.00),(12,'Standard Casal',2,180.00),(13,'Luxo Solteiro',1,220.00),(14,'Luxo Casal',2,280.00),(15,'Premium Casal',2,350.00),(16,'Master',3,450.00),(17,'Executivo',2,390.00),(18,'Familiar',4,520.00),(19,'Presidencial',5,900.00),(20,'Suíte Premium',4,650.00);
/*!40000 ALTER TABLE `tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 20:19:01
