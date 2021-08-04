# Host: localhost  (Version: 5.7.26)
# Date: 2021-08-04 17:30:24
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "applicants"
#

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE `applicants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` varchar(50) NOT NULL DEFAULT '' COMMENT '性别',
  `native_palace` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `date_of_birth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出生年月',
  `date_of_work_first` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '首次参加工作日期',
  `highest_education` varchar(50) NOT NULL DEFAULT '' COMMENT '最高学历',
  `graduation_school` varchar(50) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `graduation_major` varchar(50) NOT NULL DEFAULT '' COMMENT '毕业专业',
  `date_graduation` int(11) NOT NULL DEFAULT '0' COMMENT '毕业时间',
  `recent_work` varchar(255) DEFAULT NULL COMMENT '最近任职工作单位',
  `phone` char(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `application_department` varchar(50) NOT NULL DEFAULT '' COMMENT '应聘部门',
  `application_position` varchar(50) NOT NULL DEFAULT '' COMMENT '应聘岗位',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '简历投递时间',
  `source` varchar(50) DEFAULT NULL COMMENT '简历来源',
  `recommend_department` varchar(50) DEFAULT NULL COMMENT '推荐部门',
  `trainee` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1：正式员工；2：实习生',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0：待审核；1：待面试；2：已面试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应聘者信息表';

#
# Data for table "applicants"
#


#
# Structure for table "book"
#

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "book"
#


#
# Structure for table "departments"
#

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `interviewer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '负责人姓名',
  `lin_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联lin_user表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

#
# Data for table "departments"
#

INSERT INTO `departments` VALUES (1,'政府旅游营销中心','马凌霄',7),(2,'科技金融事业部','周晓楠',8),(3,'新闻运营部','马晓曼',11);

#
# Structure for table "evaluates"
#

DROP TABLE IF EXISTS `evaluates`;
CREATE TABLE `evaluates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `applicants_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联applicants表id',
  `lin_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联面试官表id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '面试官姓名',
  `work_experience` varchar(255) DEFAULT NULL COMMENT '工作经验',
  `communication` varchar(255) DEFAULT NULL COMMENT '交流沟通能力',
  `analyze_and_slove` varchar(255) DEFAULT NULL COMMENT '分析和解决问题能力',
  `profession` varchar(255) DEFAULT NULL COMMENT '专业技能、学习能力',
  `team_spirit` varchar(255) DEFAULT NULL COMMENT '团队精神',
  `quality` varchar(255) DEFAULT NULL COMMENT '职业素质',
  `matching` varchar(255) DEFAULT NULL COMMENT '与岗位的匹配程度',
  `advantage` text COMMENT '优点、可取之处',
  `shortcoming` text COMMENT '缺点、需改进',
  `result` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1：通过；2：未通过',
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面试评析表';

#
# Data for table "evaluates"
#


#
# Structure for table "interview_arrangement"
#

DROP TABLE IF EXISTS `interview_arrangement`;
CREATE TABLE `interview_arrangement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `applicants_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联applicants表id',
  `lin_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联lin_user表id',
  `interview_name` varchar(50) NOT NULL DEFAULT '' COMMENT '面试官姓名',
  `result` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1：通过；2：未通过',
  `appointment_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间',
  `actual_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际抵达时间',
  `recommend_department` varchar(50) DEFAULT NULL COMMENT '推荐部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面试安排表';

#
# Data for table "interview_arrangement"
#


#
# Structure for table "lin_file"
#

DROP TABLE IF EXISTS `lin_file`;
CREATE TABLE `lin_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'LOCAL' COMMENT 'LOCAL 本地，REMOTE 远程',
  `name` varchar(100) NOT NULL,
  `extension` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `md5` varchar(40) DEFAULT NULL COMMENT 'md5值，防止上传重复文件',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5_del` (`md5`,`delete_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_file"
#


#
# Structure for table "lin_group"
#

