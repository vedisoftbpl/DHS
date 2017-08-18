CREATE DATABASE  IF NOT EXISTS `danish_housing` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `danish_housing`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: danish_housing
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.12.04.1

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
-- Table structure for table `account_master`
--

DROP TABLE IF EXISTS `account_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_master` (
  `account_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `anx_cd` int(11) DEFAULT NULL,
  `accode` varchar(45) DEFAULT NULL,
  `acname` varchar(70) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `acclass` varchar(45) DEFAULT NULL,
  `opdte` date DEFAULT NULL,
  `opbal` double DEFAULT NULL,
  `mbal` double DEFAULT NULL,
  `pexp` varchar(45) DEFAULT NULL,
  `ixpge` varchar(45) DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  `projcd` int(11) DEFAULT NULL,
  `col1` varchar(45) DEFAULT NULL,
  `col2` varchar(45) DEFAULT NULL,
  `col3` varchar(45) DEFAULT NULL,
  `col4` varchar(45) DEFAULT NULL,
  `col5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_master`
--

LOCK TABLES `account_master` WRITE;
/*!40000 ALTER TABLE `account_master` DISABLE KEYS */;
INSERT INTO `account_master` VALUES (1,1,'A0001','AUDIT FEES PAYABLE','','A','2017-07-28',425,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),(2,1,'D0006','DEVELOPMENT COST DANISH NAGAR COLONY','','E','2017-07-28',0,0,'','0 - 2','D',0,NULL,NULL,NULL,NULL,NULL),(5,1,'P0014','*PAYABLE-M/S RAKESH AGARWAL','83-A,RAJSHREE APTT. LAL GHATI,BHOPAL.','L','2017-06-30',0,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),(6,1,'P0015','*PAYABLE - M/S BALWANT SINGH','181, Ashoka Garden, Bhopal','I','2017-07-03',0,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),(10,1,'A0002','AUDIT PAYABLE','','L','2017-07-28',0,9498,'','0-2','D',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_code` varchar(45) DEFAULT NULL,
  `bk_code` varchar(45) DEFAULT NULL,
  `bk_name` varchar(80) DEFAULT NULL,
  `op_date` date DEFAULT NULL,
  `op_bal` double DEFAULT NULL,
  `receipt` double DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `cl_bal` double DEFAULT NULL,
  `ifsc` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `col1` varchar(45) DEFAULT NULL,
  `col2` varchar(45) DEFAULT NULL,
  `col3` varchar(45) DEFAULT NULL,
  `col4` varchar(45) DEFAULT NULL,
  `col5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cash','001','Cash','2017-01-01',0,0,0,0,' ',' ',NULL,NULL,NULL,NULL,NULL),(2,'punjab','PNB23','PNB','2017-06-30',5000,0,0,0,'PNB005','INDRAPURI',NULL,NULL,NULL,NULL,NULL),(3,'axis','axis458','Axis','2017-07-08',20000,0,0,1000,'Axis52','Arera',NULL,NULL,NULL,NULL,NULL),(4,'dena','654','Dena Bank','2017-07-06',1200000,0,0,0,'dena4563','piplani',NULL,NULL,NULL,NULL,NULL),(5,'Christopher','SBI0089','SBI','2017-04-01',45,50,55,60,'SBI1234','Neemuch',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `membno` int(11) DEFAULT NULL,
  `projcd` int(5) DEFAULT NULL,
  `plsize` varchar(45) DEFAULT NULL,
  `nplsize` double DEFAULT NULL,
  `reg_cor` varchar(45) DEFAULT NULL,
  `plno` varchar(45) DEFAULT NULL,
  `tplno` varchar(45) DEFAULT NULL,
  `prefix` varchar(8) DEFAULT NULL,
  `membnme` varchar(45) DEFAULT NULL,
  `mad1` varchar(100) DEFAULT NULL,
  `mad2` varchar(100) DEFAULT NULL,
  `mad3` varchar(45) DEFAULT NULL,
  `moccu` varchar(45) DEFAULT NULL,
  `mage` int(3) DEFAULT NULL,
  `f_h_name` varchar(45) DEFAULT NULL,
  `f_h_rel` varchar(45) DEFAULT NULL,
  `nome_rela` varchar(45) DEFAULT NULL,
  `nome_name` varchar(45) DEFAULT NULL,
  `membfee` int(11) DEFAULT NULL,
  `entrfee` int(11) DEFAULT NULL,
  `recedte` date DEFAULT NULL,
  `fullpay` varchar(15) DEFAULT NULL,
  `inst1` varchar(15) DEFAULT NULL,
  `inst2` varchar(15) DEFAULT NULL,
  `inst3` varchar(15) DEFAULT NULL,
  `transf` varchar(55) DEFAULT NULL,
  `opbal` double DEFAULT NULL,
  `water_con` double DEFAULT NULL,
  `sec_dep` double DEFAULT NULL,
  `wt_cn_dt` date DEFAULT NULL,
  `opdte` date DEFAULT NULL,
  `regi` varchar(15) DEFAULT NULL,
  `regdte` date DEFAULT NULL,
  `regno` int(11) DEFAULT NULL,
  `r_c` char(1) DEFAULT NULL,
  `nocdte` date DEFAULT NULL,
  `live_dead` char(1) DEFAULT NULL,
  `refdte` date DEFAULT NULL,
  `diversion` double DEFAULT NULL,
  `finalamt` double DEFAULT NULL,
  `maint` varchar(45) DEFAULT NULL,
  `water` varchar(45) DEFAULT NULL,
  `wsupdte` date DEFAULT NULL,
  `establ` double DEFAULT NULL,
  `wc_lr_dt` date DEFAULT NULL,
  `wat_chg` double DEFAULT NULL,
  `extamt` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `adressproof` varchar(45) DEFAULT NULL,
  `aadhar` varchar(45) DEFAULT NULL,
  `col1` varchar(45) DEFAULT NULL,
  `col2` varchar(45) DEFAULT NULL,
  `col3` varchar(45) DEFAULT NULL,
  `col4` varchar(45) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `build_flag` varchar(5) DEFAULT NULL,
  `m_nominal` varchar(5) DEFAULT NULL,
  `muta_no1` int(8) DEFAULT NULL,
  `muta_dt1` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `defaulter` varchar(5) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `pan_no` varchar(15) DEFAULT NULL,
  `eli_ineli` varchar(10) DEFAULT NULL,
  `ref_amt` double DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,4,'2000 sqft',2000,'reg','PL - 589','s4','Mr.','Christopher Michael Rozario','70','Rajaswa Colony','Neemuch','Student',21,'Robin Rozario','S/O','Friend','Ronak Mittal',500,100,'2017-07-28','N/A','N/A','N/A','N/A','',500,1523,500,'2017-08-08','2017-02-15','Y','2017-08-08',2562,'R','2017-08-08','L','2017-08-08',12,12256,'524','2545','2017-05-20',1562,NULL,0,455,1000000,'9479710111','1996-07-25','christopherrozario7@gmail.com','User1502190551710.png','Voter Id','869124203977',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','N/A','C',0,NULL,'Male','GEN.','N/A','mother name','1234567890','N/A',0),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mr.','Bittu','Neemuch',' ',' ','student',NULL,'Chintu singh','S/O','Friend','Abhishek',500,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9853247898','2017-07-04','bittu@gmail.com','avtar5.jpg','Aadhar card','545454451234',NULL,NULL,NULL,NULL,4,'1996-07-25 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5000,0,0,'',0,'','','','Mr.','Ramesh Sharma','Mandideep','','Bhopal','Doctor',24,'Mukesh Sharma','S/O','Brother','Rajat Sharma',500,100,'2017-08-10','Y','N/A','N/A','N/A','',0,0,0,'2017-08-16',NULL,'Y','2017-08-16',0,'R','2017-08-16','L','2017-08-16',0,0,'0','',NULL,0,NULL,0,0,0,'9853247898','1993-06-08','ramesh@gmail.com','User1502344785661.png','Passport','',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','NC','N/A',0,NULL,'Male','GEN.','N/A','','','N/A',0),(5001,5001,0,'',0,'','','','Mr.','Dhawal kr','piplani','piplani','bhopL','',0,'','S/O','','',500,100,'2017-08-16','N/A','N/A','N/A','N/A','',0,0,0,'2017-08-16',NULL,'N/A','2017-08-16',0,'0','2017-08-16','L','2017-08-16',0,0,'0','',NULL,0,NULL,0,0,0,'','2017-08-16','','','N/A','',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','N/A','N/A',0,NULL,'N/A','N/A','N/A','','','N/A',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_documents`
--

DROP TABLE IF EXISTS `members_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_documents` (
  `members_documents_id` int(11) NOT NULL AUTO_INCREMENT,
  `members_documents_title` varchar(45) DEFAULT NULL,
  `members_documents_details` varchar(45) DEFAULT NULL,
  `members_documents_file` varchar(45) DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`members_documents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_documents`
--

LOCK TABLES `members_documents` WRITE;
/*!40000 ALTER TABLE `members_documents` DISABLE KEYS */;
INSERT INTO `members_documents` VALUES (1,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),(2,'Document Title 2','Document Details 2','Documents File 2','2017-07-04 00:00:00',3),(5,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),(6,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),(7,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),(8,'New Document Title','New Document Details','sum1499425222065.c','2017-07-07 00:00:00',1),(9,'New Document Title 2','New Document Details 2','simple1499425791068.c','2017-07-07 00:00:00',1),(10,'New Document Title 3','New Contract Details 3','sum1499425978758.c','2017-07-07 00:00:00',1),(11,'New Document Title 4','New Document details 4','STR11499426146882.C','2017-07-07 00:00:00',1);
/*!40000 ALTER TABLE `members_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `docno` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `bank_code` varchar(5) NOT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `transaction_no` varchar(45) NOT NULL,
  `payment_amt` double NOT NULL,
  `cl_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `bung_plot` varchar(10) NOT NULL,
  `opdt` date DEFAULT NULL,
  `col1` varchar(45) DEFAULT NULL,
  `col2` varchar(45) DEFAULT NULL,
  `col3` varchar(45) DEFAULT NULL,
  `col4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Project 1','B',NULL,'',NULL,NULL,NULL),(3,'Project 2','P',NULL,NULL,NULL,NULL,NULL),(4,'Christo Enclave','B','2017-09-27',NULL,NULL,NULL,NULL),(5,'Ashoka Complex','P-C','2009-02-03',NULL,NULL,NULL,NULL),(6,'Esteem Tower','P',NULL,NULL,NULL,NULL,NULL),(7,'Indrapuri residency','B',NULL,NULL,NULL,NULL,NULL),(11,'Sonagiri Complex','B',NULL,NULL,NULL,NULL,NULL),(12,'piplani','B',NULL,NULL,NULL,NULL,NULL),(13,'shela','SC',NULL,NULL,NULL,NULL,NULL),(14,'shela','SC',NULL,NULL,NULL,NULL,NULL),(15,'Piplani Tower','P-C','2000-07-13',NULL,NULL,NULL,NULL),(18,'Christo New','CH','1989-02-24',NULL,NULL,NULL,NULL),(20,'Raiku tower','P-C','2017-08-02',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_records`
--

DROP TABLE IF EXISTS `receipt_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_records` (
  `s_no` int(11) NOT NULL,
  `paytype` char(1) DEFAULT NULL,
  `slno` int(11) DEFAULT NULL,
  `recdte` date DEFAULT NULL,
  `receno` int(11) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `membnme` varchar(100) DEFAULT NULL,
  `membno` int(11) DEFAULT NULL,
  `f_h_nme` varchar(100) DEFAULT NULL,
  `mad1` varchar(100) DEFAULT NULL,
  `mad2` varchar(100) DEFAULT NULL,
  `mad3` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `balchq` double DEFAULT NULL,
  `c_dd` varchar(30) DEFAULT NULL,
  `c_ddte` date DEFAULT NULL,
  `fullpay` varchar(10) DEFAULT NULL,
  `inst1` varchar(10) DEFAULT NULL,
  `inst2` varchar(10) DEFAULT NULL,
  `inst3` varchar(10) DEFAULT NULL,
  `chalno` int(11) DEFAULT NULL,
  `chaldte` date DEFAULT NULL,
  `plsize` varchar(45) DEFAULT NULL,
  `plno` varchar(45) DEFAULT NULL,
  `projcd` int(11) DEFAULT NULL,
  `chqdhr` varchar(45) DEFAULT NULL,
  `flag` varchar(5) DEFAULT NULL,
  `trcode` char(1) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `r_c` char(1) DEFAULT NULL,
  `p_d` varchar(5) DEFAULT NULL,
  `accode` varchar(15) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `d_c` varchar(25) DEFAULT NULL,
  `wc_lr_dt` date DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `lastupdate` date DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_records`
--

LOCK TABLES `receipt_records` WRITE;
/*!40000 ALTER TABLE `receipt_records` DISABLE KEYS */;
INSERT INTO `receipt_records` VALUES (109061,'R',1,'2016-04-02',44901,' ',' ',7299,' ',' ',' ',' ',0,0,'0',NULL,'0','0','0','0',0,NULL,'35x60 RC','DK-1/326',8,' ',' ','R','ESTABLISHMENT FEES UPTO 31/03/2016','','O','E0010','A','',NULL,1,'2017-07-27',NULL),(109067,'R',1,'2016-04-02',44901,'Mr.','Name',25,'FName','a1','a2','a3',84100,6541,'256',NULL,'No','15','15','15',45,'2017-08-16','35x60','DK-1/326',8,'chqdhr','flag','R','ESTABLISHMENT FEES UPTO 31/03/2016','r','D','E0010','Branch','Checque','2017-08-16',4,'2017-08-16','chhatarpur'),(109072,'R',1,'2017-08-18',44902,'Mr.','Christopher Michael Rozario',1,'Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test1','R','S','A0001','Cash','Cash',NULL,1,'2017-08-18',''),(109073,'R',2,'2017-08-18',44902,'Mr.','Christopher Michael Rozario',1,'Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 2','R','D','D0006','Cash','Cash',NULL,1,'2017-08-18',''),(109074,'R',1,'2017-08-18',44903,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',50,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test2','R','S','A0001','Cash','Cash',NULL,1,'2017-08-18',''),(109075,'R',2,'2017-08-18',44903,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test2','R','D','D0006','Cash','Cash',NULL,1,'2017-08-18',''),(109076,'R',1,'2017-08-18',44904,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'451164','2017-08-03','N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test3','R','S','A0001','Dena Bank','Cheque',NULL,1,'2017-08-18','Bhopal');
/*!40000 ALTER TABLE `receipt_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `paytype` varchar(5) DEFAULT NULL,
  `memb_no` int(11) DEFAULT NULL,
  `chqamt` double DEFAULT NULL,
  `c_dd` varchar(45) DEFAULT NULL,
  `c_ddte` date DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `p_d` varchar(10) DEFAULT NULL,
  `vr_no` int(11) DEFAULT NULL,
  `sl_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_records`
--

DROP TABLE IF EXISTS `transaction_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_records` (
  `s_no` int(11) NOT NULL AUTO_INCREMENT,
  `docno` int(11) DEFAULT NULL,
  `slno` int(11) DEFAULT NULL,
  `docdte` date DEFAULT NULL,
  `doctype` varchar(45) DEFAULT NULL,
  `accode` varchar(45) DEFAULT NULL,
  `bkcode` varchar(45) DEFAULT NULL,
  `chqno` varchar(30) DEFAULT NULL,
  `ch_date` date DEFAULT NULL,
  `bank_br` varchar(45) DEFAULT NULL,
  `membno` int(11) DEFAULT NULL,
  `amt` double DEFAULT NULL,
  `parti` varchar(45) DEFAULT NULL,
  `a_p` varchar(45) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `vr_no` varchar(45) DEFAULT NULL,
  `sno` varchar(45) DEFAULT NULL,
  `sr` varchar(45) DEFAULT NULL,
  `docnoo` varchar(45) DEFAULT NULL,
  `projcd` int(11) DEFAULT NULL,
  `wc_lr_dt` date DEFAULT NULL,
  `ch_cl_dt` date DEFAULT NULL,
  `c_flag` varchar(45) DEFAULT NULL,
  `party_cd` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `lastupdate` date DEFAULT NULL,
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB AUTO_INCREMENT=109079 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_records`
--

LOCK TABLES `transaction_records` WRITE;
/*!40000 ALTER TABLE `transaction_records` DISABLE KEYS */;
INSERT INTO `transaction_records` VALUES (109061,44901,1,NULL,'D','E0010','01','0',NULL,' ',7299,8400,'ESTABLISHMENT FEES UPTO 31/03/2016',' ',1,' ',' ',' ',' ',8,NULL,NULL,' ',0,1,'2017-07-27'),(109067,44901,1,NULL,'D','E0010','01','0',NULL,' ',7299,8400,'ESTABLISHMENT FEES UPTO 31/03/2016',' ',1,' ',' ',' ',' ',8,NULL,NULL,' ',0,1,'2017-08-16'),(109072,44902,1,'2017-08-18','D','A0001','001','',NULL,'Cash',1,100,'Test1',' ',1,' ',' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),(109073,44902,2,'2017-08-18','D','D0006','001','',NULL,'Cash',1,100,'Test 2',' ',1,' ',' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),(109074,44903,1,'2017-08-18','D','A0001','001','',NULL,'Cash',1,50,'Test2',' ',1,' ',' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),(109075,44903,2,'2017-08-18','D','D0006','001','',NULL,'Cash',1,100,'Test2',' ',1,' ',' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),(109076,44904,1,'2017-08-18','D','A0001','654','451164','2017-08-03','Dena Bank',1,500,'Test3',' ',2,' ',' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18');
/*!40000 ALTER TABLE `transaction_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `col1` varchar(45) DEFAULT NULL,
  `col2` varchar(45) DEFAULT NULL,
  `col3` varchar(45) DEFAULT NULL,
  `col4` varchar(45) DEFAULT NULL,
  `col5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Christopher','christopherrozario7@gmail.com','root','Engineer','9131449948','Active','1996-07-25','2017-06-27','bradley-cooper-547062-1-4021499675147173.jpg','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),(2,'Abhishek ','abhishek001.cs@gmail.com','root','Engineer','8962338809','Active','2017-06-27','1996-04-03','avatar5.png','Christopher','Administrator','J.K.Road',NULL,NULL,NULL,NULL,NULL),(3,'Avi','avi.1199863@gmail.com','root','Engineer','8827970053','Active','2017-06-27','1996-11-26','avatar5.png','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),(4,'Aman','kumaraman334@gmail.com','root','Engineer','8359946369','Active','2017-06-27','1991-01-01','avatar5.png','Christopher','Administrator','J.K.Road',NULL,NULL,NULL,NULL,NULL),(5,'Rohit Ahuja','rohitahuja@vedisoft.com','root','Engineer','9893075987','Active','2017-06-27','1991-01-01','avatar5.png','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),(14,'Kriti Sanon','kritisanon@gmail.com','789456123','Tester','9131449948','Active','2017-07-05','1992-07-22','Beautiful-Face-of-Kriti-Sanon-HD-Wallpaper-386x5801501222207946.jpg','Christopher','Administrator','BOMBAY',NULL,NULL,NULL,NULL,NULL),(15,'bradley','christo7@gmail.com','123456789','Engineer','9131449948','Active','2017-07-11','2017-07-11','bradley-cooper-547062-1-4021499079725734.jpg','Christopher','Administrator','piplani',NULL,NULL,NULL,NULL,NULL),(17,'Aman Modi','amanmodi.cs@gmail.com','root','Engineer','9158965742','Active','2017-07-07','2017-07-07','avatar5.png','Christopher','Administrator','Bhopal',NULL,NULL,NULL,NULL,NULL),(18,'Dakota Johnson','dakota7@gmail.com','rootrootroot','Tester','9131449948','Active','2017-08-02','2017-08-01','Dakota-Johnson-Fifty-Shades-Darker-Set-Pictures1502183482176.png','Christopher','Administrator','New York',NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2017-08-18 14:05:38
