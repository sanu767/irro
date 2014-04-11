CREATE  TABLE `irronew`.`MENU_INFO` (
  `MENU_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `PARENT_ID` int(10),
  `REF_ARTICLE_ID` int(10), 
  `DOC_LOCATION` varchar(100) NOT NULL, 
  PRIMARY KEY (`MENU_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`ITEM` (
  `ITEM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT '',
  `CONTENT` longtext,
  `IS_SLIDER` boolean default False,
  `SLIDER_IMAGE` varchar(100),
  `IS_SHOW_HOME` boolean default False,
  `URL` varchar(100) DEFAULT '', 
   PRIMARY KEY (`ITEM_ID`))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`NEWS` (
  `NEWS_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT '',
  `CONTENT` longtext,
  `IS_SLIDER` boolean default False,
  `SLIDER_IMAGE` varchar(100),
  `IS_SHOW_HOME` boolean default False,
  `REF_ARTICLE_ID` int(10) DEFAULT NULL,
  `URL` varchar(100) DEFAULT '', 
   PRIMARY KEY (`NEWS_ID`))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`EVENT` (
  `EVENT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT '',
  `CONTENT` longtext,
  `IS_SLIDER` boolean default False,
  `SLIDER_IMAGE` varchar(100),
  `IS_SHOW_HOME` boolean default False,
  `URL` varchar(100) DEFAULT '', 
   PRIMARY KEY (`EVENT_ID`))
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`ARTICLE` ( 
  `ARTICLE_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL DEFAULT '',
  `CONTENT` longtext,
  `MODIFICATION_DATE` date DEFAULT NULL,
  `REF_ARTICLE_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ARTICLE_ID`)
)DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`ARTICLE_ATTACHMENT` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default False,  
  `ARTICLE_ID` int(11) unsigned NOT NULL,  
  PRIMARY KEY (`FILE_ID`),  
  FOREIGN KEY (ARTICLE_ID) REFERENCES ARTICLE(ARTICLE_ID))
  DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`NEWS_ATTACHMENT` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default False,  
  `NEWS_ID` int(11) unsigned NOT NULL,  
  PRIMARY KEY (`FILE_ID`),  
  FOREIGN KEY (NEWS_ID) REFERENCES NEWS(NEWS_ID))
  DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`EVENT_ATTACHMENT` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default False,  
  `EVENT_ID` int(11) unsigned NOT NULL,  
  PRIMARY KEY (`FILE_ID`),  
  FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID))
  DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`ITEM_ATTACHMENT` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default False,  
  `ITEM_ID` int(11) unsigned NOT NULL,  
  PRIMARY KEY (`FILE_ID`),  
  FOREIGN KEY (ITEM_ID) REFERENCES ITEM(ITEM_ID))
  DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE  TABLE `irronew`.`MENU_ATTACHMENT` (
  `FILE_ID`   bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TYPE` varchar(255) NOT NULL,
  `LOCATION`  varchar(255) DEFAULT NULL,
  `IS_ACTIVE` boolean default True,
  `IS_EXTERNAL` boolean default False,
  `MODIFICATION_DATE` date DEFAULT NULL,
  `REF_MENU_ID` int(11) unsigned NOT NULL,  
  PRIMARY KEY (`FILE_ID`))
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

/*
-- Query: SELECT * FROM IRRONEW.MENU_INFO
LIMIT 0, 1000

-- Date: 2014-04-07 10:12
*/
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (5,'Activities',NULL,2,'/Activities/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (4,'Institute',NULL,1,'/Institute/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (6,'Certification',NULL,3,'/Certification/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (7,'Projects',NULL,4,'/Projects/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (8,'News',NULL,5,'/News/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (9,'MainContacts',NULL,6,'/MainContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (10,'Hotel',NULL,7,'/Hotel/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (11,'OnlineResources',NULL,8,'/OnlineResources/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (12,'Rector',4,9,'/Institute/Rector/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (13,'Documents',4,10,'/Institute/Documents/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (14,'Management',4,11,'/Institute/Management/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (15,'History',4,12,'/Institute/History/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (16,'Logistics',4,13,'/Institute/Logistics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (17,'Jobs',4,14,'/Institute/Jobs/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (18,'Departments',4,15,'/Institute/Departments/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (19,'Centers',4,16,'/Institute/Centers/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (20,'Divisions',4,17,'/Institute/Divisions/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (21,'BranchOffice',4,18,'/Institute/BranchOffice/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (22,'EducationalActivities',5,19,'/Activities/EducationalActivities/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (23,'Conference',5,20,'/Activities/Conference/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (24,'Contests',5,21,'/Activities/Contests/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (25,'Olympics',5,22,'/Activities/Olympics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (26,'Employees',6,23,'/Certification/Employees/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (27,'Graduates',6,24,'/Certification/Graduates/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (28,'Sverdlovsk',7,25,'/Projects/Sverdlovsk/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (29,'Basic',7,26,'/Projects/Basic/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (30,'DepartmentsPhilosophy',18,27,'/Departments/DepartmentsPhilosophy/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (31,'DepartmentsPsychology',18,28,'/Departments/DepartmentsPsychology/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (32,'DepartmentsChildren',18,29,'/Departments/DepartmentsChildren/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (33,'DepartmentsScience',18,30,'/Departments/DepartmentsScience/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (34,'DepartmentsVocational',18,31,'/Departments/DepartmentsVocational/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (35,'DepartmentsHumanities',18,32,'/Departments/DepartmentsHumanities/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (36,'DepartmentsPhilological',18,33,'/Departments/DepartmentsPhilological/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (37,'DepartmentsIT',18,34,'/Departments/DepartmentsIT/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (38,'DepartmentsSocioScientific',18,35,'/Departments/DepartmentsSocioScientific/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (39,'DepartmentsCabinet',18,36,'/Departments/DepartmentsCabinet/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (40,'CentersInformation',19,37,'/Centers/CentersInformation/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (41,'CentersRegional',19,38,'/Centers/CentersRegional/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (42,'CentersEducationSystem',19,39,'/Centers/CentersEducationSystem/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (43,'CentersLibrary',19,40,'/Centers/CentersLibrary/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (44,'CentersAdministration',19,41,'/Centers/CentersAdministration/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (45,'CentersRobotics',19,42,'/Centers/CentersRobotics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (46,'DivisionsEscort',20,43,'/Divisions/DivisionsEscort/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (47,'DivisionsEditorial',20,44,'/Divisions/DivisionsEditorial/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (48,'DivisionsCustomerEvaluation',20,45,'/Divisions/DivisionsCustomerEvaluation/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (49,'DivisionsPostUniversity',20,46,'/Divisions/DivisionsPostUniversity/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (50,'DivisionsTechSupport',20,47,'/Divisions/DivisionsTechSupport/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (51,'DivisionsLaw',20,48,'/Divisions/DivisionsLaw/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (52,'DivisionsOrganization',20,49,'/Divisions/DivisionsOrganization/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (53,'BranchOfficeNizhny',21,50,'/BranchOffice/BranchOfficeNizhny/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (54,'BranchOfficeKamyshlov',21,51,'/BranchOffice/BranchOfficeKamyshlov/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (55,'BranchOfficeKrasnoufimsk',21,52,'/BranchOffice/BranchOfficeKrasnoufimsk/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (56,'BranchOfficeSerov',21,53,'/BranchOffice/BranchOfficeSerov/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (57,'EducationalActivitiesDevelopment',22,54,'/EducationalActivities/EducationalActivitiesDevelopment/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (58,'EducationalActivitiesRetraining',22,55,'/EducationalActivities/EducationalActivitiesRetraining/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (59,'EducationalActivitiesInternship',22,56,'/EducationalActivities/EducationalActivitiesInternship/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (60,'EducationalActivitiesDistanceLearning',22,57,'/EducationalActivities/EducationalActivitiesDistanceLearning/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (61,'EducationalActivitiesExtrabudgetary',22,58,'/EducationalActivities/EducationalActivitiesExtrabudgetary/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (62,'EducationalActivitiesSeminar',22,59,'/EducationalActivities/EducationalActivitiesSeminar/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (63,'ConferenceInternational',23,60,'/Conference/ConferenceInternational/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (64,'ConferenceRussia',23,61,'/Conference/ConferenceRussia/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (65,'ConferenceRegional',23,62,'/Conference/ConferenceRegional/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (66,'ConferenceOblastnyye',23,63,'/Conference/ConferenceOblastnyye/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (67,'ContestsStaff',24,64,'/Contests/ContestsStaff/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (68,'ContestsOrganization',24,65,'/Contests/ContestsOrganization/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (69,'ContestsLearner',24,66,'/Contests/ContestsLearner/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (70,'OlympicsAllRussia',25,67,'/Olympics/OlympicsAllRussia/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (71,'OlympicsSchool',25,68,'/Olympics/OlympicsSchool/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (72,'EmployeesRegulatoryDocument',26,69,'/Employees/EmployeesRegulatoryDocument/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (73,'EmployeesInformation',26,70,'/Employees/EmployeesInformation/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (74,'EmployeesMaterial',26,71,'/Employees/EmployeesMaterial/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (75,'GraduatesJEG',27,72,'/Graduates/GraduatesJEG/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (76,'GraduatesEGE',27,73,'/Graduates/GraduatesEGE/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (77,'SverdlovskOptional',28,74,'/Sverdlovsk/SverdlovskOptional/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (78,'SverdlovskInstitutions',28,75,'/Sverdlovsk/SverdlovskInstitutions/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (79,'SverdlovskChildren',28,76,'/Sverdlovsk/SverdlovskChildren/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (80,'SverdlovskRuralSchool',28,77,'/Sverdlovsk/SverdlovskRuralSchool/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (81,'SverdlovskModernEducation',28,78,'/Sverdlovsk/SverdlovskModernEducation/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (82,'DepartmentsPhilosophyConstitution',30,79,'/DepartmentsPhilosophy/DepartmentsPhilosophyConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (83,'DepartmentsPhilosophyNews',30,80,'/DepartmentsPhilosophy/DepartmentsPhilosophyNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (84,'DepartmentsPhilosophyMaterials',30,81,'/DepartmentsPhilosophy/DepartmentsPhilosophyMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (85,'DepartmentsPhilosophyContacts',30,82,'/DepartmentsPhilosophy/DepartmentsPhilosophyContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (86,'DepartmentsPsychologyConstitution',31,83,'/DepartmentsPsychology/DepartmentsPsychologyConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (87,'DepartmentsPsychologyNews',31,84,'/DepartmentsPsychology/DepartmentsPsychologyNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (88,'DepartmentsPsychologyMaterials',31,85,'/DepartmentsPsychology/DepartmentsPsychologyMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (89,'DepartmentsPsychologyReviews',31,86,'/DepartmentsPsychology/DepartmentsPsychologyReviews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (90,'DepartmentsPsychologyContacts',31,87,'/DepartmentsPsychology/DepartmentsPsychologyContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (91,'DepartmentsChildrenConstitution',32,88,'/DepartmentsChildren/DepartmentsChildrenConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (92,'DepartmentsChildrenNews',32,89,'/DepartmentsChildren/DepartmentsChildrenNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (93,'DepartmentsChildrenMaterials',32,90,'/DepartmentsChildren/DepartmentsChildrenMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (94,'DepartmentsChildrenContacts',32,91,'/DepartmentsChildren/DepartmentsChildrenContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (95,'DepartmentsScienceConstitution',33,92,'/DepartmentsScience/DepartmentsScienceConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (96,'DepartmentsScienceNews',33,93,'/DepartmentsScience/DepartmentsScienceNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (97,'DepartmentsScienceMaterials',33,94,'/DepartmentsScience/DepartmentsScienceMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (98,'DepartmentsScienceContacts',33,95,'/DepartmentsScience/DepartmentsScienceContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (99,'DepartmentsVocationalService',34,96,'/DepartmentsVocational/DepartmentsVocationalService/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (100,'DepartmentsVocationalConstitution',34,97,'/DepartmentsVocational/DepartmentsVocationalConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (101,'DepartmentsVocationalNews',34,98,'/DepartmentsVocational/DepartmentsVocationalNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (102,'DepartmentsVocationalMaterials',34,99,'/DepartmentsVocational/DepartmentsVocationalMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (103,'DepartmentsVocationalContacts',34,100,'/DepartmentsVocational/DepartmentsVocationalContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (106,'DepartmentsHumanitiesNews',35,101,'/DepartmentsHumanities/DepartmentsHumanitiesNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (107,'DepartmentsHumanitiesEducationalActivities',35,102,'/DepartmentsHumanities/DepartmentsHumanitiesEducationalActivities/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (108,'DepartmentsHumanitiesReviews',35,103,'/DepartmentsHumanities/DepartmentsHumanitiesReviews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (109,'DepartmentsHumanitiesMaterialsDepartment',35,104,'/DepartmentsHumanities/DepartmentsHumanitiesMaterialsDepartment/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (110,'DepartmentsHumanitiesFaculties',35,105,'/DepartmentsHumanities/DepartmentsHumanitiesFaculties/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (111,'DepartmentsHumanitiesContacts',35,106,'/DepartmentsHumanities/DepartmentsHumanitiesContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (112,'DepartmentsPhilologicalConstitution',36,107,'/DepartmentsPhilological/DepartmentsPhilologicalConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (113,'DepartmentsPhilologicalNews',36,108,'/DepartmentsPhilological/DepartmentsPhilologicalNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (114,'DepartmentsPhilologicalMaterials',36,109,'/DepartmentsPhilological/DepartmentsPhilologicalMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (115,'DepartmentsPhilologicalContacts',36,110,'/DepartmentsPhilological/DepartmentsPhilologicalContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (116,'DepartmentsITConstitution',37,111,'/DepartmentsIT/DepartmentsITConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (117,'DepartmentsITNews',37,112,'/DepartmentsIT/DepartmentsITNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (118,'DepartmentsITMaterials',37,113,'/DepartmentsIT/DepartmentsITMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (119,'DepartmentsITContacts',37,114,'/DepartmentsIT/DepartmentsITContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (120,'DepartmentsSocioScientificConstitution',38,115,'/DepartmentsSocioScientific/DepartmentsSocioScientificConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (121,'DepartmentsSocioScientificNews',38,116,'/DepartmentsSocioScientific/DepartmentsSocioScientificNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (122,'DepartmentsSocioScientificMaterials',38,117,'/DepartmentsSocioScientific/DepartmentsSocioScientificMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (123,'DepartmentsSocioScientificContacts',38,118,'/DepartmentsSocioScientific/DepartmentsSocioScientificContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (124,'DepartmentsCabinetConstitution',39,119,'/DepartmentsCabinet/DepartmentsCabinetConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (125,'DepartmentsCabinetNews',39,120,'/DepartmentsCabinet/DepartmentsCabinetNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (126,'DepartmentsCabinetMaterials',39,121,'/DepartmentsCabinet/DepartmentsCabinetMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (127,'DepartmentsCabinetContacts',39,122,'/DepartmentsCabinet/DepartmentsCabinetContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (128,'CentersInformationConstitution',40,123,'/CentersInformation/CentersInformationConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (129,'CentersInformationNews',40,124,'/CentersInformation/CentersInformationNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (130,'CentersInformationMaterials',40,125,'/CentersInformation/CentersInformationMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (131,'CentersInformationContacts',40,126,'/CentersInformation/CentersInformationContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (132,'CentersRegionalNews',41,127,'/CentersRegional/CentersRegionalNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (133,'CentersRegionalBasic',41,128,'/CentersRegional/CentersRegionalBasic/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (134,'CentersRegionalContacts',41,129,'/CentersRegional/CentersRegionalContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (135,'CentersRegionalMaterials',41,130,'/CentersRegional/CentersRegionalMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (136,'CentersRegionalConstitution',41,131,'/CentersRegional/CentersRegionalConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (137,'CentersEducationSystemConstitution',42,132,'/CentersEducationSystem/CentersEducationSystemConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (138,'CentersEducationSystemNews',42,133,'/CentersEducationSystem/CentersEducationSystemNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (139,'CentersEducationSystemMaterials',42,134,'/CentersEducationSystem/CentersEducationSystemMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (140,'CentersEducationSystemContacts',42,135,'/CentersEducationSystem/CentersEducationSystemContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (142,'CentersLibraryShelter',43,136,'/CentersLibrary/CentersLibraryShelter/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (143,'CentersLibraryBibliography',43,137,'/CentersLibrary/CentersLibraryBibliography/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (144,'CentersLibraryPublications',43,138,'/CentersLibrary/CentersLibraryPublications/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (145,'CentersLibraryExhibitionCalendar',43,139,'/CentersLibrary/CentersLibraryExhibitionCalendar/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (146,'CentersLibraryNews',43,140,'/CentersLibrary/CentersLibraryNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (147,'CentersLibraryUsefulLinks',43,141,'/CentersLibrary/CentersLibraryUsefulLinks/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (148,'CentersLibrarySeminars',43,142,'/CentersLibrary/CentersLibrarySeminars/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (149,'CentersLibraryEducationalPublishing',43,143,'/CentersLibrary/CentersLibraryEducationalPublishing/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (150,'CentersAdministrationConstitution',44,144,'/CentersAdministration/CentersAdministrationConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (151,'CentersAdministrationNews',44,145,'/CentersAdministration/CentersAdministrationNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (152,'CentersAdministrationMaterials',44,146,'/CentersAdministration/CentersAdministrationMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (153,'CentersAdministrationContacts',44,147,'/CentersAdministration/CentersAdministrationContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (154,'CentersRoboticsConstitution',45,148,'/CentersRobotics/CentersRoboticsConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (155,'CentersRoboticsNews',45,149,'/CentersRobotics/CentersRoboticsNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (156,'CentersRoboticsMaterials',45,150,'/CentersRobotics/CentersRoboticsMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (157,'CentersRoboticsContacts',45,151,'/CentersRobotics/CentersRoboticsContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (158,'DivisionsEscortConstitution',46,152,'/DivisionsEscort/DivisionsEscortConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (159,'DivisionsEscortNews',46,153,'/DivisionsEscort/DivisionsEscortNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (160,'DivisionsEscortMaterials',46,154,'/DivisionsEscort/DivisionsEscortMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (161,'DivisionsEscortContacts',46,155,'/DivisionsEscort/DivisionsEscortContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (162,'DivisionsEditorialConstitution',47,156,'/DivisionsEditorial/DivisionsEditorialConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (163,'DivisionsEditorialNews',47,157,'/DivisionsEditorial/DivisionsEditorialNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (165,'DivisionsEditorialMaterials',47,158,'/DivisionsEditorial/DivisionsEditorialMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (166,'DivisionsEditorialContacts',47,159,'/DivisionsEditorial/DivisionsEditorialContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (167,'DivisionsCustomerEvaluationConstitution',48,160,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (168,'DivisionsCustomerEvaluationNews',48,161,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (169,'DivisionsCustomerEvaluationMaterials',48,162,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (170,'DivisionsCustomerEvaluationContacts',48,163,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (171,'DivisionsPostUniversityConstitution',49,164,'/DivisionsPostUniversity/DivisionsPostUniversityConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (172,'DivisionsPostUniversityNews',49,165,'/DivisionsPostUniversity/DivisionsPostUniversityNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (173,'DivisionsPostUniversityMaterials',49,166,'/DivisionsPostUniversity/DivisionsPostUniversityMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (174,'DivisionsPostUniversityContacts',49,167,'/DivisionsPostUniversity/DivisionsPostUniversityContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (175,'DivisionsTechSupportConstitution',50,168,'/DivisionsTechSupport/DivisionsTechSupportConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (176,'DivisionsTechSupportNews',50,169,'/DivisionsTechSupport/DivisionsTechSupportNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (177,'DivisionsTechSupportMaterials',50,170,'/DivisionsTechSupport/DivisionsTechSupportMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (178,'DivisionsTechSupportContacts',50,171,'/DivisionsTechSupport/DivisionsTechSupportContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (179,'DivisionsLawConstitution',51,172,'/DivisionsLaw/DivisionsLawConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (180,'DivisionsLawNews',51,173,'/DivisionsLaw/DivisionsLawNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (181,'DivisionsLawMaterials',51,174,'/DivisionsLaw/DivisionsLawMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (182,'DivisionsLawContacts',51,175,'/DivisionsLaw/DivisionsLawContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (183,'DivisionsOrganizationConstitution',52,176,'/DivisionsOrganization/DivisionsOrganizationConstitution/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (184,'DivisionsOrganizationNews',52,177,'/DivisionsOrganization/DivisionsOrganizationNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (185,'DivisionsOrganizationMaterials',52,178,'/DivisionsOrganization/DivisionsOrganizationMaterials/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (186,'DivisionsOrganizationContacts',52,179,'/DivisionsOrganization/DivisionsOrganizationContacts/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (187,'EducationalActivitiesDevelopmentYearlySchedule',57,180,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentYearlySchedule/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (188,'EducationalActivitiesDevelopmentMonthlyPlan',57,181,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentMonthlyPlan/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (189,'EducationalActivitiesDevelopmentCatalog',57,182,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentCatalog/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (190,'EducationalActivitiesRetrainingYearlySchedule',58,183,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingYearlySchedule/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (191,'EducationalActivitiesRetrainingMonthlyPlan',58,184,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingMonthlyPlan/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (192,'EducationalActivitiesRetrainingCatalog',58,185,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingCatalog/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (193,'EducationalActivitiesInternshipYearlySchedule',59,186,'/EducationalActivitiesInternship/EducationalActivitiesInternshipYearlySchedule/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (194,'EducationalActivitiesInternshipMonthlyPlan',59,187,'/EducationalActivitiesInternship/EducationalActivitiesInternshipMonthlyPlan/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (195,'EducationalActivitiesInternshipCatalog',59,188,'/EducationalActivitiesInternship/EducationalActivitiesInternshipCatalog/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (196,'EducationalActivitiesDistanceLearningContract',60,189,'/EducationalActivitiesDistanceLearning/EducationalActivitiesDistanceLearningContract/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (197,'EducationalActivitiesDistanceLearningCatalog',60,190,'/EducationalActivitiesDistanceLearning/EducationalActivitiesDistanceLearningCatalog/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (198,'EducationalActivitiesExtrabudgetaryContract',61,191,'/EducationalActivitiesExtrabudgetary/EducationalActivitiesExtrabudgetaryContract/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (199,'EducationalActivitiesExtrabudgetaryCatalog',61,192,'/EducationalActivitiesExtrabudgetary/EducationalActivitiesExtrabudgetaryCatalog/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (200,'GraduatesJEGRegulatoryDocument',75,193,'/GraduatesJEG/GraduatesJEGRegulatoryDocument/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (201,'GraduatesJEGStatistics',75,194,'/GraduatesJEG/GraduatesJEGStatistics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (202,'GraduatesJEGAnalytics',75,195,'/GraduatesJEG/GraduatesJEGAnalytics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (203,'GraduatesEGERegulatoryDocument',76,196,'/GraduatesEGE/GraduatesEGERegulatoryDocument/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (204,'GraduatesEGEStatistics',76,197,'/GraduatesEGE/GraduatesEGEStatistics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (205,'GraduatesEGEAnalytics',76,198,'/GraduatesEGE/GraduatesEGEAnalytics/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (206,'ContinuingEducationActionPlan',211,199,'/ContinuingEducation/ContinuingEducationActionPlan/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (207,'ContinuingEducationSupport',211,200,'/ContinuingEducation/ContinuingEducationSupport/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (208,'ContinuingEducationNews',211,201,'/ContinuingEducation/ContinuingEducationNews/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (209,'NewsAnnouncements',8,202,'/News/NewsAnnouncements/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (210,'NewsArchive',8,203,'/News/NewsArchive/');
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`) VALUES (211,'ContinuingEducation',NULL,204,'/ContinuingEducation/');


