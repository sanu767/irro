CREATE TABLE `MENU_INFO` (
  `MENU_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` int(10) DEFAULT NULL,
  `REF_ARTICLE_ID` int(10) DEFAULT NULL,
  `DOC_LOCATION` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_TREE` tinyint(1) DEFAULT '1',
  `MENU_TYPE` int(10) DEFAULT '0',
  `LABEL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

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

CREATE TABLE `USER` (
  `USR_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USR_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USR_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `USR_SUR_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USR_EMAIL` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USR_PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE_NUMBER` int(10) DEFAULT NULL,
  `USR_REGISTRATION_DATE` date DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '0',
  `MAX_UPLOAD_FILE_SIZE` int(10) DEFAULT NULL,
  `IS_SUPERADMIN` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`USR_ID`),
  UNIQUE KEY `USR_CODE_UNIQUE` (`USR_CODE`),
  UNIQUE KEY `USR_EMAIL_UNIQUE` (`USR_EMAIL`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

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

-- Date: 2014-04-21 12:16
*/
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (5,'Activities',3,2,'/Activities/','Деятельность',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (4,'Institute',3,1,'/Institute/','Институт',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (6,'Certification',3,3,'/Certification/','Аттестация',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (7,'Projects',3,4,'/Projects/','Проекты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (8,'News',3,5,'/News/','Новости',1,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (9,'MainContacts',3,6,'/MainContacts/','Контакты',0,0);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (10,'Hotel',3,7,'/Hotel/','Гостиница',0,0);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (11,'OnlineResources',3,8,'/OnlineResources/','Интернет-ресурсы  ИРО',0,0);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (12,'Rector',4,9,'/Institute/Rector/','Ректорат',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (13,'Documents',4,10,'/Institute/Documents/','Документы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (14,'Management',4,11,'/Institute/Management/','Управления',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (15,'History',4,12,'/Institute/History/','История',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (16,'Logistics',4,13,'/Institute/Logistics/','Материально-техническое обеспечение',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (17,'Jobs',4,14,'/Institute/Jobs/','Вакансии',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (18,'Departments',4,15,'/Institute/Departments/','Кафедры',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (19,'Centers',4,16,'/Institute/Centers/','Центры',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (20,'Divisions',4,17,'/Institute/Divisions/','Отделы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (21,'BranchOffice',4,18,'/Institute/BranchOffice/','Филиал и представительства',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (22,'EducationalActivities',5,19,'/Activities/EducationalActivities/','Образовательная деятельность',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (23,'Conference',5,20,'/Activities/Conference/','Конференции',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (24,'Contests',5,21,'/Activities/Contests/','Конкурсы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (25,'Olympics',5,22,'/Activities/Olympics/','Олимпиады',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (26,'Employees',6,23,'/Certification/Employees/','Аттестация педагогических работников',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (27,'Graduates',6,24,'/Certification/Graduates/','Государственная итоговая аттестация выпускников',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (28,'Sverdlovsk',7,25,'/Projects/Sverdlovsk/','Введение ФГОС общего образования как фактор модернизации системы образования Свердловской области',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (29,'Basic',7,26,'/Projects/Basic/','Базовые площадки',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (30,'DepartmentsPhilosophy',18,27,'/Departments/DepartmentsPhilosophy/','Кафедра философии и управления образованием',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (31,'DepartmentsPsychology',18,28,'/Departments/DepartmentsPsychology/','Кафедра педагогики и психологии',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (32,'DepartmentsChildren',18,29,'/Departments/DepartmentsChildren/','Кафедра методологии и методики образования детей с ОВЗ и детей, оставшихся без попечения родителей',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (33,'DepartmentsScience',18,30,'/Departments/DepartmentsScience/','Кафедра естественнонаучного и математического образования',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (34,'DepartmentsVocational',18,31,'/Departments/DepartmentsVocational/','Кафедра профессионального образования',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (35,'DepartmentsHumanities',18,32,'/Departments/DepartmentsHumanities/','Кафедра гуманитарного образования',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (36,'DepartmentsPhilological',18,33,'/Departments/DepartmentsPhilological/','Кафедра филологического образования',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (37,'DepartmentsIT',18,34,'/Departments/DepartmentsIT/','Кафедра информационных технологий',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (38,'DepartmentsSocioScientific',18,35,'/Departments/DepartmentsSocioScientific/','Кафедра общественно-научных дисциплин',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (39,'DepartmentsCabinet',18,36,'/Departments/DepartmentsCabinet/','Кабинет «ОБЖ и физического воспитания»',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (40,'CentersInformation',19,37,'/Centers/CentersInformation/','Центр обработки нформации и организации ЕГЭ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (41,'CentersRegional',19,38,'/Centers/CentersRegional/','Региональный центр по введению ФГОС',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (42,'CentersEducationSystem',19,39,'/Centers/CentersEducationSystem/','Центр исследований состояния системы образования',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (43,'CentersLibrary',19,40,'/Centers/CentersLibrary/','Библиотечно-информационный центр',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (44,'CentersAdministration',19,41,'/Centers/CentersAdministration/','Центр администрирования и технического сопровождения информационных систем',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (45,'CentersRobotics',19,42,'/Centers/CentersRobotics/','Центр образовательной робототехники',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (46,'DivisionsEscort',20,43,'/Divisions/DivisionsEscort/','Отдел сопровождения конкурсов и инновационных проектов',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (47,'DivisionsEditorial',20,44,'/Divisions/DivisionsEditorial/','Редакционно-издательский отдел',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (48,'DivisionsCustomerEvaluation',20,45,'/Divisions/DivisionsCustomerEvaluation/','Отдел сопровождения аттестационных процессов',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (49,'DivisionsPostUniversity',20,46,'/Divisions/DivisionsPostUniversity/','Отдел послевузовского образования',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (50,'DivisionsTechSupport',20,47,'/Divisions/DivisionsTechSupport/','Отдел программно-технического обеспечения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (51,'DivisionsLaw',20,48,'/Divisions/DivisionsLaw/','Кадрово-юридический отдел',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (52,'DivisionsOrganization',20,49,'/Divisions/DivisionsOrganization/','Контрольно-организационный отдел',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (53,'BranchOfficeNizhny',21,50,'/BranchOffice/BranchOfficeNizhny/','Нижнетагильский филиал ИРО',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (54,'BranchOfficeKamyshlov',21,51,'/BranchOffice/BranchOfficeKamyshlov/','Представительство ИРО в г. Камышлов',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (55,'BranchOfficeKrasnoufimsk',21,52,'/BranchOffice/BranchOfficeKrasnoufimsk/','Представительство ИРО в г. Красноуфимск',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (56,'BranchOfficeSerov',21,53,'/BranchOffice/BranchOfficeSerov/','Представительство ИРО в г. Серов',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (57,'EducationalActivitiesDevelopment',22,54,'/EducationalActivities/EducationalActivitiesDevelopment/','Повышение квалификации',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (58,'EducationalActivitiesRetraining',22,55,'/EducationalActivities/EducationalActivitiesRetraining/','Профессиональная переподготовка',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (59,'EducationalActivitiesInternship',22,56,'/EducationalActivities/EducationalActivitiesInternship/','Стажировка',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (60,'EducationalActivitiesDistanceLearning',22,57,'/EducationalActivities/EducationalActivitiesDistanceLearning/','Дистанционное обучение',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (61,'EducationalActivitiesExtrabudgetary',22,58,'/EducationalActivities/EducationalActivitiesExtrabudgetary/','Внебюджетная деятельность',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (62,'EducationalActivitiesSeminar',22,59,'/EducationalActivities/EducationalActivitiesSeminar/','Семинары',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (63,'ConferenceInternational',23,60,'/Conference/ConferenceInternational/','Международные',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (64,'ConferenceRussia',23,61,'/Conference/ConferenceRussia/','Всероссийские',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (65,'ConferenceRegional',23,62,'/Conference/ConferenceRegional/','Конференции Региональные',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (66,'ConferenceOblastnyye',23,63,'/Conference/ConferenceOblastnyye/','Областные',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (67,'ContestsStaff',24,64,'/Contests/ContestsStaff/','для педагогических работников',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (68,'ContestsOrganization',24,65,'/Contests/ContestsOrganization/','для образовательных организаций',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (69,'ContestsLearner',24,66,'/Contests/ContestsLearner/','для обучающихся',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (70,'OlympicsAllRussia',25,67,'/Olympics/OlympicsAllRussia/','Всероссийская олимпиада школьников',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (71,'OlympicsSchool',25,68,'/Olympics/OlympicsSchool/','Предметные олимпиады школьников',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (72,'EmployeesRegulatoryDocument',26,69,'/Employees/EmployeesRegulatoryDocument/','Нормативные документы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (73,'EmployeesInformation',26,70,'/Employees/EmployeesInformation/','Информационно-аналитические материалы (файлы)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (74,'EmployeesMaterial',26,71,'/Employees/EmployeesMaterial/','Методические материалы (файлы)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (75,'GraduatesJEG',27,72,'/Graduates/GraduatesJEG/','ОГЭ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (76,'GraduatesEGE',27,73,'/Graduates/GraduatesEGE/','ЕГЭ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (77,'SverdlovskOptional',28,74,'/Sverdlovsk/SverdlovskOptional/','Модели организации внеурочной деятельности',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (78,'SverdlovskInstitutions',28,75,'/Sverdlovsk/SverdlovskInstitutions/','Моделирование информационной, образовательной среды образовательного учреждения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (79,'SverdlovskChildren',28,76,'/Sverdlovsk/SverdlovskChildren/','Образовательные модели и технологии работы с одаренными детьми',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (80,'SverdlovskRuralSchool',28,77,'/Sverdlovsk/SverdlovskRuralSchool/','Основные направления развития сельских школ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (81,'SverdlovskModernEducation',28,78,'/Sverdlovsk/SverdlovskModernEducation/','Создание моделей образовательных систем, обеспечивающих современноекачество общего образования',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (82,'DepartmentsPhilosophyConstitution',30,79,'/DepartmentsPhilosophy/DepartmentsPhilosophyConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (83,'DepartmentsPhilosophyNews',30,80,'/DepartmentsPhilosophy/DepartmentsPhilosophyNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (84,'DepartmentsPhilosophyMaterials',30,81,'/DepartmentsPhilosophy/DepartmentsPhilosophyMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (85,'DepartmentsPhilosophyContacts',30,82,'/DepartmentsPhilosophy/DepartmentsPhilosophyContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (86,'DepartmentsPsychologyConstitution',31,83,'/DepartmentsPsychology/DepartmentsPsychologyConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (87,'DepartmentsPsychologyNews',31,84,'/DepartmentsPsychology/DepartmentsPsychologyNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (88,'DepartmentsPsychologyMaterials',31,85,'/DepartmentsPsychology/DepartmentsPsychologyMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (89,'DepartmentsPsychologyReviews',31,86,'/DepartmentsPsychology/DepartmentsPsychologyReviews/','Отзывы слушателей',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (90,'DepartmentsPsychologyContacts',31,87,'/DepartmentsPsychology/DepartmentsPsychologyContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (91,'DepartmentsChildrenConstitution',32,88,'/DepartmentsChildren/DepartmentsChildrenConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (92,'DepartmentsChildrenNews',32,89,'/DepartmentsChildren/DepartmentsChildrenNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (93,'DepartmentsChildrenMaterials',32,90,'/DepartmentsChildren/DepartmentsChildrenMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (94,'DepartmentsChildrenContacts',32,91,'/DepartmentsChildren/DepartmentsChildrenContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (95,'DepartmentsScienceConstitution',33,92,'/DepartmentsScience/DepartmentsScienceConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (96,'DepartmentsScienceNews',33,93,'/DepartmentsScience/DepartmentsScienceNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (97,'DepartmentsScienceMaterials',33,94,'/DepartmentsScience/DepartmentsScienceMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (98,'DepartmentsScienceContacts',33,95,'/DepartmentsScience/DepartmentsScienceContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (99,'DepartmentsVocationalService',34,96,'/DepartmentsVocational/DepartmentsVocationalService/','Методическая служба',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (100,'DepartmentsVocationalConstitution',34,97,'/DepartmentsVocational/DepartmentsVocationalConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (101,'DepartmentsVocationalNews',34,98,'/DepartmentsVocational/DepartmentsVocationalNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (102,'DepartmentsVocationalMaterials',34,99,'/DepartmentsVocational/DepartmentsVocationalMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (103,'DepartmentsVocationalContacts',34,100,'/DepartmentsVocational/DepartmentsVocationalContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (106,'DepartmentsHumanitiesNews',35,101,'/DepartmentsHumanities/DepartmentsHumanitiesNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (107,'DepartmentsHumanitiesEducationalActivities',35,102,'/DepartmentsHumanities/DepartmentsHumanitiesEducationalActivities/','Образовательная деятельность',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (108,'DepartmentsHumanitiesReviews',35,103,'/DepartmentsHumanities/DepartmentsHumanitiesReviews/','Отзывы слушателей',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (109,'DepartmentsHumanitiesMaterialsDepartment',35,104,'/DepartmentsHumanities/DepartmentsHumanitiesMaterialsDepartment/','Материалы кафедры',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (110,'DepartmentsHumanitiesFaculties',35,105,'/DepartmentsHumanities/DepartmentsHumanitiesFaculties/','Профессорско-преподавательский состав кафедры',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (111,'DepartmentsHumanitiesContacts',35,106,'/DepartmentsHumanities/DepartmentsHumanitiesContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (112,'DepartmentsPhilologicalConstitution',36,107,'/DepartmentsPhilological/DepartmentsPhilologicalConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (113,'DepartmentsPhilologicalNews',36,108,'/DepartmentsPhilological/DepartmentsPhilologicalNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (114,'DepartmentsPhilologicalMaterials',36,109,'/DepartmentsPhilological/DepartmentsPhilologicalMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (115,'DepartmentsPhilologicalContacts',36,110,'/DepartmentsPhilological/DepartmentsPhilologicalContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (116,'DepartmentsITConstitution',37,111,'/DepartmentsIT/DepartmentsITConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (117,'DepartmentsITNews',37,112,'/DepartmentsIT/DepartmentsITNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (118,'DepartmentsITMaterials',37,113,'/DepartmentsIT/DepartmentsITMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (119,'DepartmentsITContacts',37,114,'/DepartmentsIT/DepartmentsITContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (120,'DepartmentsSocioScientificConstitution',38,115,'/DepartmentsSocioScientific/DepartmentsSocioScientificConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (121,'DepartmentsSocioScientificNews',38,116,'/DepartmentsSocioScientific/DepartmentsSocioScientificNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (122,'DepartmentsSocioScientificMaterials',38,117,'/DepartmentsSocioScientific/DepartmentsSocioScientificMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (123,'DepartmentsSocioScientificContacts',38,118,'/DepartmentsSocioScientific/DepartmentsSocioScientificContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (124,'DepartmentsCabinetConstitution',39,119,'/DepartmentsCabinet/DepartmentsCabinetConstitution/','Состав подразделения',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (125,'DepartmentsCabinetNews',39,120,'/DepartmentsCabinet/DepartmentsCabinetNews/','Новости',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (126,'DepartmentsCabinetMaterials',39,121,'/DepartmentsCabinet/DepartmentsCabinetMaterials/','Материалы',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (127,'DepartmentsCabinetContacts',39,122,'/DepartmentsCabinet/DepartmentsCabinetContacts/','Контакты',2,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (128,'CentersInformationConstitution',40,123,'/CentersInformation/CentersInformationConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (129,'CentersInformationNews',40,124,'/CentersInformation/CentersInformationNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (130,'CentersInformationMaterials',40,125,'/CentersInformation/CentersInformationMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (131,'CentersInformationContacts',40,126,'/CentersInformation/CentersInformationContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (132,'CentersRegionalNews',41,127,'/CentersRegional/CentersRegionalNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (133,'CentersRegionalBasic',41,128,'/CentersRegional/CentersRegionalBasic/','Базовые площадки',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (134,'CentersRegionalContacts',41,129,'/CentersRegional/CentersRegionalContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (135,'CentersRegionalMaterials',41,130,'/CentersRegional/CentersRegionalMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (136,'CentersRegionalConstitution',41,131,'/CentersRegional/CentersRegionalConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (137,'CentersEducationSystemConstitution',42,132,'/CentersEducationSystem/CentersEducationSystemConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (138,'CentersEducationSystemNews',42,133,'/CentersEducationSystem/CentersEducationSystemNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (139,'CentersEducationSystemMaterials',42,134,'/CentersEducationSystem/CentersEducationSystemMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (140,'CentersEducationSystemContacts',42,135,'/CentersEducationSystem/CentersEducationSystemContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (142,'CentersLibraryShelter',43,136,'/CentersLibrary/CentersLibraryShelter/','Библиотекарю ОУ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (143,'CentersLibraryBibliography',43,137,'/CentersLibrary/CentersLibraryBibliography/','Библиографические списки',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (144,'CentersLibraryPublications',43,138,'/CentersLibrary/CentersLibraryPublications/','Издания и публикации ИРО',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (145,'CentersLibraryExhibitionCalendar',43,139,'/CentersLibrary/CentersLibraryExhibitionCalendar/','Календарь выставок',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (146,'CentersLibraryNews',43,140,'/CentersLibrary/CentersLibraryNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (147,'CentersLibraryUsefulLinks',43,141,'/CentersLibrary/CentersLibraryUsefulLinks/','Полезные ссылки',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (148,'CentersLibrarySeminars',43,142,'/CentersLibrary/CentersLibrarySeminars/','Семинары и вебинары',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (149,'CentersLibraryEducationalPublishing',43,143,'/CentersLibrary/CentersLibraryEducationalPublishing/','Учебное книгоиздание',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (150,'CentersAdministrationConstitution',44,144,'/CentersAdministration/CentersAdministrationConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (151,'CentersAdministrationNews',44,145,'/CentersAdministration/CentersAdministrationNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (152,'CentersAdministrationMaterials',44,146,'/CentersAdministration/CentersAdministrationMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (153,'CentersAdministrationContacts',44,147,'/CentersAdministration/CentersAdministrationContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (154,'CentersRoboticsConstitution',45,148,'/CentersRobotics/CentersRoboticsConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (155,'CentersRoboticsNews',45,149,'/CentersRobotics/CentersRoboticsNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (156,'CentersRoboticsMaterials',45,150,'/CentersRobotics/CentersRoboticsMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (157,'CentersRoboticsContacts',45,151,'/CentersRobotics/CentersRoboticsContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (158,'DivisionsEscortConstitution',46,152,'/DivisionsEscort/DivisionsEscortConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (159,'DivisionsEscortNews',46,153,'/DivisionsEscort/DivisionsEscortNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (160,'DivisionsEscortMaterials',46,154,'/DivisionsEscort/DivisionsEscortMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (161,'DivisionsEscortContacts',46,155,'/DivisionsEscort/DivisionsEscortContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (162,'DivisionsEditorialConstitution',47,156,'/DivisionsEditorial/DivisionsEditorialConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (163,'DivisionsEditorialNews',47,157,'/DivisionsEditorial/DivisionsEditorialNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (165,'DivisionsEditorialMaterials',47,158,'/DivisionsEditorial/DivisionsEditorialMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (166,'DivisionsEditorialContacts',47,159,'/DivisionsEditorial/DivisionsEditorialContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (167,'DivisionsCustomerEvaluationConstitution',48,160,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (168,'DivisionsCustomerEvaluationNews',48,161,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (169,'DivisionsCustomerEvaluationMaterials',48,162,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (170,'DivisionsCustomerEvaluationContacts',48,163,'/DivisionsCustomerEvaluation/DivisionsCustomerEvaluationContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (171,'DivisionsPostUniversityConstitution',49,164,'/DivisionsPostUniversity/DivisionsPostUniversityConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (172,'DivisionsPostUniversityNews',49,165,'/DivisionsPostUniversity/DivisionsPostUniversityNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (173,'DivisionsPostUniversityMaterials',49,166,'/DivisionsPostUniversity/DivisionsPostUniversityMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (174,'DivisionsPostUniversityContacts',49,167,'/DivisionsPostUniversity/DivisionsPostUniversityContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (175,'DivisionsTechSupportConstitution',50,168,'/DivisionsTechSupport/DivisionsTechSupportConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (176,'DivisionsTechSupportNews',50,169,'/DivisionsTechSupport/DivisionsTechSupportNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (177,'DivisionsTechSupportMaterials',50,170,'/DivisionsTechSupport/DivisionsTechSupportMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (178,'DivisionsTechSupportContacts',50,171,'/DivisionsTechSupport/DivisionsTechSupportContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (179,'DivisionsLawConstitution',51,172,'/DivisionsLaw/DivisionsLawConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (180,'DivisionsLawNews',51,173,'/DivisionsLaw/DivisionsLawNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (181,'DivisionsLawMaterials',51,174,'/DivisionsLaw/DivisionsLawMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (182,'DivisionsLawContacts',51,175,'/DivisionsLaw/DivisionsLawContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (183,'DivisionsOrganizationConstitution',52,176,'/DivisionsOrganization/DivisionsOrganizationConstitution/','Состав подразделения',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (184,'DivisionsOrganizationNews',52,177,'/DivisionsOrganization/DivisionsOrganizationNews/','Новости',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (185,'DivisionsOrganizationMaterials',52,178,'/DivisionsOrganization/DivisionsOrganizationMaterials/','Материалы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (186,'DivisionsOrganizationContacts',52,179,'/DivisionsOrganization/DivisionsOrganizationContacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (187,'EducationalActivitiesDevelopmentYearlySchedule',57,180,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentYearlySchedule/','График  на год',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (188,'EducationalActivitiesDevelopmentMonthlyPlan',57,181,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentMonthlyPlan/','План на месяц',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (189,'EducationalActivitiesDevelopmentCatalog',57,182,'/EducationalActivitiesDevelopment/EducationalActivitiesDevelopmentCatalog/','Аннотированный каталог',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (190,'EducationalActivitiesRetrainingYearlySchedule',58,183,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingYearlySchedule/','График  на год',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (191,'EducationalActivitiesRetrainingMonthlyPlan',58,184,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingMonthlyPlan/','План на месяц',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (192,'EducationalActivitiesRetrainingCatalog',58,185,'/EducationalActivitiesRetraining/EducationalActivitiesRetrainingCatalog/','Аннотированный каталог',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (193,'EducationalActivitiesInternshipYearlySchedule',59,186,'/EducationalActivitiesInternship/EducationalActivitiesInternshipYearlySchedule/','График  на год',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (194,'EducationalActivitiesInternshipMonthlyPlan',59,187,'/EducationalActivitiesInternship/EducationalActivitiesInternshipMonthlyPlan/','План на месяц',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (195,'EducationalActivitiesInternshipCatalog',59,188,'/EducationalActivitiesInternship/EducationalActivitiesInternshipCatalog/','Аннотированный каталог',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (196,'EducationalActivitiesDistanceLearningContract',60,189,'/EducationalActivitiesDistanceLearning/EducationalActivitiesDistanceLearningContract/','Договор оферты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (197,'EducationalActivitiesDistanceLearningCatalog',60,190,'/EducationalActivitiesDistanceLearning/EducationalActivitiesDistanceLearningCatalog/','Аннотированный каталог (Описание и ссылка для перехода на http://elearn.irro.ru/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (198,'EducationalActivitiesExtrabudgetaryContract',61,191,'/EducationalActivitiesExtrabudgetary/EducationalActivitiesExtrabudgetaryContract/','Договор',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (199,'EducationalActivitiesExtrabudgetaryCatalog',61,192,'/EducationalActivitiesExtrabudgetary/EducationalActivitiesExtrabudgetaryCatalog/','Аннотированный каталог',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (200,'GraduatesJEGRegulatoryDocument',75,193,'/GraduatesJEG/GraduatesJEGRegulatoryDocument/','Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (201,'GraduatesJEGStatistics',75,194,'/GraduatesJEG/GraduatesJEGStatistics/','Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (202,'GraduatesJEGAnalytics',75,195,'/GraduatesJEG/GraduatesJEGAnalytics/','Аналитика (файлы, ссылки, например: http://ege.midural.ru/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (203,'GraduatesEGERegulatoryDocument',76,196,'/GraduatesEGE/GraduatesEGERegulatoryDocument/','Нормативные документы (файлы, ссылки, например: http://www.rustest.ru/ege/docs/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (204,'GraduatesEGEStatistics',76,197,'/GraduatesEGE/GraduatesEGEStatistics/','Статистика (текст на странице, файлы, ссылки, например: http://ege.midural.ru/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (205,'GraduatesEGEAnalytics',76,198,'/GraduatesEGE/GraduatesEGEAnalytics/','Аналитика (файлы, ссылки, например: http://ege.midural.ru/)',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (206,'ContinuingEducationActionPlan',211,199,'/ContinuingEducation/ContinuingEducationActionPlan/','План деятельности площадки',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (207,'ContinuingEducationSupport',211,200,'/ContinuingEducation/ContinuingEducationSupport/','Методическое обеспечение деятельности',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (208,'ContinuingEducationNews',211,201,'/ContinuingEducation/ContinuingEducationNews/','Новости проекта',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (209,'NewsAnnouncements',8,202,'/News/NewsAnnouncements/','Анонсы',1,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (210,'NewsArchive',8,203,'/News/NewsArchive/','Архив',1,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (211,'ContinuingEducation',7,204,'/ContinuingEducation/','Разработка и реализация региональной модели сопровождения профессионального самоопределения обучающи',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (212,'Contacts',4,205,'/Institute/Contacts/','Контакты',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (215,'InformationResources',14,206,'/Management/InformationResources/','Управление информационными ресурсами',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (216,'ExamAndMonitor',14,207,'/Management/ExamAndMonitor/','Управление экспертизы и мониторинга системы образования',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (217,'DocumentsControlMeasures',13,208,'/Documents/DocumentsControlMeasures/','Документы, составленные по итогам контрольных мероприятий',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (218,'DocumentsLaborLawRegulations',13,209,'/Documents/DocumentsLaborLawRegulations/','Документы, регулирующие трудовое право',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (219,'DocumentsPaidEducationalServices',13,210,'/Documents/DocumentsPaidEducationalServices/','Документы об оказании платных образовательных услуг',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (220,'DocumentsSupervisoryBoard',13,211,'/Documents/DocumentsSupervisoryBoard/','Документы наблюдательного совета',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (221,'DocumentsConstituent',13,212,'/Documents/DocumentsConstituent/','Учредительные документы',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (222,'DocumentsLicense',13,213,'/Documents/DocumentsLicense/','Лицензия',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (223,'RectorPhotoGallery',12,214,'/Rector/RectorPhotoGallery/','Фотогалерея',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (224,'RectorPublications',12,215,'/Rector/RectorPublications/','Издания и публикации',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (225,'RectorMediaReports',12,216,'/Rector/RectorMediaReports/','Доклады, выступления в СМИ',0,1);
INSERT INTO `MENU_INFO` (`MENU_ID`,`NAME`,`PARENT_ID`,`REF_ARTICLE_ID`,`DOC_LOCATION`,`LABEL`,`MENU_TYPE`,`IS_TREE`) VALUES (3,'ROOT',NULL,0,'EMPTY','ROOT',0,1);


/*
-- Query: SELECT * FROM IRRONEW.USER_GROUP
LIMIT 0, 1000

-- Date: 2014-04-21 17:32
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
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (90,'Hotel','Гостиница',1,'2014-04-07');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (91,'Online Resources','Интернет-ресурсы  ИРО',1,'2014-04-07');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (92,'InformationResources','Управление информационными ресурсами',1,'2014-04-07');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (94,'RectorMediaReports','Доклады, выступления в СМИ',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (95,'RectorPublications','Издания и публикации',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (96,'RectorPhotoGallery','Фотогалерея',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (97,'DocumentsLicense','Лицензия',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (98,'DocumentsConstituent','Учредительные документы',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (99,'DocumentsSupervisoryBoard','Документы наблюдательного совета',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (100,'DocumentsPaidEducationalServices','Документы об оказании платных образовательных услуг',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (101,'DocumentsLaborLawRegulations','Документы, регулирующие трудовое право',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (102,'DocumentsControlMeasures','Документы, составленные по итогам контрольных мероприятий',1,'2014-04-15');
INSERT INTO `USER_GROUP` (`GRP_ID`,`GRP_COD`,`GRP_NAME`,`IS_ACTIVE`,`CREATION_DATE`) VALUES (103,'ExamAndMonitor','Управление экспертизы и мониторинга системы образования',1,'2014-04-15');


