CREATE  TABLE `irronew`.`ITEM` (
  `ITEM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_TYPE` varchar(1) NOT NULL,
  `TITLE` varchar(100) NOT NULL DEFAULT '',
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `SHORT_DESC` text,
  `LONG_DESC` text,
  `IS_SLIDER` boolean default False,
  `SLIDER_IMG_NAME` tinytext,
  `FILE_PATH` tinytext,
  PRIMARY KEY (`ITEM_TYPE`,`TITLE`),
  UNIQUE KEY `ITEM_ID_UNIQUE` (`ITEM_ID`))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
  
   
 CREATE  TABLE `irronew`.`user` ( 
  `USR_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USR_CODE` varchar(100) NOT NULL,
  `USR_NAME` varchar(100) NOT NULL DEFAULT '',
  `USR_SUR_NAME` varchar(100),
  `USR_EMAIL` varchar(100) NOT NULL,
  `USR_PASSWORD` varchar(100) NOT NULL,
  `ADDRESS` varchar(100),
  `PHONE_NUMBER` int(10) DEFAULT NULL,
  `USR_REGISTRATION_DATE` date DEFAULT NULL,
  `IS_ACTIVE` boolean default False,
  `MAX_UPLOAD_FILE_SIZE` int(10),
  PRIMARY KEY (`USR_ID`),
  UNIQUE KEY `USR_CODE_UNIQUE` (`USR_CODE`),
  UNIQUE KEY `USR_EMAIL_UNIQUE` (`USR_EMAIL`))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`user_group` (
  `GRP_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GRP_COD` varchar(100),
  `GRP_NAME` varchar(100),
  `IS_ACTIVE` boolean default True, 
  `CREATION_DATE` date default NULL, 
  PRIMARY KEY (`GRP_ID`),
   UNIQUE KEY `GRP_COD_UNIQUE` (`GRP_COD`)
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USR_ID` int(10) unsigned NOT NULL,
  `PERMISSION_NAME` varchar(100) NOT NULL DEFAULT '',
  `PERMISSION_TYPE` int(10),  
  PRIMARY KEY (`ID`),  
  FOREIGN KEY (USR_ID) REFERENCES user(USR_ID))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`activity` (
  `ACTIVITY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`contest` (
  `CONTEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  `LEARNER` varchar(255) DEFAULT NULL,
  `ORG` varchar(255) DEFAULT NULL,
  `REGIONAL` varchar(255) DEFAULT NULL,
  `STAFF` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CONTEST_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`educational_activity` (
  `CONTEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATALOG` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CONTRACT` varchar(255) DEFAULT NULL,
  `PLAN` varchar(255) DEFAULT NULL,
  `TYP` int(11) DEFAULT NULL,
  `TYP_NAM` varchar(255) DEFAULT NULL,
  `YRLY_SCHD` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CONTEST_ID`),
  KEY `FKB2D2101B2C71A420` (`ACTIVITY_ID`),
  CONSTRAINT `FKB2D2101B2C71A420` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `activity` (`ACTIVITY_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`olympics` (
  `OLYM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ALL_RUS` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `SCHL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OLYM_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`certificate` (
  `CE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CE_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`employee` (
  `EMP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  `INFO` varchar(255) DEFAULT NULL,
  `MATERIAL` varchar(255) DEFAULT NULL,
  `REG_DOCUMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


CREATE TABLE `irronew`.`graduate` (
  `EMP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ANALYTICS` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `REG_DOCUMENT` varchar(255) DEFAULT NULL,
  `STATS` varchar(255) DEFAULT NULL,
  `TYP` int(11) DEFAULT NULL,
  `TYP_NAME` varchar(255) DEFAULT NULL,
  `CE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `FK34034D4B29334C1D` (`CE_ID`),
  CONSTRAINT `FK34034D4B29334C1D` FOREIGN KEY (`CE_ID`) REFERENCES `certificate` (`CE_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`branch_office` (
  `BRANCH_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KAMYSHLOV` varchar(255) DEFAULT NULL,
  `KRA` varchar(255) DEFAULT NULL,
  `MAIN_BRANCH` varchar(255) DEFAULT NULL,
  `NIZHNY` varchar(255) DEFAULT NULL,
  `SEROV` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BRANCH_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`document` (
  `DOC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONSTI` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `MEASURES` varchar(255) DEFAULT NULL,
  `LAW_REG` varchar(255) DEFAULT NULL,
  `LIC` varchar(255) DEFAULT NULL,
  `EDU_SERV` varchar(255) DEFAULT NULL,
  `SUP_BOARD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`institute` (
  `INST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTACT` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `HISTO` varchar(255) DEFAULT NULL,
  `JOBS` varchar(255) DEFAULT NULL,
  `LOGISTIC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INST_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`institute_details` (
  `DOC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BIB` varchar(255) DEFAULT NULL,
  `CONSTI` varchar(255) DEFAULT NULL,
  `CONTACT` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `EDU_ACT` varchar(255) DEFAULT NULL,
  `EXH_CAL` varchar(255) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `MATERIAL` varchar(255) DEFAULT NULL,
  `NEWS` varchar(255) DEFAULT NULL,
  `PUB` varchar(255) DEFAULT NULL,
  `REVIEW` varchar(255) DEFAULT NULL,
  `SEMINAR` varchar(255) DEFAULT NULL,
  `SHELTER` varchar(255) DEFAULT NULL,
  `TYP` int(11) DEFAULT NULL,
  `TYP_NAME` varchar(255) DEFAULT NULL,
  `LINKS` varchar(255) DEFAULT NULL,
  `INST_ID` bigint(20) DEFAULT NULL,/** We must make not null **/
  PRIMARY KEY (`DOC_ID`),
  KEY `FK262129D898EE2B2D` (`INST_ID`),
  CONSTRAINT `FK262129D898EE2B2D` FOREIGN KEY (`INST_ID`) REFERENCES `institute` (`INST_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`rector` (
  `RECT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  `MEDIA_REPO` varchar(255) DEFAULT NULL,
  `PHOTO_GAL` varchar(255) DEFAULT NULL,
  `PUBLIC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RECT_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`news` (
  `NEWS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ANNOUNCEMENT` varchar(255) DEFAULT NULL,
  `ARCHIVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NEWS_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`basic` (
  `BASIC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BASIC_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`continuing_education` (
  `CE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PLAN` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `NEWS` varchar(255) DEFAULT NULL,
  `SUPPORT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CE_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


CREATE TABLE `irronew`.`project` (
  `PROJECT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`sverdlovsl` (
  `SV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHILDREN` varchar(255) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `EDUCATION` varchar(255) DEFAULT NULL,
  `INSTITUTION` varchar(255) DEFAULT NULL,
  `OPTIONAL` varchar(255) DEFAULT NULL,
  `SCHOOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SV_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE `irronew`.`event` (
  `DATE` datetime DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`EVENT_ID`)
) DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`FILE_ARTICLE` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default False,  
  PRIMARY KEY (`FILE_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


ALTER TABLE `irronew`.`document` ADD COLUMN `INST_ID` BIGINT(20) NOT NULL  AFTER `SUP_BOARD` 
, ADD UNIQUE INDEX `INST_ID_UNIQUE` (`INST_ID` ASC) ;

ALTER TABLE `irronew`.`branch_office` ADD COLUMN `INST_ID` BIGINT(20) NOT NULL  AFTER `SEROV` 
, ADD UNIQUE INDEX `INST_ID_UNIQUE` (`INST_ID` ASC) ;

ALTER TABLE `irronew`.`rector` ADD COLUMN `INST_ID` BIGINT(20) NOT NULL  AFTER `PUBLIC` 
, ADD UNIQUE INDEX `INST_ID_UNIQUE` (`INST_ID` ASC) ;

ALTER TABLE `irronew`.`basic` ADD COLUMN `PROJECT_ID` BIGINT(20) NOT NULL  AFTER `CONTENT` 
, ADD UNIQUE INDEX `PROJECT_ID_UNIQUE` (`PROJECT_ID` ASC) ;

ALTER TABLE `irronew`.`continuing_education` ADD COLUMN `PROJECT_ID` BIGINT(20) NOT NULL  AFTER `SUPPORT` 
, ADD UNIQUE INDEX `PROJECT_ID_UNIQUE` (`PROJECT_ID` ASC) ;

ALTER TABLE `irronew`.`sverdlovsl` ADD COLUMN `PROJECT_ID` BIGINT(20) NOT NULL  AFTER `SCHOOL` 
, ADD UNIQUE INDEX `PROJECT_ID_UNIQUE` (`PROJECT_ID` ASC) ;

ALTER TABLE `irronew`.`employee` ADD COLUMN `CE_ID` BIGINT(20) NOT NULL  AFTER `REG_DOCUMENT` 
, ADD UNIQUE INDEX `CE_ID_UNIQUE` (`CE_ID` ASC) ;

ALTER TABLE `irronew`.`contest` ADD COLUMN `ACTIVITY_ID` BIGINT(20) NOT NULL  AFTER `STAFF` 
, ADD UNIQUE INDEX `ACTIVITY_ID_UNIQUE` (`ACTIVITY_ID` ASC) ;

ALTER TABLE `irronew`.`olympics` ADD COLUMN `ACTIVITY_ID` BIGINT(20) NOT NULL  AFTER `SCHL` 
, ADD UNIQUE INDEX `ACTIVITY_ID_UNIQUE` (`ACTIVITY_ID` ASC) ;


ALTER TABLE `irronew`.`branch_office` ADD COLUMN `CONTENT` VARCHAR(255) NULL  AFTER `INST_ID` ;

ALTER TABLE `irronew`.`news` ADD COLUMN `CONTENT` VARCHAR(255) NULL  AFTER `ARCHIVE` ;


ALTER TABLE `irronew`.`activity` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL;

ALTER TABLE `irronew`.`basic` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`branch_office` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`certificate` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`contest` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`continuing_education` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`document` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`educational_activity` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`employee` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`graduate` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`institute` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`institute_details` CHANGE COLUMN `CONTENT` `CONTENT`  MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`news` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`olympics` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`project` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`rector` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`sverdlovsl` CHANGE COLUMN `CONTENT` `CONTENT` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;




ALTER TABLE `irronew`.`institute_details` CHANGE COLUMN `CONSTI` `CONSTI` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;

ALTER TABLE `irronew`.`institute_details` CHANGE COLUMN `NEWS` `NEWS` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL  ;