/*
-- Query: SELECT * FROM IRRONEW.USER_GROUP
LIMIT 0, 1000

-- Date: 2014-04-07 10:13
*/
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (22,'DepartmentsPsychology','Кафедра педагогики и психологии',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (18,'Contacts','Контакты',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (19,'Jobs','Вакансии',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (20,'Departments','Кафедры',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (15,'Management','Управления',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (16,'History','История',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (17,'Logistics','Материально-техническое обеспечение',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (12,'Rector','Ректорат',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (13,'Institute','Институт',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (14,'Documents','Документы',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (23,'DepartmentsChildren','Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (24,'DepartmentsScience','Кафедра естественнонаучного и математического образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (25,'DepartmentsVocational','Кафедра профессионального образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (26,'BranchOfficeSerov','Представительство ИРО в г. Серов',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (29,'DepartmentsPhilosophy','Кафедра философии и управления образованием',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (28,'News','Новости',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (30,'DepartmentsHumanities','Кафедра гуманитарного образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (31,'DepartmentsPhilological','Кафедра филологического образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (32,'DepartmentsIT','Кафедра информационных технологий',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (33,'DepartmentsSocioScientific','Кафедра общественно-научных дисциплин',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (34,'DepartmentsCabinet','Кабинет «ОБЖ и физического воспитания»',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (35,'Centers','Центры',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (36,'CentersInformation','Центр обработки нформации и организации ЕГЭ',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (37,'CentersRegional','Региональный центр по введению ФГОС',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (38,'CentersEducationSystem','Центр исследований состояния системы образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (39,'CentersLibrary','Библиотечно-информационный центр',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (40,'CentersAdministration','Центр администрирования и технического сопровождения информационных систем',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (41,'CentersRobotics','Центр образовательной робототехники',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (42,'Divisions','Отделы',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (43,'DivisionsEscort','Отдел сопровождения конкурсов и инновационных проектов',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (44,'DivisionsEditorial','Редакционно-издательский отдел',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (45,'DivisionsCustomerEvaluation','Отдел сопровождения аттестационных процессов',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (46,'DivisionsPostUniversity','Отдел послевузовского образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (47,'DivisionsTechSupport','Отдел программно-технического обеспечения',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (48,'DivisionsLaw','Кадрово-юридический отдел',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (49,'DivisionsOrganization','Контрольно-организационный отдел',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (50,'BranchOffice','Филиал и представительства',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (51,'BranchOfficeNizhny','Нижнетагильский филиал ИРО',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (52,'BranchOfficeKamyshlov','Представительство ИРО в г. Камышлов',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (53,'BranchOfficeKrasnoufimsk','Представительство ИРО в г. Красноуфимск',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (54,'Activities','Деятельность',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (55,'EducationalActivities','Образовательная деятельность',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (56,'EducationalActivitiesDevelopment','Повышение квалификации',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (57,'EducationalActivitiesRetraining','Профессиональная переподготовка',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (58,'EducationalActivitiesInternship','Стажировка',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (59,'EducationalActivitiesExtrabudgetary','Внебюджетная деятельность',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (60,'EducationalActivitiesSeminar','Семинары',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (61,'EducationalActivitiesDistanceLearning','Дистанционное обучение',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (62,'Conference','Конференции',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (63,'ConferenceInternational','Международные',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (64,'ConferenceRussia','Всероссийские',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (65,'ConferenceRegional','Конференции Региональные',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (66,'ConferenceOblastnyye','Областные',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (67,'Contests','Конкурсы',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (68,'ContestsStaff','для педагогических работников',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (69,'ContestsOrganization','для образовательных организаций',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (70,'ContestsLearner','для обучающихся',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (71,'Olympics','Олимпиады',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (72,'OlympicsAllRussia','Всероссийская олимпиада школьников',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (73,'OlympicsSchool','Предметные олимпиады школьников',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (74,'Certification','Аттестация',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (75,'Employees','Аттестация педагогических работников',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (76,'Graduates','Государственная итоговая аттестация выпускников',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (77,'GraduatesJEG','ОГЭ',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (78,'GraduatesEGE','ЕГЭ',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (79,'Projects','Проекты',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (80,'Sverdlovsk','Введение ФГОС общего образования как фактор модернизации системы образования Свердловской области',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (81,'SverdlovskOptional','Модели организации внеурочной деятельности',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (82,'SverdlovskInstitutions','Моделирование информационной, образовательной среды образовательного учреждения',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (83,'SverdlovskChildren','Образовательные модели и технологии работы с одаренными детьми',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (84,'SverdlovskRuralSchool','Основные направления развития сельских школ',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (85,'SverdlovskModernEducation','Создание моделей образовательных систем, обеспечивающих современноекачество общего образования',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (86,'Basic','Базовые площадки',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (87,'ContinuingEducation','Разработка и реализация региональной модели сопровождения профессионального самоопределения обучающи',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (88,'ContestsRegional','Конкурсы Региональные',1,'2014-04-04');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (89,'MainContacts','MainContacts',1,'2014-04-07');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (90,'Hotel','Hotel',1,'2014-04-07');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (91,'OnlineResources','OnlineResources',1,'2014-04-07');

