-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.13-rc-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema danish_housing
--

CREATE DATABASE IF NOT EXISTS danish_housing;
USE danish_housing;

--
-- Definition of table `account_master`
--

DROP TABLE IF EXISTS `account_master`;
CREATE TABLE `account_master` (
  `account_master_id` int(11) NOT NULL auto_increment,
  `anx_cd` int(11) default NULL,
  `accode` varchar(45) default NULL,
  `acname` varchar(70) default NULL,
  `address` varchar(100) default NULL,
  `acclass` varchar(45) default NULL,
  `opdte` date default NULL,
  `opbal` double default NULL,
  `mbal` double default NULL,
  `pexp` varchar(45) default NULL,
  `ixpge` varchar(45) default NULL,
  `flag` varchar(45) default NULL,
  `projcd` int(11) default NULL,
  `col1` varchar(45) default NULL,
  `col2` varchar(45) default NULL,
  `col3` varchar(45) default NULL,
  `col4` varchar(45) default NULL,
  `col5` varchar(45) default NULL,
  PRIMARY KEY  (`account_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_master`
--

/*!40000 ALTER TABLE `account_master` DISABLE KEYS */;
INSERT INTO `account_master` (`account_master_id`,`anx_cd`,`accode`,`acname`,`address`,`acclass`,`opdte`,`opbal`,`mbal`,`pexp`,`ixpge`,`flag`,`projcd`,`col1`,`col2`,`col3`,`col4`,`col5`) VALUES 
 (1,1,'A0001','AUDIT FEES PAYABLE','','A','2017-07-28',425,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),
 (2,1,'D0006','DEVELOPMENT COST DANISH NAGAR COLONY','','E','2017-07-28',0,0,'','0 - 2','D',0,NULL,NULL,NULL,NULL,NULL),
 (5,1,'P0014','*PAYABLE-M/S RAKESH AGARWAL','83-A,RAJSHREE APTT. LAL GHATI,BHOPAL.','L','2017-06-30',0,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),
 (6,1,'P0015','*PAYABLE - M/S BALWANT SINGH','181, Ashoka Garden, Bhopal','I','2017-07-03',0,0,'','','S',0,NULL,NULL,NULL,NULL,NULL),
 (10,1,'A0002','AUDIT PAYABLE','','L','2017-07-28',0,9498,'','0-2','D',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_master` ENABLE KEYS */;


--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `account_id` int(10) unsigned NOT NULL auto_increment,
  `co_code` varchar(45) default NULL,
  `bk_code` varchar(45) default NULL,
  `bk_name` varchar(80) default NULL,
  `op_date` date default NULL,
  `op_bal` double default NULL,
  `receipt` double default NULL,
  `payment` double default NULL,
  `cl_bal` double default NULL,
  `ifsc` varchar(45) default NULL,
  `branch` varchar(45) default NULL,
  `col1` varchar(45) default NULL,
  `col2` varchar(45) default NULL,
  `col3` varchar(45) default NULL,
  `col4` varchar(45) default NULL,
  `col5` varchar(45) default NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`account_id`,`co_code`,`bk_code`,`bk_name`,`op_date`,`op_bal`,`receipt`,`payment`,`cl_bal`,`ifsc`,`branch`,`col1`,`col2`,`col3`,`col4`,`col5`) VALUES 
 (1,'cash','001','Cash','2017-01-01',0,0,0,0,' ',' ',NULL,NULL,NULL,NULL,NULL),
 (2,'punjab','PNB23','PNB','2017-06-30',5000,0,0,0,'PNB005','INDRAPURI',NULL,NULL,NULL,NULL,NULL),
 (3,'axis','axis458','Axis','2017-07-08',20000,0,0,1000,'Axis52','Arera',NULL,NULL,NULL,NULL,NULL),
 (4,'dena','654','Dena Bank','2017-07-06',1200000,0,0,0,'dena4563','piplani',NULL,NULL,NULL,NULL,NULL),
 (5,'Christopher','SBI0089','SBI','2017-04-01',45,50,55,60,'SBI1234','Neemuch',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `cheque_pay`
--

DROP TABLE IF EXISTS `cheque_pay`;
CREATE TABLE `cheque_pay` (
  `docno` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `bank_code` varchar(5) NOT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `transaction_no` varchar(45) NOT NULL,
  `payment_amt` double NOT NULL,
  `cl_date` date default NULL,
  `ch_date` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cheque_pay`
--

/*!40000 ALTER TABLE `cheque_pay` DISABLE KEYS */;
INSERT INTO `cheque_pay` (`docno`,`doc_date`,`bank_code`,`payment_mode`,`transaction_no`,`payment_amt`,`cl_date`,`ch_date`) VALUES 
 (1,'2017-08-21','654','Cheque','61616',451,NULL,'2017-08-01'),
 (1,'2017-08-21','654','Cheque','61616',100,NULL,'2017-08-01'),
 (1,'2017-08-21','654','Cheque','61616',100,NULL,'2017-08-01'),
 (5,'2017-08-21','654','Cheque','16516',100,NULL,'2017-08-01'),
 (6,'2017-08-22','654','Cheque','1616146',500,NULL,'2017-08-01'),
 (6,'2017-08-22','654','Cheque','1616146',500,NULL,'2017-08-01'),
 (8,'2017-08-22','654','Cheque','6646',100,NULL,'2017-08-01'),
 (10,'2017-08-24','654','Cheque','56161',500,NULL,'2017-08-01'),
 (13,'2017-08-24','654','Cheque','7777',200,NULL,'2017-08-09'),
 (14,'2017-08-24','654','Cheque','516261',200,NULL,'2017-08-01'),
 (15,'2017-08-24','654','Cheque','56856',200,NULL,'2017-08-01'),
 (16,'2017-08-24','654','Cheque','6545615',200,NULL,'2017-08-01');
/*!40000 ALTER TABLE `cheque_pay` ENABLE KEYS */;


--
-- Definition of table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL auto_increment,
  `membno` int(11) default NULL,
  `projcd` int(5) default NULL,
  `plsize` varchar(45) default NULL,
  `nplsize` double default NULL,
  `reg_cor` varchar(45) default NULL,
  `plno` varchar(45) default NULL,
  `tplno` varchar(45) default NULL,
  `prefix` varchar(8) default NULL,
  `membnme` varchar(45) default NULL,
  `mad1` varchar(100) default NULL,
  `mad2` varchar(100) default NULL,
  `mad3` varchar(45) default NULL,
  `moccu` varchar(45) default NULL,
  `mage` int(3) default NULL,
  `f_h_name` varchar(45) default NULL,
  `f_h_rel` varchar(45) default NULL,
  `nome_rela` varchar(45) default NULL,
  `nome_name` varchar(45) default NULL,
  `membfee` int(11) default NULL,
  `entrfee` int(11) default NULL,
  `recedte` date default NULL,
  `fullpay` varchar(15) default NULL,
  `inst1` varchar(15) default NULL,
  `inst2` varchar(15) default NULL,
  `inst3` varchar(15) default NULL,
  `transf` varchar(55) default NULL,
  `opbal` double default NULL,
  `water_con` double default NULL,
  `sec_dep` double default NULL,
  `wt_cn_dt` date default NULL,
  `opdte` date default NULL,
  `regi` varchar(15) default NULL,
  `regdte` date default NULL,
  `regno` int(11) default NULL,
  `r_c` char(1) default NULL,
  `nocdte` date default NULL,
  `live_dead` char(1) default NULL,
  `refdte` date default NULL,
  `diversion` double default NULL,
  `finalamt` double default NULL,
  `maint` varchar(45) default NULL,
  `water` varchar(45) default NULL,
  `wsupdte` date default NULL,
  `establ` double default NULL,
  `wc_lr_dt` date default NULL,
  `wat_chg` double default NULL,
  `extamt` double default NULL,
  `cost` double default NULL,
  `mobile` varchar(45) default NULL,
  `dob` date default NULL,
  `email` varchar(45) default NULL,
  `photo` varchar(200) default NULL,
  `adressproof` varchar(45) default NULL,
  `aadhar` varchar(45) default NULL,
  `col1` varchar(45) default NULL,
  `col2` varchar(45) default NULL,
  `col3` varchar(45) default NULL,
  `col4` varchar(45) default NULL,
  `userid` int(11) default NULL,
  `lastupdate` datetime default NULL,
  `build_flag` varchar(5) default NULL,
  `m_nominal` varchar(5) default NULL,
  `muta_no1` int(8) default NULL,
  `muta_dt1` date default NULL,
  `gender` varchar(10) default NULL,
  `category` varchar(10) default NULL,
  `defaulter` varchar(5) default NULL,
  `mother_name` varchar(100) default NULL,
  `pan_no` varchar(15) default NULL,
  `eli_ineli` varchar(10) default NULL,
  `ref_amt` double default NULL,
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`member_id`,`membno`,`projcd`,`plsize`,`nplsize`,`reg_cor`,`plno`,`tplno`,`prefix`,`membnme`,`mad1`,`mad2`,`mad3`,`moccu`,`mage`,`f_h_name`,`f_h_rel`,`nome_rela`,`nome_name`,`membfee`,`entrfee`,`recedte`,`fullpay`,`inst1`,`inst2`,`inst3`,`transf`,`opbal`,`water_con`,`sec_dep`,`wt_cn_dt`,`opdte`,`regi`,`regdte`,`regno`,`r_c`,`nocdte`,`live_dead`,`refdte`,`diversion`,`finalamt`,`maint`,`water`,`wsupdte`,`establ`,`wc_lr_dt`,`wat_chg`,`extamt`,`cost`,`mobile`,`dob`,`email`,`photo`,`adressproof`,`aadhar`,`col1`,`col2`,`col3`,`col4`,`userid`,`lastupdate`,`build_flag`,`m_nominal`,`muta_no1`,`muta_dt1`,`gender`,`category`,`defaulter`,`mother_name`,`pan_no`,`eli_ineli`,`ref_amt`) VALUES 
 (1,1,4,'2000 sqft',2000,'reg','PL - 589','s4','Mr.','Christopher Michael Rozario','70','Rajaswa Colony','Neemuch','Student',21,'Robin Rozario','S/O','Friend','Ronak Mittal',500,100,'2017-07-28','N/A','N/A','N/A','N/A','',500,1523,500,'2017-08-08','2017-02-15','Y','2017-08-08',2562,'R','2017-08-08','L','2017-08-08',12,12256,'524','2545','2017-05-20',1562,NULL,0,455,1000000,'9479710111','1996-07-25','christopherrozario7@gmail.com','User1502190551710.png','Voter Id','869124203977',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','N/A','C',0,NULL,'Male','GEN.','N/A','mother name','1234567890','N/A',0),
 (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mr.','Bittu','Neemuch',' ',' ','student',NULL,'Chintu singh','S/O','Friend','Abhishek',500,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9853247898','2017-07-04','bittu@gmail.com','avtar5.jpg','Aadhar card','545454451234',NULL,NULL,NULL,NULL,4,'1996-07-25 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (5000,0,0,'',0,'','','','Mr.','Ramesh Sharma','Mandideep','','Bhopal','Doctor',24,'Mukesh Sharma','S/O','Brother','Rajat Sharma',500,100,'2017-08-10','Y','N/A','N/A','N/A','',0,0,0,'2017-08-16',NULL,'Y','2017-08-16',0,'R','2017-08-16','L','2017-08-16',0,0,'0','',NULL,0,NULL,0,0,0,'9853247898','1993-06-08','ramesh@gmail.com','User1502344785661.png','Passport','',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','NC','N/A',0,NULL,'Male','GEN.','N/A','','','N/A',0),
 (5001,5001,0,'',0,'','','','Mr.','Dhawal kr','piplani','piplani','bhopL','',0,'','S/O','','',500,100,'2017-08-16','N/A','N/A','N/A','N/A','',0,0,0,'2017-08-16',NULL,'N/A','2017-08-16',0,'0','2017-08-16','L','2017-08-16',0,0,'0','',NULL,0,NULL,0,0,0,'','2017-08-16','','','N/A','',NULL,NULL,NULL,NULL,4,'2017-08-16 00:00:00','N/A','N/A',0,NULL,'N/A','N/A','N/A','','','N/A',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


--
-- Definition of table `members_documents`
--

DROP TABLE IF EXISTS `members_documents`;
CREATE TABLE `members_documents` (
  `members_documents_id` int(11) NOT NULL auto_increment,
  `members_documents_title` varchar(45) default NULL,
  `members_documents_details` varchar(45) default NULL,
  `members_documents_file` varchar(45) default NULL,
  `lastupdate` datetime default NULL,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`members_documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members_documents`
--

/*!40000 ALTER TABLE `members_documents` DISABLE KEYS */;
INSERT INTO `members_documents` (`members_documents_id`,`members_documents_title`,`members_documents_details`,`members_documents_file`,`lastupdate`,`userid`) VALUES 
 (1,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),
 (2,'Document Title 2','Document Details 2','Documents File 2','2017-07-04 00:00:00',3),
 (5,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),
 (6,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),
 (7,'Document Title','Document Details','Documents File','2017-07-04 00:00:00',6),
 (8,'New Document Title','New Document Details','sum1499425222065.c','2017-07-07 00:00:00',1),
 (9,'New Document Title 2','New Document Details 2','simple1499425791068.c','2017-07-07 00:00:00',1),
 (10,'New Document Title 3','New Contract Details 3','sum1499425978758.c','2017-07-07 00:00:00',1),
 (11,'New Document Title 4','New Document details 4','STR11499426146882.C','2017-07-07 00:00:00',1),
 (12,'','','IMG_20161013_2051251503582574530.jpg','2017-08-24 00:00:00',1),
 (13,'ID Proof','College Id','IMG_20161013_2051251503582902470.jpg','2017-08-24 00:00:00',1),
 (14,'Membership Form','Test','OCA Result1503650355011.oxps','2017-08-25 00:00:00',1);
/*!40000 ALTER TABLE `members_documents` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `docno` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `bank_code` varchar(5) NOT NULL,
  `payment_mode` varchar(45) NOT NULL,
  `transaction_no` varchar(45) NOT NULL,
  `payment_amt` double NOT NULL,
  `cl_date` date default NULL,
  `ch_date` date default NULL,
  `userid` int(11) NOT NULL,
  `lastupdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` int(10) unsigned NOT NULL auto_increment,
  `project_name` varchar(100) NOT NULL,
  `bung_plot` varchar(10) NOT NULL,
  `opdt` date default NULL,
  `col1` varchar(45) default NULL,
  `col2` varchar(45) default NULL,
  `col3` varchar(45) default NULL,
  `col4` varchar(45) default NULL,
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`project_id`,`project_name`,`bung_plot`,`opdt`,`col1`,`col2`,`col3`,`col4`) VALUES 
 (1,'Project 1','B',NULL,'',NULL,NULL,NULL),
 (3,'Project 2','P',NULL,NULL,NULL,NULL,NULL),
 (4,'Christo Enclave','B','2017-09-27',NULL,NULL,NULL,NULL),
 (5,'Ashoka Complex','P-C','2009-02-03',NULL,NULL,NULL,NULL),
 (6,'Esteem Tower','P',NULL,NULL,NULL,NULL,NULL),
 (7,'Indrapuri residency','B',NULL,NULL,NULL,NULL,NULL),
 (11,'Sonagiri Complex','B',NULL,NULL,NULL,NULL,NULL),
 (12,'piplani','B',NULL,NULL,NULL,NULL,NULL),
 (13,'shela','SC',NULL,NULL,NULL,NULL,NULL),
 (14,'shela','SC',NULL,NULL,NULL,NULL,NULL),
 (15,'Piplani Tower','P-C','2000-07-13',NULL,NULL,NULL,NULL),
 (18,'Christo New','CH','1989-02-24',NULL,NULL,NULL,NULL),
 (20,'Raiku tower','P-C','2017-08-02',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;


--
-- Definition of table `receipt_records`
--

DROP TABLE IF EXISTS `receipt_records`;
CREATE TABLE `receipt_records` (
  `s_no` int(11) NOT NULL,
  `paytype` char(1) default NULL,
  `slno` int(11) default NULL,
  `recdte` date default NULL,
  `receno` int(11) default NULL,
  `prefix` varchar(10) default NULL,
  `membnme` varchar(100) default NULL,
  `membno` int(11) default NULL,
  `f_h_nme` varchar(100) default NULL,
  `mad1` varchar(100) default NULL,
  `mad2` varchar(100) default NULL,
  `mad3` varchar(100) default NULL,
  `amount` double default NULL,
  `balchq` double default NULL,
  `c_dd` varchar(30) default NULL,
  `c_ddte` date default NULL,
  `fullpay` varchar(10) default NULL,
  `inst1` varchar(10) default NULL,
  `inst2` varchar(10) default NULL,
  `inst3` varchar(10) default NULL,
  `chalno` int(11) default NULL,
  `chaldte` date default NULL,
  `plsize` varchar(45) default NULL,
  `plno` varchar(45) default NULL,
  `projcd` int(11) default NULL,
  `chqdhr` varchar(45) default NULL,
  `flag` varchar(5) default NULL,
  `trcode` char(1) default NULL,
  `remarks` varchar(100) default NULL,
  `r_c` char(1) default NULL,
  `p_d` varchar(5) default NULL,
  `accode` varchar(15) default NULL,
  `branch` varchar(100) default NULL,
  `d_c` varchar(25) default NULL,
  `wc_lr_dt` date default NULL,
  `userid` int(11) default NULL,
  `lastupdate` date default NULL,
  `city` varchar(25) default NULL,
  PRIMARY KEY  (`s_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_records`
--

/*!40000 ALTER TABLE `receipt_records` DISABLE KEYS */;
INSERT INTO `receipt_records` (`s_no`,`paytype`,`slno`,`recdte`,`receno`,`prefix`,`membnme`,`membno`,`f_h_nme`,`mad1`,`mad2`,`mad3`,`amount`,`balchq`,`c_dd`,`c_ddte`,`fullpay`,`inst1`,`inst2`,`inst3`,`chalno`,`chaldte`,`plsize`,`plno`,`projcd`,`chqdhr`,`flag`,`trcode`,`remarks`,`r_c`,`p_d`,`accode`,`branch`,`d_c`,`wc_lr_dt`,`userid`,`lastupdate`,`city`) VALUES 
 (109061,'R',1,'2016-04-02',44901,' ',' ',7299,' ',' ',' ',' ',0,0,'0',NULL,'0','0','0','0',0,NULL,'35x60 RC','DK-1/326',8,' ',' ','R','ESTABLISHMENT FEES UPTO 31/03/2016','','O','E0010','A','',NULL,1,'2017-07-27',NULL),
 (109067,'R',1,'2016-04-02',44901,'Mr.','Name',25,'FName','a1','a2','a3',84100,6541,'256',NULL,'No','15','15','15',45,'2017-08-16','35x60','DK-1/326',8,'chqdhr','flag','R','ESTABLISHMENT FEES UPTO 31/03/2016','r','D','E0010','Branch','Checque','2017-08-16',4,'2017-08-16','chhatarpur'),
 (109072,'R',1,'2017-08-18',44902,'Mr.','Christopher Michael Rozario',1,'Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test1','R','S','A0001','Cash','Cash',NULL,1,'2017-08-18',''),
 (109073,'R',2,'2017-08-18',44902,'Mr.','Christopher Michael Rozario',1,'Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 2','R','D','D0006','Cash','Cash',NULL,1,'2017-08-18',''),
 (109074,'R',1,'2017-08-18',44903,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',50,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test2','R','S','A0001','Cash','Cash',NULL,1,'2017-08-18',''),
 (109075,'R',2,'2017-08-18',44903,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test2','R','D','D0006','Cash','Cash',NULL,1,'2017-08-18',''),
 (109076,'R',1,'2017-08-18',44904,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'451164','2017-08-03','N/A','N/A','N/A','Y',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test3','R','S','A0001','Dena Bank','Cheque',NULL,1,'2017-08-18','Bhopal'),
 (109077,'R',1,'2016-04-02',44901,'Mr.','Name',25,'FName','a1','a2','a3',84100,6541,'51361',NULL,'No','','','',45,'2017-08-20','35x60','DK-1/326',8,'chqdhr','flag','R','ESTABLISHMENT FEES UPTO 31/03/2016','r','D','E0010','Branch','Checque','2017-08-20',4,'2017-08-20','chhatarpur'),
 (109078,'R',1,'2017-08-20',44905,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',546,0,'456461','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Maintainaince Charge','R','S','A0001','Sbi  Piplani','Cheque',NULL,1,'2017-08-20','Bhopal'),
 (109079,'R',2,'2017-08-20',44905,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',697,0,'456461','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Development cost ','R','D','D0006','Sbi  Piplani','Cheque',NULL,1,'2017-08-20','Bhopal'),
 (109080,'R',1,'2017-08-21',44906,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',6546,0,'5242424','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Water fee','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109081,'R',2,'2017-08-21',44906,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',431,0,'5242424','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Development cost ','R','D','D0006','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109082,'R',1,'2017-08-21',44907,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',513,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 13','R','S','A0001','','Cash',NULL,1,'2017-08-21',''),
 (109083,'R',1,'2017-08-21',44908,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',54513,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 14','R','S','A0001','','Cash',NULL,1,'2017-08-21',''),
 (109084,'R',1,'2017-08-21',44909,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',1616,0,'57855','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 15','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109085,'R',1,'2017-08-21',44910,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',574,0,'653232','2017-08-02','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 14','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109086,'R',1,'2017-08-21',44911,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',161,0,'546161','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test15','R','D','A0002','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109087,'R',2,'2017-08-21',44911,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',6161,0,'546161','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test15','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-21','Bhopal'),
 (109099,'R',1,'2017-08-22',44912,'Mr.','Ramesh Sharma',0,'S/O Mukesh Sharma','Mandideep','','Bhopal',200,0,'5451','2017-08-01','Y','N/A','N/A','N/A',0,NULL,'','',0,' ',' ','R','Test 16','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-22','Bhopal'),
 (109104,'R',1,'2017-08-22',44913,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'65146165','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 16','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-22','Bhopal'),
 (109105,'R',2,'2017-08-22',44913,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'65146165','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test16','R','S','P0015','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-22','Bhopal'),
 (109108,'R',1,'2017-08-24',44914,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test17','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109109,'R',1,'2017-08-24',44915,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test18','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109110,'R',1,'2017-08-24',44916,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',5200,0,'5666654','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test19','R','S','P0014','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109111,'R',2,'2017-08-24',44916,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',356,0,'5666654','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test19','R','S','P0015','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109112,'R',1,'2017-08-24',44917,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',300,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test21','R','D','A0002','','Cash',NULL,1,'2017-08-24',''),
 (109113,'R',1,'2017-08-24',44918,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test21','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109118,'R',1,'2017-08-24',44919,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',200,0,'1621','2017-08-02','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 21','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109119,'R',2,'2017-08-24',44919,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',300,0,'1621','2017-08-02','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test 21','R','S','P0015','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109122,'R',1,'2017-08-24',44920,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',200,0,'641616','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test22','R','D','D0006','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109123,'R',2,'2017-08-24',44920,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',300,0,'641616','2017-08-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test22','R','S','P0015','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109124,'R',1,'2017-08-24',44921,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test23','R','S','P0014','','Cash',NULL,1,'2017-08-24',''),
 (109125,'R',1,'2017-08-24',44922,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',200,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test24','R','S','P0014','','Cash',NULL,1,'2017-08-24',''),
 (109126,'R',1,'2017-08-24',44923,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test24','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109127,'R',1,'2017-08-24',44924,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',200,0,'164616',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test25','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109128,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',250,0,'88888','2017-08-02','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test25','R','S','P0015','Sector A, Sonagiri','Cheque',NULL,1,'2017-08-24','Bhopal'),
 (109132,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',20,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109133,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',200,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test15','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109134,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',500,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109135,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',20,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109136,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',20,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109137,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',0,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109138,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',0,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109139,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',20,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109140,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',777,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109141,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',2,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109142,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',1,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109143,'R',1,'2017-08-24',44925,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',1,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109144,'R',1,'2017-08-24',44926,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',1,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109145,'R',1,'2017-08-24',44927,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',100,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test26','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109146,'R',1,'2017-08-24',44928,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',10,0,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','','R','S','A0001','','Cash',NULL,1,'2017-08-24',''),
 (109157,'R',1,'2017-08-25',44929,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',0,400,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Transfer1','R','S','A0001','','Transfer',NULL,1,'2017-08-25',''),
 (109158,'R',2,'2017-08-25',44929,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',0,600,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Transfer1','R','D','A0002','','Transfer',NULL,1,'2017-08-25',''),
 (109160,'R',1,'2017-08-25',44930,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',0,50,'',NULL,'N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Transfer','R','S','P0015','','Transfer',NULL,1,'2017-08-25',''),
 (109168,'R',1,'2017-09-01',44931,'Mr.','Christopher Michael Rozario',1,'S/O Robin Rozario','70','Rajaswa Colony','Neemuch',800000,0,'3431354','2017-09-01','N/A','N/A','N/A','N/A',0,NULL,'2000 sqft','PL - 589',4,' ',' ','R','Test','R','S','A0001','Sector A, Sonagiri','Cheque',NULL,1,'2017-09-01','Bhopal');
/*!40000 ALTER TABLE `receipt_records` ENABLE KEYS */;


--
-- Definition of table `refund`
--

DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `paytype` varchar(5) default NULL,
  `memb_no` int(11) default NULL,
  `chqamt` double default NULL,
  `c_dd` varchar(45) default NULL,
  `c_ddte` date default NULL,
  `remarks` varchar(45) default NULL,
  `p_d` varchar(10) default NULL,
  `vr_no` int(11) default NULL,
  `sl_no` int(11) default NULL,
  `mode` varchar(45) default NULL,
  `userid` int(11) default NULL,
  `lastupdate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refund`
--

/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;


--
-- Definition of table `refund_pay`
--

DROP TABLE IF EXISTS `refund_pay`;
CREATE TABLE `refund_pay` (
  `paytype` varchar(5) default NULL,
  `memb_no` int(11) default NULL,
  `amount` double default NULL,
  `c_dd` varchar(45) default NULL,
  `c_ddte` date default NULL,
  `remarks` varchar(45) default NULL,
  `p_d` varchar(10) default NULL,
  `vr_no` int(11) default NULL,
  `sl_no` int(11) default NULL,
  `payment_mode` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refund_pay`
--

/*!40000 ALTER TABLE `refund_pay` DISABLE KEYS */;
INSERT INTO `refund_pay` (`paytype`,`memb_no`,`amount`,`c_dd`,`c_ddte`,`remarks`,`p_d`,`vr_no`,`sl_no`,`payment_mode`) VALUES 
 ('R',1,451,'61616','2017-08-01','Test1','S',1,1,'Cheque'),
 ('R',1,100,'61616','2017-08-01','Test1*','S',1,2,'Cheque'),
 ('R',1,100,'61616','2017-08-01','Test1','S',1,3,'Cheque'),
 (' ',1,200,'',NULL,'Test2','S',2,1,'Cash'),
 (' ',1,300,'',NULL,'Test2','S',2,2,'Cash'),
 ('R',1,500,'',NULL,'Test3','S',3,1,'Cash'),
 ('R',1,400,'',NULL,'Test3','S',3,2,'Cash'),
 ('R',1,100,'',NULL,'Test4','S',4,1,'Cash'),
 ('R',1,100,'',NULL,'Test4','S',4,2,'Cash'),
 ('R',1,100,'16516','2017-08-01','Test6','S',5,1,'Cheque'),
 ('R',1,100,'6646','2017-08-01','fds','S',8,1,'Cheque'),
 ('R',1,500,'56161','2017-08-01','Test8','S',10,1,'Cheque'),
 ('R',1,500,'',NULL,'Test','S',11,1,'Cash'),
 ('R',1,200,'',NULL,'','S',12,1,'Cash'),
 ('R',1,200,'516261','2017-08-01','Twst 9','S',14,1,'Cheque'),
 ('R',1,200,'6545615','2017-08-01','Test11','D',16,1,'Cheque'),
 ('R',1,10,'',NULL,'','S',18,1,'Cash'),
 ('R',1,10,'',NULL,'','S',19,1,'Cash');
/*!40000 ALTER TABLE `refund_pay` ENABLE KEYS */;


--
-- Definition of table `transaction_records`
--

DROP TABLE IF EXISTS `transaction_records`;
CREATE TABLE `transaction_records` (
  `s_no` int(11) NOT NULL auto_increment,
  `docno` int(11) default NULL,
  `slno` int(11) default NULL,
  `docdte` date default NULL,
  `doctype` varchar(45) default NULL,
  `accode` varchar(45) default NULL,
  `bkcode` varchar(45) default NULL,
  `chqno` varchar(30) default NULL,
  `ch_date` date default NULL,
  `bank_br` varchar(45) default NULL,
  `membno` int(11) default NULL,
  `amt` double default NULL,
  `parti` varchar(45) default NULL,
  `a_p` varchar(45) default NULL,
  `flag` int(11) default NULL,
  `vr_no` int(10) unsigned default NULL,
  `sno` varchar(45) default NULL,
  `sr` varchar(45) default NULL,
  `docnoo` varchar(45) default NULL,
  `projcd` int(11) default NULL,
  `wc_lr_dt` date default NULL,
  `ch_cl_dt` date default NULL,
  `c_flag` varchar(45) default NULL,
  `party_cd` int(11) default NULL,
  `userid` int(11) default NULL,
  `lastupdate` date default NULL,
  PRIMARY KEY  (`s_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_records`
--

/*!40000 ALTER TABLE `transaction_records` DISABLE KEYS */;
INSERT INTO `transaction_records` (`s_no`,`docno`,`slno`,`docdte`,`doctype`,`accode`,`bkcode`,`chqno`,`ch_date`,`bank_br`,`membno`,`amt`,`parti`,`a_p`,`flag`,`vr_no`,`sno`,`sr`,`docnoo`,`projcd`,`wc_lr_dt`,`ch_cl_dt`,`c_flag`,`party_cd`,`userid`,`lastupdate`) VALUES 
 (109061,44901,1,NULL,'D','E0010','01','0',NULL,' ',7299,8400,'ESTABLISHMENT FEES UPTO 31/03/2016',' ',1,0,' ',' ',' ',8,NULL,NULL,' ',0,1,'2017-07-27'),
 (109067,44901,1,NULL,'D','E0010','01','0',NULL,' ',7299,8400,'ESTABLISHMENT FEES UPTO 31/03/2016',' ',1,0,' ',' ',' ',8,NULL,NULL,' ',0,1,'2017-08-16'),
 (109072,44902,1,'2017-08-18','D','A0001','001','',NULL,'Cash',1,100,'Test1',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),
 (109073,44902,2,'2017-08-18','D','D0006','001','',NULL,'Cash',1,100,'Test 2',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),
 (109074,44903,1,'2017-08-18','D','A0001','001','',NULL,'Cash',1,50,'Test2',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),
 (109075,44903,2,'2017-08-18','D','D0006','001','',NULL,'Cash',1,100,'Test2',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),
 (109076,44904,1,'2017-08-18','D','A0001','654','451164','2017-08-03','Dena Bank',1,500,'Test3',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-18'),
 (109077,44901,1,NULL,'D','E0010','01','hv',NULL,' ',7299,8400,'ESTABLISHMENT FEES UPTO 31/03/2016',' ',1,0,' ',' ',' ',8,NULL,NULL,' ',0,1,'2017-08-20'),
 (109078,44905,1,'2017-08-20','D','A0001','654','456461','2017-08-01','Sbi  Piplani',1,546,'Maintainaince Charge',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-20'),
 (109079,44905,2,'2017-08-20','D','D0006','654','456461','2017-08-01','Sbi  Piplani',1,697,'Development cost ',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-20'),
 (109080,44906,1,'2017-08-21','D','A0001','654','5242424','2017-08-01','Sector A, Sonagiri',1,6546,'Water fee',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109081,44906,2,'2017-08-21','D','D0006','654','5242424','2017-08-01','Sector A, Sonagiri',1,431,'Development cost ',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109082,44907,1,'2017-08-21','D','A0001','001','',NULL,'',1,513,'Test 13',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109083,44908,1,'2017-08-21','D','A0001','001','',NULL,'',1,54513,'Test 14',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109084,44909,1,'2017-08-21','D','A0001','654','57855','2017-08-01','Sector A, Sonagiri',1,1616,'Test 15',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109085,44910,1,'2017-08-21','D','A0001','654','653232','2017-08-02','Sector A, Sonagiri',1,574,'Test 14',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109086,44911,1,'2017-08-21','D','A0002','654','546161','2017-08-01','Sector A, Sonagiri',1,161,'Test15',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109087,44911,2,'2017-08-21','D','A0001','654','546161','2017-08-01','Sector A, Sonagiri',1,6161,'Test15',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109089,1,1,'2017-08-21','W','P0014','654','61616','2017-08-01',' ',1,451,'Test1',' ',2,1,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109090,1,2,'2017-08-21','W','P0014','654','61616','2017-08-01',' ',1,100,'Test1*',' ',2,1,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109091,1,3,'2017-08-21','W','P0015','654','61616','2017-08-01',' ',1,100,'Test1',' ',2,1,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109092,2,1,'2017-08-21','W','P0015','001','',NULL,' ',1,200,'Test2',' ',1,2,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109093,2,2,'2017-08-21','W','P0014','001','',NULL,' ',1,300,'Test2',' ',1,2,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109094,3,1,'2017-08-21','W','P0015','001','',NULL,' ',1,500,'Test3',' ',1,3,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109095,3,2,'2017-08-21','W','P0014','001','',NULL,' ',1,400,'Test3',' ',1,3,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109096,4,1,'2017-08-21','W','P0015','001','',NULL,' ',1,100,'Test4',' ',1,4,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109097,4,2,'2017-08-21','W','P0014','001','',NULL,' ',1,100,'Test4',' ',1,4,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109098,5,1,'2017-08-21','W','P0015','654','16516','2017-08-01',' ',1,100,'Test6',' ',2,5,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-21'),
 (109099,44912,1,'2017-08-22','D','A0001','654','5451','2017-08-01','Sector A, Sonagiri',5000,200,'Test 16',' ',2,0,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-22'),
 (109101,6,1,'2017-08-22','W','A0002','654','1616146','2017-08-01',' ',0,500,'Salary to AK Raikwar',' ',2,6,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-22'),
 (109102,6,2,'2017-08-22','W','A0002','654','1616146','2017-08-01',' ',0,500,'Salary to Aman Kumar',' ',2,6,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-22'),
 (109103,7,1,'2017-08-22','W','A0001','001','',NULL,' ',0,2000,'Payment to electrician',' ',1,7,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-22'),
 (109104,44913,1,'2017-08-22','D','A0001','654','65146165','2017-08-01','Sector A, Sonagiri',1,500,'Test 16',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-22'),
 (109105,44913,2,'2017-08-22','D','P0015','654','65146165','2017-08-01','Sector A, Sonagiri',1,500,'Test16',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-22'),
 (109106,8,1,'2017-08-22','W','A0001','654','6646','2017-08-01',' ',1,100,'fds',' ',2,8,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-22'),
 (109107,9,1,'2017-08-22','W','A0002','001','',NULL,' ',0,200,'Test',' ',1,9,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-22'),
 (109108,44914,1,'2017-08-24','D','A0001','001','',NULL,'',1,100,'Test17',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109109,44915,1,'2017-08-24','D','A0001','001','',NULL,'',1,100,'Test18',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109110,44916,1,'2017-08-24','D','P0014','654','5666654','2017-08-01','Sector A, Sonagiri',1,5200,'Test19',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109111,44916,2,'2017-08-24','D','P0015','654','5666654','2017-08-01','Sector A, Sonagiri',1,356,'Test19',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109112,44917,1,'2017-08-24','D','A0002','001','',NULL,'',1,300,'Test21',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109113,44918,1,'2017-08-24','D','A0001','001','',NULL,'',1,500,'Test21',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109114,10,1,'2017-08-24','W','A0001','654','56161','2017-08-01',' ',1,500,'Test8',' ',2,10,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109115,11,1,'2017-08-24','W','A0001','001','',NULL,' ',1,500,'Test',' ',1,11,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109116,12,1,'2017-08-24','W','A0001','001','',NULL,' ',1,200,'',' ',1,12,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109117,13,1,'2017-08-24','W','A0001','654','7777','2017-08-09',' ',0,200,'Test9',' ',2,13,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109118,44919,1,'2017-08-24','D','A0001','654','1621','2017-08-02','Sector A, Sonagiri',1,200,'Test 21',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109119,44919,2,'2017-08-24','D','P0015','654','1621','2017-08-02','Sector A, Sonagiri',1,300,'Test 21',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109120,14,1,'2017-08-24','W','A0001','654','516261','2017-08-01',' ',1,200,'Twst 9',' ',2,14,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109121,15,1,'2017-08-24','W','A0001','654','56856','2017-08-01',' ',0,200,'Test 10',' ',2,15,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109122,44920,1,'2017-08-24','D','D0006','654','641616','2017-08-01','Sector A, Sonagiri',1,200,'Test22',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109123,44920,2,'2017-08-24','D','P0015','654','641616','2017-08-01','Sector A, Sonagiri',1,300,'Test22',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109124,44921,1,'2017-08-24','D','P0014','001','',NULL,'',1,500,'Test23',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109125,44922,1,'2017-08-24','D','P0014','001','',NULL,'',1,200,'Test24',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109126,44923,1,'2017-08-24','D','A0001','001','',NULL,'',1,500,'Test24',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109127,44924,1,'2017-08-24','D','A0001','654','164616',NULL,'Sector A, Sonagiri',1,200,'Test25',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109128,44925,1,'2017-08-24','D','P0015','654','88888','2017-08-02','Sector A, Sonagiri',1,250,'Test25',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109129,16,1,'2017-08-24','W','A0002','654','6545615','2017-08-01',' ',1,200,'Test11',' ',2,16,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109130,17,1,'2017-08-24','W','A0001','001','',NULL,' ',0,300,'Test12',' ',1,17,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109131,17,2,'2017-08-24','W','A0002','001','',NULL,' ',0,400,'Test12',' ',1,17,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109132,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,20,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109133,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,200,'Test15',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109134,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,500,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109135,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,20,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109136,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,20,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109137,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,0,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109138,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,0,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109139,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,20,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109140,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,777,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109141,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,2,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109142,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,1,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109143,44925,1,'2017-08-24','D','A0001','001','',NULL,'',1,1,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109144,44926,1,'2017-08-24','D','A0001','001','',NULL,'',1,1,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109145,44927,1,'2017-08-24','D','A0001','001','',NULL,'',1,100,'Test26',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109146,44928,1,'2017-08-24','D','A0001','001','',NULL,'',1,10,'',' ',1,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109147,18,1,'2017-08-24','W','A0001','001','',NULL,' ',1,10,'',' ',1,18,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109148,19,1,'2017-08-24','W','A0001','001','',NULL,' ',1,10,'',' ',1,19,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-24'),
 (109149,19,1,'2017-08-24','W','A0001','001','',NULL,' ',0,0,'',' ',1,19,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109150,20,1,'2017-08-24','W','A0001','001','',NULL,' ',0,0,'',' ',1,20,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109151,20,1,'2017-08-24','W','A0001','001','',NULL,' ',0,0,'',' ',1,20,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109152,21,1,'2017-08-24','W','A0001','001','',NULL,' ',0,10,'',' ',1,21,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-24'),
 (109153,22,1,'2017-08-25','W','P0015','','',NULL,' ',1,500,'Transfer1',' ',3,22,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109154,22,2,'2017-08-25','W','P0014','','',NULL,' ',1,500,'Transfer1',' ',3,22,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109157,44929,1,'2017-08-25','D','A0001','','',NULL,'',1,400,'Transfer1',' ',3,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109158,44929,2,'2017-08-25','D','A0002','','',NULL,'',1,600,'Transfer1',' ',3,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109159,23,1,'2017-08-25','W','A0001','','',NULL,' ',1,50,'Transfer',' ',3,23,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109160,44930,1,'2017-08-25','D','P0015','','',NULL,'',1,50,'Transfer',' ',3,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-08-25'),
 (109161,24,1,'2017-08-28','D','A0001',' ',' ',NULL,' ',0,0,'Journal Transfer1',' ',3,24,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-28'),
 (109162,24,2,'2017-08-28','W','A0002',' ',' ',NULL,' ',0,20,'Journal Transfer1',' ',3,24,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-28'),
 (109163,25,1,'2017-08-28','D','A0001',' ',' ',NULL,' ',0,10,'Journal Transfer2',' ',3,25,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-28'),
 (109164,25,2,'2017-08-28','W','P0014',' ',' ',NULL,' ',0,30,'Journal Transfer2',' ',3,25,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-28'),
 (109165,25,3,'2017-08-28','D','P0014',' ',' ',NULL,' ',0,20,'Journal Transfer2',' ',3,25,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-28'),
 (109166,26,1,'2017-08-31','D','A0001',' ',' ',NULL,' ',0,20,'Transfer 3',' ',3,26,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-31'),
 (109167,26,2,'2017-08-31','W','P0014',' ',' ',NULL,' ',0,20,'Transfer 3',' ',3,26,' ',' ',' ',0,NULL,NULL,' ',0,1,'2017-08-31'),
 (109168,44931,1,'2017-09-01','D','A0001','654','3431354','2017-09-01','Sector A, Sonagiri',1,800000,'Test',' ',2,0,' ',' ',' ',4,NULL,NULL,' ',0,1,'2017-09-01');
/*!40000 ALTER TABLE `transaction_records` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(45) default NULL,
  `designation` varchar(45) default NULL,
  `mobile` varchar(10) default NULL,
  `status` varchar(10) default NULL,
  `doj` date default NULL,
  `dob` date default NULL,
  `photo` varchar(200) default NULL,
  `created_by` varchar(45) default NULL,
  `user_type` varchar(45) default NULL,
  `address` varchar(150) default NULL,
  `col1` varchar(45) default NULL,
  `col2` varchar(45) default NULL,
  `col3` varchar(45) default NULL,
  `col4` varchar(45) default NULL,
  `col5` varchar(45) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`name`,`email`,`password`,`designation`,`mobile`,`status`,`doj`,`dob`,`photo`,`created_by`,`user_type`,`address`,`col1`,`col2`,`col3`,`col4`,`col5`) VALUES 
 (1,'Christopher','christopherrozario7@gmail.com','root','Engineer','9131449948','Active','1996-07-25','2017-06-27','bradley-cooper-547062-1-4021499675147173.jpg','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),
 (2,'Abhishek ','abhishek001.cs@gmail.com','root','Engineer','8962338809','Active','2017-06-27','1996-04-03','avatar5.png','Christopher','Administrator','J.K.Road',NULL,NULL,NULL,NULL,NULL),
 (3,'Avi','avi.1199863@gmail.com','root','Engineer','8827970053','Active','2017-06-27','1996-11-26','avatar5.png','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),
 (4,'Aman','kumaraman334@gmail.com','root','Engineer','8359946369','Active','2017-06-27','1991-01-01','avatar5.png','Christopher','Administrator','J.K.Road',NULL,NULL,NULL,NULL,NULL),
 (5,'Rohit Ahuja','rohitahuja@vedisoft.com','root','Engineer','9893075987','Active','2017-06-27','1991-01-01','avatar5.png','Christopher','Administrator','Govind garden',NULL,NULL,NULL,NULL,NULL),
 (14,'Kriti Sanon','kritisanon@gmail.com','789456123','Tester','9131449948','Active','2017-07-05','1992-07-22','Beautiful-Face-of-Kriti-Sanon-HD-Wallpaper-386x5801501222207946.jpg','Christopher','Administrator','BOMBAY',NULL,NULL,NULL,NULL,NULL),
 (15,'bradley','christo7@gmail.com','123456789','Engineer','9131449948','Active','2017-07-11','2017-07-11','bradley-cooper-547062-1-4021499079725734.jpg','Christopher','Administrator','piplani',NULL,NULL,NULL,NULL,NULL),
 (17,'Aman Modi','amanmodi.cs@gmail.com','root','Engineer','9158965742','Active','2017-07-07','2017-07-07','avatar5.png','Christopher','Administrator','Bhopal',NULL,NULL,NULL,NULL,NULL),
 (18,'Dakota Johnson','dakota7@gmail.com','rootrootroot','Tester','9131449948','Active','2017-08-02','2017-08-01','Dakota-Johnson-Fifty-Shades-Darker-Set-Pictures1502183482176.png','Christopher','Administrator','New York',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