DROP TABLE IF EXISTS `lin_group`;
CREATE TABLE `lin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint(2) NOT NULL DEFAULT '3' COMMENT '分组级别 1：root 2：guest 3：user（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_del` (`name`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_group"
#

INSERT INTO `lin_group` VALUES (1,'root','超级用户组',1,'2021-05-24 11:21:11.804','2021-05-24 11:21:11.804',NULL),(2,'测试组','测试组',2,'2021-05-24 11:21:11.806','2021-07-19 18:58:56.982',NULL),(3,'科技金融事业部','科技金融事业部',3,'2021-07-15 16:39:38.743','2021-07-15 16:39:38.743',NULL),(4,'新闻运营部','新闻运营部',3,'2021-07-15 16:40:45.462','2021-07-15 16:40:45.462',NULL),(5,'政府旅游营销中心','政府旅游营销中心',3,'2021-07-15 16:46:42.008','2021-07-15 16:46:42.008',NULL),(6,'HR','HR',3,'2021-07-15 16:56:21.292','2021-07-15 16:56:21.293',NULL),(7,'公司','超级管理组',3,'2021-07-19 18:59:21.554','2021-07-19 18:59:21.554',NULL);

#
# Structure for table "lin_group_permission"
#

DROP TABLE IF EXISTS `lin_group_permission`;
CREATE TABLE `lin_group_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL COMMENT '分组id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_group_permission"
#

INSERT INTO `lin_group_permission` VALUES (1,2,4),(2,3,6),(3,4,6),(4,5,6),(6,6,6),(7,6,10),(8,6,11),(9,6,12),(10,6,7),(11,6,8),(12,6,9),(13,5,12),(14,5,8),(15,5,9),(16,4,12),(17,4,8),(18,4,9),(19,3,12),(20,3,8),(21,3,9),(22,7,1),(23,7,2),(24,7,3),(25,7,6),(26,7,7),(27,7,8),(28,7,9),(29,7,10),(30,7,11),(31,7,12);

#
# Structure for table "lin_log"
#

DROP TABLE IF EXISTS `lin_log`;
CREATE TABLE `lin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(450) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(24) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_log"
#

INSERT INTO `lin_log` VALUES (1,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-05-24 12:14:15.411','2021-05-24 12:14:15.411',NULL),(2,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-05-24 14:26:58.237','2021-05-24 14:26:58.237',NULL),(3,'root新建了用户：邓楚衡',1,'root',200,'POST','/cms/user/register',NULL,'2021-05-25 16:12:14.797','2021-05-25 16:12:14.797',NULL),(4,'root更新了id为2的分组',1,'root',200,'PUT','/cms/admin/group/2',NULL,'2021-05-25 17:03:29.718','2021-05-25 17:03:29.718',NULL),(5,'root修改了分组ID为2的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-05-25 17:46:11.641','2021-05-25 17:46:11.641',NULL),(6,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-05-25 17:51:57.426','2021-05-25 17:51:57.426',NULL),(7,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 17:58:22.382','2021-06-30 17:58:22.382',NULL),(8,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:00:12.383','2021-06-30 18:00:12.383',NULL),(9,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:27:24.807','2021-06-30 18:27:24.807',NULL),(10,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:28:53.796','2021-06-30 18:28:53.796',NULL),(11,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:28:53.937','2021-06-30 18:28:53.937',NULL),(12,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:29:52.659','2021-06-30 18:29:52.659',NULL),(13,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:35:35.803','2021-06-30 18:35:35.803',NULL),(14,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:36:38.791','2021-06-30 18:36:38.791',NULL),(15,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:40:58.592','2021-06-30 18:40:58.592',NULL),(16,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:41:19.775','2021-06-30 18:41:19.775',NULL),(17,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:42:23.565','2021-06-30 18:42:23.565',NULL),(18,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:42:49.904','2021-06-30 18:42:49.904',NULL),(19,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:50:09.051','2021-06-30 18:50:09.051',NULL),(20,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:50:26.721','2021-06-30 18:50:26.721',NULL),(21,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:54:51.112','2021-06-30 18:54:51.112',NULL),(22,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:56:37.432','2021-06-30 18:56:37.432',NULL),(23,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:57:15.653','2021-06-30 18:57:15.653',NULL),(24,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:58:33.747','2021-06-30 18:58:33.747',NULL),(25,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:59:02.033','2021-06-30 18:59:02.033',NULL),(26,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:59:29.097','2021-06-30 18:59:29.097',NULL),(27,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 18:59:48.819','2021-06-30 18:59:48.819',NULL),(28,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 19:01:23.253','2021-06-30 19:01:23.253',NULL),(29,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 19:02:58.583','2021-06-30 19:02:58.583',NULL),(30,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-06-30 19:05:41.729','2021-06-30 19:05:41.729',NULL),(31,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 13:56:23.138','2021-07-01 13:56:23.138',NULL),(32,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 13:56:45.698','2021-07-01 13:56:45.698',NULL),(33,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:01:49.223','2021-07-01 14:01:49.223',NULL),(34,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:12:56.826','2021-07-01 14:12:56.826',NULL),(35,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:17:27.862','2021-07-01 14:17:27.862',NULL),(36,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:17:51.181','2021-07-01 14:17:51.181',NULL),(37,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:22:47.765','2021-07-01 14:22:47.765',NULL),(38,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:24:57.921','2021-07-01 14:24:57.921',NULL),(39,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:27:46.869','2021-07-01 14:27:46.869',NULL),(40,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:27:59.641','2021-07-01 14:27:59.641',NULL),(41,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:28:29.092','2021-07-01 14:28:29.092',NULL),(42,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:28:50.471','2021-07-01 14:28:50.471',NULL),(43,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:29:02.434','2021-07-01 14:29:02.434',NULL),(44,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:30:23.966','2021-07-01 14:30:23.966',NULL),(45,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:30:46.469','2021-07-01 14:30:46.469',NULL),(46,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:38:26.908','2021-07-01 14:38:26.908',NULL),(47,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:38:52.549','2021-07-01 14:38:52.549',NULL),(48,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:40:04.981','2021-07-01 14:40:04.981',NULL),(49,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:40:49.510','2021-07-01 14:40:49.510',NULL),(50,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:41:06.977','2021-07-01 14:41:06.977',NULL),(51,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:56:49.092','2021-07-01 14:56:49.092',NULL),(52,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:06.530','2021-07-01 14:57:06.530',NULL),(53,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:40.110','2021-07-01 14:57:40.110',NULL),(54,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:44.551','2021-07-01 14:57:44.551',NULL),(55,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:48.280','2021-07-01 14:57:48.280',NULL),(56,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:52.340','2021-07-01 14:57:52.340',NULL),(57,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:55.844','2021-07-01 14:57:55.844',NULL),(58,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:57:58.424','2021-07-01 14:57:58.424',NULL),(59,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:58:00.494','2021-07-01 14:58:00.494',NULL),(60,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:58:03.451','2021-07-01 14:58:03.452',NULL),(61,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:58:06.094','2021-07-01 14:58:06.094',NULL),(62,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:58:08.690','2021-07-01 14:58:08.690',NULL),(63,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:58:33.528','2021-07-01 14:58:33.528',NULL),(64,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 14:59:33.763','2021-07-01 14:59:33.763',NULL),(65,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 15:01:34.500','2021-07-01 15:01:34.500',NULL),(66,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 15:01:43.293','2021-07-01 15:01:43.293',NULL),(67,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 15:22:51.191','2021-07-01 15:22:51.191',NULL),(68,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 15:24:49.156','2021-07-01 15:24:49.156',NULL),(69,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 15:32:51.293','2021-07-01 15:32:51.293',NULL),(70,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-01 16:02:21.192','2021-07-01 16:02:21.192',NULL),(71,'root修改了用户ID为2的密码',1,'root',200,'PUT','/cms/admin/user/2/password',NULL,'2021-07-01 17:10:42.795','2021-07-01 17:10:42.795',NULL),(72,'邓楚衡登陆成功获取了令牌',2,'邓楚衡',200,'POST','/cms/user/login',NULL,'2021-07-01 17:11:04.897','2021-07-01 17:11:04.897',NULL),(73,'邓楚衡登陆成功获取了令牌',2,'邓楚衡',200,'POST','/cms/user/login',NULL,'2021-07-01 17:18:33.622','2021-07-01 17:18:33.622',NULL),(74,'邓楚衡登陆成功获取了令牌',2,'邓楚衡',200,'POST','/cms/user/login',NULL,'2021-07-01 17:19:06.059','2021-07-01 17:19:06.059',NULL),(75,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-05 10:40:58.359','2021-07-05 10:40:58.359',NULL),(76,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-08 18:31:47.823','2021-07-08 18:31:47.823',NULL),(77,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-15 16:28:34.995','2021-07-15 16:28:34.995',NULL),(78,'root更新了id为2的分组',1,'root',200,'PUT','/cms/admin/group/2',NULL,'2021-07-15 16:30:23.029','2021-07-15 16:30:23.029',NULL),(79,'root创建了分组：科技金融事业部',1,'root',200,'POST','/cms/admin/group',NULL,'2021-07-15 16:39:38.871','2021-07-15 16:39:38.871',NULL),(80,'root创建了分组：新闻运营部',1,'root',200,'POST','/cms/admin/group',NULL,'2021-07-15 16:40:45.530','2021-07-15 16:40:45.530',NULL),(81,'root更新了id为2的分组',1,'root',200,'PUT','/cms/admin/group/2',NULL,'2021-07-15 16:46:13.963','2021-07-15 16:46:13.963',NULL),(82,'root创建了分组：政府旅游营销中心',1,'root',200,'POST','/cms/admin/group',NULL,'2021-07-15 16:46:42.143','2021-07-15 16:46:42.143',NULL),(83,'root新建了用户：刘欣竹',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 16:53:31.308','2021-07-15 16:53:31.308',NULL),(84,'root创建了分组：HR',1,'root',200,'POST','/cms/admin/group',NULL,'2021-07-15 16:56:21.454','2021-07-15 16:56:21.455',NULL),(85,'root新建了用户：张慧灵',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 16:56:58.602','2021-07-15 16:56:58.602',NULL),(86,'root新建了用户：赖王茹',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 16:58:06.209','2021-07-15 16:58:06.209',NULL),(87,'root新建了用户：屠梦琳',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 16:58:54.431','2021-07-15 16:58:54.431',NULL),(88,'root新建了用户：马凌霄',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 16:59:23.648','2021-07-15 16:59:23.648',NULL),(89,'root新建了用户：周晓楠',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 17:00:24.887','2021-07-15 17:00:24.887',NULL),(90,'root新建了用户：颜晨怡',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 17:01:13.298','2021-07-15 17:01:13.298',NULL),(91,'root新建了用户：周佳妮',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 17:01:43.783','2021-07-15 17:01:43.783',NULL),(92,'root新建了用户：马晓曼',1,'root',200,'POST','/cms/user/register',NULL,'2021-07-15 17:02:45.614','2021-07-15 17:02:45.614',NULL),(93,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-16 13:55:44.996','2021-07-16 13:55:44.996',NULL),(94,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-16 16:23:17.067','2021-07-16 16:23:17.067',NULL),(95,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-16 16:34:49.422','2021-07-16 16:34:49.422',NULL),(96,'屠梦琳登陆成功获取了令牌',6,'屠梦琳',200,'POST','/cms/user/login',NULL,'2021-07-16 17:16:55.535','2021-07-16 17:16:55.535',NULL),(97,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-16 17:19:40.972','2021-07-16 17:19:40.972',NULL),(98,'屠梦琳登陆成功获取了令牌',6,'屠梦琳',200,'POST','/cms/user/login',NULL,'2021-07-16 18:04:22.364','2021-07-16 18:04:22.364',NULL),(99,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-16 18:05:46.434','2021-07-16 18:05:46.434',NULL),(100,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 16:25:53.908','2021-07-19 16:25:53.908',NULL),(101,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-19 16:52:27.016','2021-07-19 16:52:27.016',NULL),(102,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-19 18:13:48.988','2021-07-19 18:13:48.988',NULL),(103,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:33:50.938','2021-07-19 18:33:50.938',NULL),(104,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:34:09.522','2021-07-19 18:34:09.522',NULL),(105,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:35:28.063','2021-07-19 18:35:28.063',NULL),(106,'root修改了分组ID为6的权限',1,'root',200,'POST','/cms/admin/permission/remove',NULL,'2021-07-19 18:36:33.938','2021-07-19 18:36:33.938',NULL),(107,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:37:52.225','2021-07-19 18:37:52.225',NULL),(108,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:37:54.512','2021-07-19 18:37:54.512',NULL),(109,'root修改了分组ID为6的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-07-19 18:38:42.653','2021-07-19 18:38:42.653',NULL),(110,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-19 18:39:13.647','2021-07-19 18:39:13.647',NULL),(111,'root修改了分组ID为6的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-07-19 18:46:14.793','2021-07-19 18:46:14.793',NULL),(112,'root修改了分组ID为5的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-07-19 18:46:37.206','2021-07-19 18:46:37.206',NULL),(113,'root修改了分组ID为4的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-07-19 18:46:49.356','2021-07-19 18:46:49.356',NULL),(114,'root修改了分组ID为3的权限',1,'root',200,'POST','/cms/admin/permission/dispatch/batch',NULL,'2021-07-19 18:47:01.639','2021-07-19 18:47:01.639',NULL),(115,'马凌霄登陆成功获取了令牌',7,'马凌霄',200,'POST','/cms/user/login',NULL,'2021-07-19 18:54:14.670','2021-07-19 18:54:14.670',NULL),(116,'刘欣竹登陆成功获取了令牌',3,'刘欣竹',200,'POST','/cms/user/login',NULL,'2021-07-19 18:54:58.983','2021-07-19 18:54:58.983',NULL),(117,'刘欣竹登陆成功获取了令牌',3,'刘欣竹',200,'POST','/cms/user/login',NULL,'2021-07-19 18:56:44.076','2021-07-19 18:56:44.076',NULL),(118,'刘欣竹登陆成功获取了令牌',3,'刘欣竹',200,'POST','/cms/user/login',NULL,'2021-07-19 18:56:47.260','2021-07-19 18:56:47.260',NULL),(119,'root更新了id为2的分组',1,'root',200,'PUT','/cms/admin/group/2',NULL,'2021-07-19 18:58:57.033','2021-07-19 18:58:57.033',NULL),(120,'root创建了分组：公司',1,'root',200,'POST','/cms/admin/group',NULL,'2021-07-19 18:59:21.685','2021-07-19 18:59:21.686',NULL),(121,'root更新了用户：2的所属分组',1,'root',200,'PUT','/cms/admin/user/2',NULL,'2021-07-19 18:59:39.246','2021-07-19 18:59:39.246',NULL),(122,'root更新了用户：3的所属分组',1,'root',200,'PUT','/cms/admin/user/3',NULL,'2021-07-19 18:59:44.635','2021-07-19 18:59:44.635',NULL),(123,'刘欣竹登陆成功获取了令牌',3,'刘欣竹',200,'POST','/cms/user/login',NULL,'2021-07-19 18:59:49.873','2021-07-19 18:59:49.873',NULL),(124,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 15:06:03.648','2021-07-20 15:06:03.648',NULL),(125,'赖王茹登陆成功获取了令牌',5,'赖王茹',200,'POST','/cms/user/login',NULL,'2021-07-20 15:08:30.158','2021-07-20 15:08:30.158',NULL),(126,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 15:08:55.743','2021-07-20 15:08:55.743',NULL),(127,'赖王茹登陆成功获取了令牌',5,'赖王茹',200,'POST','/cms/user/login',NULL,'2021-07-20 17:26:37.465','2021-07-20 17:26:37.465',NULL),(128,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 17:27:38.952','2021-07-20 17:27:38.952',NULL),(129,'赖王茹登陆成功获取了令牌',5,'赖王茹',200,'POST','/cms/user/login',NULL,'2021-07-20 17:28:34.245','2021-07-20 17:28:34.245',NULL),(130,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:26:57.112','2021-07-20 18:26:57.112',NULL),(131,'周晓楠登陆成功获取了令牌',8,'周晓楠',200,'POST','/cms/user/login',NULL,'2021-07-20 18:31:06.030','2021-07-20 18:31:06.030',NULL),(132,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:32:28.643','2021-07-20 18:32:28.643',NULL),(133,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:36:24.838','2021-07-20 18:36:24.838',NULL),(134,'颜晨怡登陆成功获取了令牌',9,'颜晨怡',200,'POST','/cms/user/login',NULL,'2021-07-20 18:49:37.029','2021-07-20 18:49:37.029',NULL),(135,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:51:01.567','2021-07-20 18:51:01.567',NULL),(136,'马晓曼登陆成功获取了令牌',11,'马晓曼',200,'POST','/cms/user/login',NULL,'2021-07-20 18:52:09.572','2021-07-20 18:52:09.572',NULL),(137,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:53:46.399','2021-07-20 18:53:46.399',NULL),(138,'刘欣竹登陆成功获取了令牌',3,'刘欣竹',200,'POST','/cms/user/login',NULL,'2021-07-20 18:54:44.227','2021-07-20 18:54:44.227',NULL),(139,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 18:55:57.514','2021-07-20 18:55:57.514',NULL),(140,'马凌霄登陆成功获取了令牌',7,'马凌霄',200,'POST','/cms/user/login',NULL,'2021-07-20 18:58:58.996','2021-07-20 18:58:58.996',NULL),(141,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 19:00:05.952','2021-07-20 19:00:05.952',NULL),(142,'杨昆昆登陆成功获取了令牌',2,'杨昆昆',200,'POST','/cms/user/login',NULL,'2021-07-20 19:00:58.102','2021-07-20 19:00:58.102',NULL),(143,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 19:01:57.121','2021-07-20 19:01:57.121',NULL),(144,'周晓楠登陆成功获取了令牌',8,'周晓楠',200,'POST','/cms/user/login',NULL,'2021-07-20 19:12:00.134','2021-07-20 19:12:00.134',NULL),(145,'张慧灵登陆成功获取了令牌',4,'张慧灵',200,'POST','/cms/user/login',NULL,'2021-07-20 19:12:48.375','2021-07-20 19:12:48.375',NULL),(146,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-28 11:21:38.818','2021-07-28 11:21:38.818',NULL),(147,'root登陆成功获取了令牌',1,'root',200,'POST','/cms/user/login',NULL,'2021-07-28 12:57:05.379','2021-07-28 12:57:05.379',NULL);

#
# Structure for table "lin_permission"
#

DROP TABLE IF EXISTS `lin_permission`;
CREATE TABLE `lin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_permission"
#

INSERT INTO `lin_permission` VALUES (1,'查询所有日志','日志',1,'2021-05-25 16:10:26.892','2021-05-25 16:10:26.893',NULL),(2,'搜索日志','日志',1,'2021-05-25 16:10:26.984','2021-05-25 16:10:26.984',NULL),(3,'查询日志记录的用户','日志',1,'2021-05-25 16:10:27.058','2021-05-25 16:10:27.058',NULL),(4,'删除图书','图书',0,'2021-05-25 16:10:27.094','2021-05-25 18:07:55.197',NULL),(5,'查询所有可分配的权限','管理员',0,'2021-05-25 17:50:43.939','2021-05-25 18:07:58.456',NULL),(6,'获取简历信息','简历',1,'2021-05-25 18:03:54.951','2021-05-25 18:03:54.951',NULL),(7,'编辑简历','简历',1,'2021-07-19 18:40:16.410','2021-07-19 18:40:16.410',NULL),(8,'评析','评析',1,'2021-07-19 18:45:41.281','2021-07-19 18:45:41.281',NULL),(9,'查看评析','评析',1,'2021-07-19 18:45:41.414','2021-07-19 18:45:41.414',NULL),(10,'预约面试','面试',1,'2021-07-19 18:45:41.486','2021-07-19 18:45:41.486',NULL),(11,'签到','面试',1,'2021-07-19 18:45:41.557','2021-07-19 18:45:41.557',NULL),(12,'面试进度','面试',1,'2021-07-19 18:45:41.594','2021-07-19 18:45:41.594',NULL);

#
# Structure for table "lin_user"
#

DROP TABLE IF EXISTS `lin_user`;
CREATE TABLE `lin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_del` (`username`,`delete_time`),
  UNIQUE KEY `email_del` (`email`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_user"
#

INSERT INTO `lin_user` VALUES (1,'root','root',NULL,NULL,'2021-05-24 11:21:11.787','2021-05-24 11:21:11.787',NULL),(2,'杨昆昆',NULL,NULL,'','2021-05-25 16:12:14.695','2021-07-15 16:47:18.978',NULL),(3,'刘欣竹',NULL,NULL,'655464@qq.com','2021-07-15 16:53:30.951','2021-07-15 16:53:30.951',NULL),(4,'张慧灵',NULL,NULL,'165465@qq.com','2021-07-15 16:56:58.329','2021-07-15 16:56:58.329',NULL),(5,'赖王茹',NULL,NULL,'65464@qq.com','2021-07-15 16:58:06.084','2021-07-15 16:58:06.084',NULL),(6,'屠梦琳',NULL,NULL,'4645645@qq.com','2021-07-15 16:58:54.216','2021-07-15 16:58:54.216',NULL),(7,'马凌霄',NULL,NULL,'486516@qq.com','2021-07-15 16:59:23.503','2021-07-15 16:59:23.503',NULL),(8,'周晓楠',NULL,NULL,'48661@qq.com','2021-07-15 17:00:24.582','2021-07-15 17:00:24.582',NULL),(9,'颜晨怡',NULL,NULL,'16513@qq.com','2021-07-15 17:01:13.162','2021-07-15 17:01:13.162',NULL),(10,'周佳妮',NULL,NULL,'46546@qq.com','2021-07-15 17:01:43.681','2021-07-15 17:01:43.681',NULL),(11,'马晓曼',NULL,NULL,'1654654@qq.com','2021-07-15 17:02:45.301','2021-07-15 17:02:45.301',NULL);

#
# Structure for table "lin_user_group"
#

DROP TABLE IF EXISTS `lin_user_group`;
CREATE TABLE `lin_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(10) unsigned NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`),
  KEY `user_id_group_id` (`user_id`,`group_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_user_group"
#

INSERT INTO `lin_user_group` VALUES (1,1,1),(4,4,6),(5,5,5),(6,6,5),(7,7,5),(8,8,3),(9,9,4),(10,10,4),(11,11,4),(12,2,7),(13,3,7);

#
# Structure for table "lin_user_identity"
#

DROP TABLE IF EXISTS `lin_user_identity`;
CREATE TABLE `lin_user_identity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) NOT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `credential` varchar(100) DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

#
# Data for table "lin_user_identity"
#

INSERT INTO `lin_user_identity` VALUES (1,1,'USERNAME_PASSWORD','root','e10adc3949ba59abbe56e057f20f883e','2021-05-24 11:21:11.802','2021-05-24 11:21:11.802',NULL),(2,2,'USERNAME_PASSWORD','杨昆昆','e10adc3949ba59abbe56e057f20f883e','2021-05-25 16:12:14.740','2021-07-15 16:47:25.098',NULL),(3,3,'USERNAME_PASSWORD','刘欣竹','e10adc3949ba59abbe56e057f20f883e','2021-07-15 16:53:31.151','2021-07-15 16:53:31.151',NULL),(4,4,'USERNAME_PASSWORD','张慧灵','e10adc3949ba59abbe56e057f20f883e','2021-07-15 16:56:58.334','2021-07-15 16:56:58.334',NULL),(5,5,'USERNAME_PASSWORD','赖王茹','e10adc3949ba59abbe56e057f20f883e','2021-07-15 16:58:06.088','2021-07-15 16:58:06.088',NULL),(6,6,'USERNAME_PASSWORD','屠梦琳','e10adc3949ba59abbe56e057f20f883e','2021-07-15 16:58:54.218','2021-07-15 16:58:54.218',NULL),(7,7,'USERNAME_PASSWORD','马凌霄','e10adc3949ba59abbe56e057f20f883e','2021-07-15 16:59:23.507','2021-07-15 16:59:23.507',NULL),(8,8,'USERNAME_PASSWORD','周晓楠','e10adc3949ba59abbe56e057f20f883e','2021-07-15 17:00:24.585','2021-07-15 17:00:24.585',NULL),(9,9,'USERNAME_PASSWORD','颜晨怡','e10adc3949ba59abbe56e057f20f883e','2021-07-15 17:01:13.165','2021-07-15 17:01:13.165',NULL),(10,10,'USERNAME_PASSWORD','周佳妮','e10adc3949ba59abbe56e057f20f883e','2021-07-15 17:01:43.685','2021-07-15 17:01:43.685',NULL),(11,11,'USERNAME_PASSWORD','马晓曼','e10adc3949ba59abbe56e057f20f883e','2021-07-15 17:02:45.305','2021-07-15 17:02:45.305',NULL);

#
# Structure for table "positions"
#

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departments_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联departments表id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `interviewer_name` varchar(50) DEFAULT NULL COMMENT '岗位面试官姓名',
  `lin_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联lin_user表id',
  `internship` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1：正式岗；2：实习岗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='岗位表';

#
# Data for table "positions"
#

INSERT INTO `positions` VALUES (1,1,'商务合作经理一组','赖王茹',5,1),(2,1,'商务合作经理二组','屠梦琳',6,1),(3,2,'大客户销售经理一组',NULL,0,1),(4,2,'大客户销售经理二组',NULL,0,1),(5,2,'销售助理',NULL,0,1),(6,3,'编辑助理一组','颜晨怡',9,2),(7,3,'编辑助理二组','周佳妮',10,2);
