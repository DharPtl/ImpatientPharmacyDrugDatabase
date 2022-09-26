/*
*********************************************************************
CP363 Project - Inpatient Pharmacy Drug Database
*********************************************************************
Names:
Daniel Nguyen 201460890
Melina Deiuliis 191845520
Dharmik Patel 180343800
Jagnoor Nijjar 190485190
Spencer McLean 190578980
Daniel Faseyi 190850640
Jacob Schwartz 200255300
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cp363project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cp363project`;

/*Table structure for table `inpatient pharmacy` */

DROP TABLE IF EXISTS `inpatient_pharmacy`;

CREATE TABLE `inpatient_pharmacy` (
  `pharmacy_ID` int(15) NOT NULL,
  `pharmacyName` varchar(50) NOT NULL,
  `pharmacyAddress` varchar(50) NOT NULL,
  `contact_No` varchar(50) NOT NULL,
  PRIMARY KEY (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inpatient_pharmacy` */

insert  into `inpatient_pharmacy`(`pharmacy_ID`,`pharmacyName`,`pharmacyAddress`,`contact_No`) values 
/* Sample data */

(1,'CP363 Pharmacy', '321 Real Street', '9051234567');

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;
/* FINISH PATIENT PART */
CREATE TABLE `patient` (
  `ssn` int(11) NOT NULL,
  `patient_firstName` varchar(50) NOT NULL,
  `patient_lastName` varchar(50) NOT NULL,
  `ohip_No` int(11) NOT NULL,
  `room_No` int(11) NOT NULL,
  `address` varchar(10) NOT NULL,
  `contact_No` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert  into `patient`(`ssn`,`patient_firstName`,`patient_lastName`,`ohip_No`,`room_No`,`address`,`contact_No`) values 

/* Sample patient */

(1, 'Daniel', 'Nguyen', 12345, 11, '123 Fake Street', 1234567890);

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `license_No` int(10) NOT NULL,
  `doctor_firstName` varchar(50) NOT NULL,
  `doctor_lastName` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `contact_no` int(11) NOT NULL,
  PRIMARY KEY (`license_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`license_No`,`doctor_firstName`, `doctor_lastName`, `specialty`,`contact_no`) values 

/*Sample Offices */
(1,'Gregory','House', 'Internal Medicine', 1234567891);

/*Table structure for table `patient_unit` */

DROP TABLE IF EXISTS `patient_unit`;

CREATE TABLE `patient_unit` (
  `unit_ID` int(11) NOT NULL,
  `patient_ID` int(15) NOT NULL,
  `floor` int(15) NOT NULL,
  PRIMARY KEY (`unit_id`, `patient_ID`),
  FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patient_unit` */

insert  into `patient_unit`(`unit_ID`,`patient_ID`,`floor`) values 

/*Sample Order Details */
(1, 1, '1');


/*Table structure for table `pharma_company` */

DROP TABLE IF EXISTS `pharma_company`;

CREATE TABLE `pharma_company` (
  `manufacturer_ID` int(11) NOT NULL,
  `manufacturer_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` int(15) NOT NULL,
  PRIMARY KEY (`manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pharma_company` */

insert  into `pharma_company`(`manufacturer_ID`,`manufacturer_name`,`address`,`contact_no`) values 

/* Sample orders */

(1,'Apotex','1 Fake Street','6471234567');

/*Table structure for table `prescription` */

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `prescription_ID` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `drug_ID` int(15) NOT NULL,
  `strength` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  `refills` int(100) NOT NULL,
  `special_instructions` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `patient_ID` int(15) NOT NULL,
  `doctor_ID` int(15) NOT NULL,
  PRIMARY KEY (`prescription_ID`),
  FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ssn`),
  FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`license_No`),
  FOREIGN KEY (`drug_id`) REFERENCES `drug_item`(`drug_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payments` */

insert  into `prescription`(`prescription_ID`, `d_name`, `drug_ID`, `strength`, `quantity`, `refills`, `special_instructions`, `date`, `patient_ID`, `doctor_ID`) values 

/* Sample payments */

(1,'acetaminophen',1, 5, 5, 5,'Take once daily','2004-10-19', 1,1);

/*Table structure for table `drug_item` */

DROP TABLE IF EXISTS `drug_item`;

CREATE TABLE `drug_item` (
  `drug_ID` int(15) NOT NULL,
  `trade_name` varchar(50) NOT NULL,
  `strength` int(50) NOT NULL,
  `expiry` varchar(20) NOT NULL,
  `drug_description` varchar(50) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  PRIMARY KEY (`drug_ID`),
  FOREIGN KEY (`manufacturer_ID`) REFERENCES `pharma_company` (`manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `drug_item` */

insert  into `drug_item`(`drug_ID`,`trade_name`,`strength`,`expiry`, `manufacturer_id`) values 

(1,'Tylenol', 500, '2023-01-01', 1);

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `contract_ID` int(15) NOT NULL,
  `start_date` date NOT NULL,
  `contract_period` varchar(50) NOT NULL,
  `pharmacy_ID` int(20) NOT NULL,
  `manufacturer_ID` int(10) NOT NULL,
  PRIMARY KEY (`contract_ID`),
  FOREIGN KEY (`manufacturer_ID`) REFERENCES `pharma_company` (`manufacturer_ID`),
  FOREIGN KEY (`pharmacy_ID`) REFERENCES `inpatient_pharmacy` (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `drug_item` */

insert  into `contract`(`start_date`,`contract_period`,`pharmacy_ID`,`manufacturer_ID`) values 

('2022-01-01','Indefinite', 1, '1');

/*Table structure for table `drug_pharmacy` */

DROP TABLE IF EXISTS `drug_pharmacy`;

CREATE TABLE `drug_pharmacy` (
  `drug_ID` int(15) NOT NULL,
  `pharmacy_ID` int(15) NOT NULL,
  `qtyonhand` int(255) NOT NULL,
  PRIMARY KEY (`drug_ID`, `pharmacy_ID`),
  FOREIGN KEY (`drug_ID`) REFERENCES `drug_item` (`drug_ID`),
  FOREIGN KEY (`pharmacy_ID`) REFERENCES `inpatient_pharmacy` (`pharmacy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `drug_pharmacy` */

insert  into `drug_pharmacy`(`drug_ID`,`pharmacy_ID`,`qtyonhand`) values 

(1,1, 999);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
