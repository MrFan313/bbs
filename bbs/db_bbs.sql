/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.5-10.4.14-MariaDB : Database - db_bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_bbs`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 分类管理',7,'add_categorymodel'),(26,'Can change 分类管理',7,'change_categorymodel'),(27,'Can delete 分类管理',7,'delete_categorymodel'),(28,'Can view 分类管理',7,'view_categorymodel'),(29,'Can add 文章管理',8,'add_articlemodel'),(30,'Can change 文章管理',8,'change_articlemodel'),(31,'Can delete 文章管理',8,'delete_articlemodel'),(32,'Can view 文章管理',8,'view_articlemodel'),(33,'Can add 评论管理',9,'add_commentmodel'),(34,'Can change 评论管理',9,'change_commentmodel'),(35,'Can delete 评论管理',9,'delete_commentmodel'),(36,'Can view 评论管理',9,'view_commentmodel'),(37,'Can add 用户管理',10,'add_user'),(38,'Can change 用户管理',10,'change_user'),(39,'Can delete 用户管理',10,'delete_user'),(40,'Can view 用户管理',10,'view_user');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$216000$aaceGyjGV22m$1jivdk1t+9PAeGLU0NPsGFSEZuh2GqgqgLgbXerXync=','2021-03-10 01:21:10.133712',1,'admin','','','admin@163.com',1,1,'2021-03-09 15:50:06.219828'),(2,'pbkdf2_sha256$216000$nc7qxVzHinc0$ggT4EGsS+qfr47wI5nCm57KAGHTVWk1+hFj5c0VD5fI=',NULL,0,'zhangsan','','','',0,1,'2021-03-10 01:25:34.197674');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2021-03-10 01:23:31.652182','1','干垃圾',1,'[{\"added\": {}}]',7,1),(2,'2021-03-10 01:23:44.254504','2','湿垃圾',1,'[{\"added\": {}}]',7,1),(3,'2021-03-10 01:24:12.089341','3','可回收物',1,'[{\"added\": {}}]',7,1),(4,'2021-03-10 01:24:23.600852','4','有害垃圾',1,'[{\"added\": {}}]',7,1),(5,'2021-03-10 01:25:34.534938','2','zhangsan',1,'[{\"added\": {}}]',4,1),(6,'2021-03-10 01:44:24.758682','1','可回收物有哪些',1,'[{\"added\": {}}]',8,1),(7,'2021-03-10 01:45:17.293555','2','旧衣物算可回收物吗?',1,'[{\"added\": {}}]',8,1),(8,'2021-03-10 01:45:48.373351','3','有害垃圾有什么?',1,'[{\"added\": {}}]',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'home','categorymodel'),(8,'home','articlemodel'),(9,'home','commentmodel'),(10,'users','user');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2021-03-09 15:49:25.290425'),(2,'auth','0001_initial','2021-03-09 15:49:25.581446'),(3,'admin','0001_initial','2021-03-09 15:49:27.147953'),(4,'admin','0002_logentry_remove_auto_add','2021-03-09 15:49:27.519497'),(5,'admin','0003_logentry_add_action_flag_choices','2021-03-09 15:49:27.527510'),(6,'contenttypes','0002_remove_content_type_name','2021-03-09 15:49:27.716781'),(7,'auth','0002_alter_permission_name_max_length','2021-03-09 15:49:27.836692'),(8,'auth','0003_alter_user_email_max_length','2021-03-09 15:49:27.941646'),(9,'auth','0004_alter_user_username_opts','2021-03-09 15:49:27.960606'),(10,'auth','0005_alter_user_last_login_null','2021-03-09 15:49:28.068826'),(11,'auth','0006_require_contenttypes_0002','2021-03-09 15:49:28.070801'),(12,'auth','0007_alter_validators_add_error_messages','2021-03-09 15:49:28.081771'),(13,'auth','0008_alter_user_username_max_length','2021-03-09 15:49:28.170180'),(14,'auth','0009_alter_user_last_name_max_length','2021-03-09 15:49:28.253622'),(15,'auth','0010_alter_group_name_max_length','2021-03-09 15:49:28.336264'),(16,'auth','0011_update_proxy_permissions','2021-03-09 15:49:28.344243'),(17,'auth','0012_alter_user_first_name_max_length','2021-03-09 15:49:28.435002'),(18,'users','0001_initial','2021-03-09 15:49:28.492810'),(19,'home','0001_initial','2021-03-09 15:49:28.570014'),(20,'home','0002_articlemodel','2021-03-09 15:49:28.796482'),(21,'home','0003_commentmodel','2021-03-09 15:49:29.182349'),(22,'sessions','0001_initial','2021-03-09 15:49:29.725192');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('ninpqi317pk51m6gjtgoqpuaxosz2ta5','.eJxVjsEOgjAQRP-lZ9OwS1kWj979BtJ2q1SxTSicjP8uTTjocWbeTOatRrut07iVsIxR1FmBOv16zvpnSDWQh033rH1O6xKdrog-0qKvWcJ8Odi_gcmWaW8zCd2YnW09Gs-hESbAlrERIm-GrrEdYg-hdQACEnDo0fQCZAYyXF8l-wr70hxL3FU9i58vfxA8cA:1lJnyL:PItaKoRD62dcF--JBfPPHn6qM1SPE-Y-TE-tOKdal-8','2021-03-24 01:49:13.872244');

/*Table structure for table `tb_article` */

DROP TABLE IF EXISTS `tb_article`;

CREATE TABLE `tb_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `publish_time` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `read_count` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_article_category_id_d66932e8` (`category_id`),
  KEY `tb_article_user_id_a61095b8` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_article` */

insert  into `tb_article`(`id`,`title`,`content`,`publish_time`,`status`,`read_count`,`comments`,`category_id`,`user_id`) values (1,'可回收物有哪些','可乐瓶','2021-03-10 01:44:24.754666',1,0,0,3,1),(2,'旧衣物算可回收物吗?','算,旧衣服,旧书本都是可回收物','2021-03-10 01:45:17.292586',1,0,0,3,1),(3,'有害垃圾有什么?','蓄电池','2021-03-10 01:45:48.372354',1,0,0,4,1);

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tb_category_parent_id_ed287214` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_category` */

insert  into `tb_category`(`id`,`name`,`parent_id`) values (1,'干垃圾',NULL),(2,'湿垃圾',NULL),(3,'可回收物',NULL),(4,'有害垃圾',NULL);

/*Table structure for table `tb_comment` */

DROP TABLE IF EXISTS `tb_comment`;

CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_comment_article_id_d3d5d1ea` (`article_id`),
  KEY `tb_comment_parent_id_9d1f1b9b` (`parent_id`),
  KEY `tb_comment_user_id_905a9388` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tb_comment` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`password`) values (1,'zhangsan','3ab7873060b6de9ca93b664e752bca6f'),(2,'lisi','ada6f2b5b7ba3f1531e4c1e291cbe7b0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
