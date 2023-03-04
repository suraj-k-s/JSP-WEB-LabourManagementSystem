# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_labourmanagement
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2022-03-06 15:01:48
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_labourmanagement'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_labourmanagement" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_labourmanagement";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_uname" varchar(100) NOT NULL,
  "admin_password" varchar(100) NOT NULL,
  "admin_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_uname", "admin_password", "admin_name") VALUES
	(1,'admin@gmail.com','Admin123','Admin');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(11) NOT NULL auto_increment,
  "complainttype_id" int(11) NOT NULL,
  "complaint_content" varchar(100) NOT NULL,
  "complaint_date" varchar(100) NOT NULL,
  "complaint_status" int(11) NOT NULL default '0',
  "user_id" int(11) NOT NULL,
  "complaint_reply" varchar(200) NOT NULL default 'Not Yet Reply',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complainttype_id", "complaint_content", "complaint_date", "complaint_status", "user_id", "complaint_reply") VALUES
	(1,1,'assx','2022-01-21',1,1,'dfadsfd');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(11) NOT NULL auto_increment,
  "complainttype_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_complainttype'
#

LOCK TABLES "tbl_complainttype" WRITE;
/*!40000 ALTER TABLE "tbl_complainttype" DISABLE KEYS;*/
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_name") VALUES
	(1,'Error');
/*!40000 ALTER TABLE "tbl_complainttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(1,'Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(2,'Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(5,'Kollam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(11) NOT NULL auto_increment,
  "feedback_content" varchar(200) NOT NULL,
  "user_id" int(11) NOT NULL,
  "feedback_date" date NOT NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "feedback_date") VALUES
	(1,'sdacasd',1,'2022-01-21');
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_labour'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_labour" (
  "labour_id" int(11) NOT NULL auto_increment,
  "labour_name" varchar(100) NOT NULL,
  "labour_contact" varchar(50) NOT NULL,
  "labour_email" varchar(100) NOT NULL,
  "labour_photo" varchar(100) NOT NULL,
  "labour_address" varchar(200) NOT NULL,
  "labour_password" varchar(100) NOT NULL,
  "town_id" int(11) NOT NULL,
  "worktype_id" int(11) NOT NULL,
  "labour_status" int(11) NOT NULL default '0',
  "labour_proof" varchar(100) NOT NULL,
  "labour_desc" varchar(100) NOT NULL,
  PRIMARY KEY  ("labour_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_labour'
#

LOCK TABLES "tbl_labour" WRITE;
/*!40000 ALTER TABLE "tbl_labour" DISABLE KEYS;*/
REPLACE INTO "tbl_labour" ("labour_id", "labour_name", "labour_contact", "labour_email", "labour_photo", "labour_address", "labour_password", "town_id", "worktype_id", "labour_status", "labour_proof", "labour_desc") VALUES
	(1,'Labour','9874563210','labour@gmail.com','LabourPhoto_1234.png','Labour Address','Labour123',1,1,1,'LabourProof_1477.png','Am a good Labour');
REPLACE INTO "tbl_labour" ("labour_id", "labour_name", "labour_contact", "labour_email", "labour_photo", "labour_address", "labour_password", "town_id", "worktype_id", "labour_status", "labour_proof", "labour_desc") VALUES
	(2,'Rekha K','4734343441','jhfjsdfdsd@hsdfd.com','LabourPhoto_1233.jpg','sadafdsfv
dsfsgfd','Laaa1111',1,1,1,'LabourProof_1793.jpg','fgdfgfdg');
/*!40000 ALTER TABLE "tbl_labour" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(200) NOT NULL,
  "user_rating" int(1) NOT NULL,
  "user_review" text NOT NULL,
  "review_datetime" varchar(100) NOT NULL,
  "labour_id" int(11) NOT NULL,
  PRIMARY KEY  ("review_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_review'
#

LOCK TABLES "tbl_review" WRITE;
/*!40000 ALTER TABLE "tbl_review" DISABLE KEYS;*/
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "labour_id") VALUES
	(2,'gfsag',5,'fasd','2022-01-23 16:07:12',1);
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "labour_id") VALUES
	(3,'sdads',3,'ddsfds','2022-01-23 16:12:02',1);
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "labour_id") VALUES
	(4,'Suraj',4,'good','2022-01-26 20:57:29',2);
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "labour_id") VALUES
	(5,'Suraj',4,'dssdfdssdf','2022-01-26 21:23:43',2);
/*!40000 ALTER TABLE "tbl_review" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_taluk'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_taluk" (
  "taluk_id" int(10) unsigned NOT NULL auto_increment,
  "taluk_name" varchar(50) NOT NULL,
  "district_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("taluk_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_taluk'
#

LOCK TABLES "tbl_taluk" WRITE;
/*!40000 ALTER TABLE "tbl_taluk" DISABLE KEYS;*/
REPLACE INTO "tbl_taluk" ("taluk_id", "taluk_name", "district_id") VALUES
	('1','Thaluk','1');
/*!40000 ALTER TABLE "tbl_taluk" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_town'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_town" (
  "town_id" int(10) unsigned NOT NULL auto_increment,
  "town_name" varchar(50) NOT NULL,
  "taluk_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("town_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_town'
#

LOCK TABLES "tbl_town" WRITE;
/*!40000 ALTER TABLE "tbl_town" DISABLE KEYS;*/
REPLACE INTO "tbl_town" ("town_id", "town_name", "taluk_id") VALUES
	('1','dfvd','1');
/*!40000 ALTER TABLE "tbl_town" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(100) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_email" varchar(100) NOT NULL,
  "user_photo" varchar(100) NOT NULL,
  "user_address" varchar(100) NOT NULL,
  "town_id" int(11) NOT NULL,
  "user_password" varchar(100) NOT NULL,
  "user_status" int(11) NOT NULL default '0',
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_photo", "user_address", "town_id", "user_password", "user_status") VALUES
	(1,'User','9876543210','user@gmail.com','UserPhoto_1597.png','User Address
',1,'User1234',0);
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_workgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workgallery" (
  "workgallery_id" int(11) NOT NULL auto_increment,
  "labour_id" int(11) NOT NULL,
  "workgallery_caption" varchar(100) NOT NULL,
  "workgallery_file" varchar(100) NOT NULL,
  PRIMARY KEY  ("workgallery_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_workgallery'
#

LOCK TABLES "tbl_workgallery" WRITE;
/*!40000 ALTER TABLE "tbl_workgallery" DISABLE KEYS;*/
REPLACE INTO "tbl_workgallery" ("workgallery_id", "labour_id", "workgallery_caption", "workgallery_file") VALUES
	(2,1,'dsd','Gallery_1062.png');
REPLACE INTO "tbl_workgallery" ("workgallery_id", "labour_id", "workgallery_caption", "workgallery_file") VALUES
	(3,2,'ouiytrfutugf','Gallery_1919.jpg');
/*!40000 ALTER TABLE "tbl_workgallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_workpost'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workpost" (
  "workpost_id" int(11) NOT NULL auto_increment,
  "workpost_details" varchar(200) NOT NULL,
  "workpost_date" date NOT NULL,
  "user_id" int(11) NOT NULL default '0',
  "workpost_status" int(11) NOT NULL default '0',
  "labour_id" int(11) NOT NULL,
  "workpost_amount" varchar(100) NOT NULL,
  PRIMARY KEY  ("workpost_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_workpost'
#

LOCK TABLES "tbl_workpost" WRITE;
/*!40000 ALTER TABLE "tbl_workpost" DISABLE KEYS;*/
REPLACE INTO "tbl_workpost" ("workpost_id", "workpost_details", "workpost_date", "user_id", "workpost_status", "labour_id", "workpost_amount") VALUES
	(1,'asddasd','2022-01-17',1,5,1,'10000');
REPLACE INTO "tbl_workpost" ("workpost_id", "workpost_details", "workpost_date", "user_id", "workpost_status", "labour_id", "workpost_amount") VALUES
	(2,'jgdssgs','2022-01-26',1,5,2,'20000');
/*!40000 ALTER TABLE "tbl_workpost" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_workrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workrequest" (
  "workrequest_id" int(11) NOT NULL auto_increment,
  "workrequest_details" varchar(200) NOT NULL,
  "workrequest_date" date NOT NULL,
  "workrequest_status" int(11) NOT NULL default '0',
  "user_id" int(11) NOT NULL,
  "labour_id" int(11) NOT NULL,
  "workrequest_amount" varchar(100) NOT NULL,
  PRIMARY KEY  ("workrequest_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_workrequest'
#

LOCK TABLES "tbl_workrequest" WRITE;
/*!40000 ALTER TABLE "tbl_workrequest" DISABLE KEYS;*/
REPLACE INTO "tbl_workrequest" ("workrequest_id", "workrequest_details", "workrequest_date", "workrequest_status", "user_id", "labour_id", "workrequest_amount") VALUES
	(2,'dfdad','2022-01-21',0,1,1,'12233');
REPLACE INTO "tbl_workrequest" ("workrequest_id", "workrequest_details", "workrequest_date", "workrequest_status", "user_id", "labour_id", "workrequest_amount") VALUES
	(3,'dsdgsfhfxs','2022-01-26',4,1,2,'44654');
/*!40000 ALTER TABLE "tbl_workrequest" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_worktype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_worktype" (
  "worktype_id" int(11) NOT NULL auto_increment,
  "worktype_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("worktype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_worktype'
#

LOCK TABLES "tbl_worktype" WRITE;
/*!40000 ALTER TABLE "tbl_worktype" DISABLE KEYS;*/
REPLACE INTO "tbl_worktype" ("worktype_id", "worktype_name") VALUES
	(1,'Plumper');
/*!40000 ALTER TABLE "tbl_worktype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
