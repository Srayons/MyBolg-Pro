/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.56 : Database - mybolg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybolg` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybolg`;

/*Table structure for table `admin_menu` */

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '目录编号',
  `m_name` varchar(50) NOT NULL COMMENT '目录名称',
  `m_icon` varchar(255) NOT NULL COMMENT '目录图标',
  `m_pid` bigint(20) NOT NULL DEFAULT '-1' COMMENT '目录上一级',
  `m_url` varchar(255) NOT NULL DEFAULT 'javascript:void();' COMMENT '目录的菜单',
  `m_sort` varchar(255) NOT NULL DEFAULT '1' COMMENT '目录顺序',
  `m_createdate` date NOT NULL COMMENT '目录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`m_name`,`m_icon`,`m_pid`,`m_url`,`m_sort`,`m_createdate`) values (1,'文章管理','#iconwindows',4,'/art/art_list.html','1','2020-05-23'),(2,'文件管理','#iconwindows',4,'javascript:void();','1','2020-05-23'),(3,'音乐管理','#iconwindows',-1,'javascript:void();','2','2020-05-23'),(4,'系统管理','#iconwindows',-1,'javascript:void();','3','2020-05-23'),(5,'权限管理','#iconwindows',4,'javascript:void();','2','2020-05-23'),(6,'菜单管理','#iconwindows',-1,'/menu/m_list.html','2','2020-05-26'),(7,'前台菜单','#iconwindows',6,'/menu/m_list.html','2','2020-05-26'),(8,'后台菜单','#iconwindows',6,'/menu/m_list.html','1','2020-05-26');

/*Table structure for table `b_article` */

DROP TABLE IF EXISTS `b_article`;

CREATE TABLE `b_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title` varchar(1000) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `contentTxt` text COMMENT '文章文本内容',
  `author_id` bigint(20) NOT NULL COMMENT '作者编号',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
  `createdate` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `b_user` (`id`),
  CONSTRAINT `menu_id` FOREIGN KEY (`menu_id`) REFERENCES `b_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `b_article` */

insert  into `b_article`(`id`,`title`,`content`,`contentTxt`,`author_id`,`menu_id`,`createdate`) values (7,'今日----Alibaba----上市','<p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, Microsoft YaHei; font-size: 18px;\">人在江湖飘啊，哪能不挨刀啊。</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span style=\"font-family: 微软雅黑, Microsoft YaHei; font-size: 18px;\">....啊实打实大 <img src=\"http://localhost:8082/mybolg/static/uedit/dialogs/emotion/images/jx2/j_0001.gif\"/><br/></span></p></li><li><p><span style=\"font-family: 微软雅黑, Microsoft YaHei; font-size: 18px;\">.....人哪。阿斯顿撒旦<img src=\"http://localhost:8082/mybolg/static/uedit/dialogs/emotion/images/jx2/j_0003.gif\"/></span></p></li></ol><p><span style=\"font-family: 微软雅黑, Microsoft YaHei; font-size: 18px;\"><br/></span></p>','人在江湖飘啊，哪能不挨刀啊。....啊实打实大 .....人哪。阿斯顿撒旦',6,2,'2020-05-31'),(9,'Java基础---------Java的基本数据类型有八种','<p><br/></p><h4><span style=\"text-decoration: none; color: rgb(79, 129, 189); font-family: 微软雅黑, Microsoft YaHei; font-size: 24px;\">&nbsp; &nbsp;java的基本数据类型有八种：\r\n &nbsp; </span><span style=\"text-decoration: none; color: rgb(79, 129, 189); font-family: 微软雅黑, Microsoft YaHei; font-size: 20px;\">&nbsp;</span></h4><p><br/></p><p><span style=\"color: rgb(255, 0, 0); font-size: 18px;\">1、整数类型(byte、short、int、long)： </span><span style=\"color: rgb(255, 0, 0);\">&nbsp;&nbsp; </span><br/></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;byte：8 \r\n位，用于表示最小数据单位，如文件中数据，-128~127 &nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;short：16 位，很少用，-32768 ~ 32767 &nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;int：32 \r\n位、最常用，-2^31-1~2^31&nbsp; （21 亿） &nbsp;</span>&nbsp; <br/></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;long：64 位、次常用 &nbsp;&nbsp; 注意事项： &nbsp;&nbsp; int i=5; // 5 \r\n叫直接量（或字面量），即 直接写出的常数。 &nbsp;&nbsp; 整数字面量默认都为 int 类型，所以在定义的 long 型数据后面加 L或 l。 &nbsp;&nbsp; 小于\r\n 32 位数的变量，都按 int 结果计算。 &nbsp;&nbsp; 强转符比数学运算符优先级高。见常量与变量中的例子。</span></p><p>&nbsp;</p><p><span style=\"color: rgb(255, 0, 0); font-size: 18px;\">2、浮点数类型(float、double)： &nbsp;&nbsp; </span><br/></p><p>&nbsp;&nbsp;&nbsp;<span style=\"font-size: 14px;\">&nbsp;float：32 位，后缀 F 或 f，1 位符号位，8 位指数，23 \r\n位有效尾数。 &nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;double：64 位，最常用，后缀 D 或 d，1 位符号位，11 位指数，52 位有效尾 &nbsp;&nbsp; 注意事项： &nbsp;&nbsp; 二 进\r\n 制 浮 点 数 ： \r\n1010100010=101010001.0*2=10101000.10*2^10（2次方)=1010100.010*2^11(3次方)= . \r\n1010100010*2^1010(10次方) &nbsp;&nbsp; 尾数：&nbsp; . 1010100010&nbsp;&nbsp; 指数：1010&nbsp;&nbsp; 基数：2 &nbsp;&nbsp; \r\n浮点数字面量默认都为 double 类型，所以在定义的 float 型数据后面加F 或 f；double 类型可不写后缀，但在小数计算中一定要写\r\n D 或 X.X &nbsp;&nbsp; float&nbsp; 的精度没有 long 高，有效位数（尾数）短。 &nbsp;&nbsp; float&nbsp; 的范围大于 long&nbsp; 指数可以很大。\r\n &nbsp;&nbsp; 浮点数是不精确的，不能对浮点数进行精确比较。</span></p><p>&nbsp;</p><p><span style=\"font-size: 18px;\"><span style=\"color: rgb(255, 0, 0);\">3、字符类型(char)： </span>&nbsp;</span>&nbsp; <br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 14px;\">char：16 位，是整数类型，用单引号括起来的 1 个字符（可以是一个中文字符），使用 \r\nUnicode 码代表字符，0~2^16-1（65535） 。 &nbsp;&nbsp; 注意事项： &nbsp;&nbsp; 不能为 0个字符。 &nbsp;&nbsp; 转义字符：\\n&nbsp; 换行&nbsp; \r\n\\r&nbsp; 回车&nbsp; \\t Tab 字符&nbsp; \\&quot; 双引号&nbsp; \\\\ 表示一个\\ &nbsp;&nbsp; 两字符 char 中间用“+”连接，内部先把字符转成 int \r\n类型，再进行加法运算，char 本质就是个数！二进制的，显示的时候，经过“处理”显示为字符。</span></p><p>&nbsp;</p><p><span style=\"color: rgb(255, 0, 0); font-size: 18px;\">4、布尔类型(boolean)：</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 14px;\">true 真&nbsp; 和 false 假。</span></p><p>&nbsp;</p><p><span style=\"color: rgb(255, 0, 0); font-size: 18px;\">5、类型转换：</span><span style=\"color: rgb(255, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 14px;\">char--&gt; &nbsp;&nbsp; \r\n自动转换：byte--&gt;short--&gt;int--&gt;long--&gt;float--&gt;double&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n &nbsp;&nbsp; 强制转换：①会损失精度，产生误差，小数点以后的数字全部舍弃。②容易超过取值范围。</span></p><p>&nbsp;</p><p><span style=\"color: rgb(255, 0, 0); font-size: 18px;\">6、记忆：</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 14px;\"> 8位：Byte（字节型） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16位：short（短整型）、char（字符型） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32位：int（整型）、float（单精度型/浮点型） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64位：long（长整型）、double（双精度型） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/></span></p><p><span style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 最后一个：boolean(布尔类型）</span></p><p><br/></p>','   java的基本数据类型有八种：\n    1、整数类型(byte、short、int、long)：        byte：8 \n位，用于表示最小数据单位，如文件中数据，-128~127        short：16 位，很少用，-32768 ~ 32767        int：32 \n位、最常用，-2^31-1~2^31  （21 亿）        long：64 位、次常用    注意事项：    int i=5; // 5 \n叫直接量（或字面量），即 直接写出的常数。    整数字面量默认都为 int 类型，所以在定义的 long 型数据后面加 L或 l。    小于\n 32 位数的变量，都按 int 结果计算。    强转符比数学运算符优先级高。见常量与变量中的例子。 2、浮点数类型(float、double)：        float：32 位，后缀 F 或 f，1 位符号位，8 位指数，23 \n位有效尾数。        double：64 位，最常用，后缀 D 或 d，1 位符号位，11 位指数，52 位有效尾    注意事项：    二 进\n 制 浮 点 数 ： \n1010100010=101010001.0*2=10101000.10*2^10（2次方)=1010100.010*2^11(3次方)= . \n1010100010*2^1010(10次方)    尾数：  . 1010100010   指数：1010   基数：2    \n浮点数字面量默认都为 double 类型，所以在定义的 float 型数据后面加F 或 f；double 类型可不写后缀，但在小数计算中一定要写\n D 或 X.X    float  的精度没有 long 高，有效位数（尾数）短。    float  的范围大于 long  指数可以很大。\n    浮点数是不精确的，不能对浮点数进行精确比较。 3、字符类型(char)：        char：16 位，是整数类型，用单引号括起来的 1 个字符（可以是一个中文字符），使用 \nUnicode 码代表字符，0~2^16-1（65535） 。    注意事项：    不能为 0个字符。    转义字符：\\n  换行  \n\\r  回车  \\t Tab 字符  \\\" 双引号  \\\\ 表示一个\\    两字符 char 中间用“+”连接，内部先把字符转成 int \n类型，再进行加法运算，char 本质就是个数！二进制的，显示的时候，经过“处理”显示为字符。 4、布尔类型(boolean)：    true 真  和 false 假。 5、类型转换：           char--&gt;    \n自动转换：byte--&gt;short--&gt;int--&gt;long--&gt;float--&gt;double               \n    强制转换：①会损失精度，产生误差，小数点以后的数字全部舍弃。②容易超过取值范围。 6、记忆：            8位：Byte（字节型）                      16位：short（短整型）、char（字符型）                      32位：int（整型）、float（单精度型/浮点型）                      64位：long（长整型）、double（双精度型）                      最后一个：boolean(布尔类型）',6,1,'2020-06-20');

/*Table structure for table `b_file` */

DROP TABLE IF EXISTS `b_file`;

CREATE TABLE `b_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `filename` varchar(255) NOT NULL COMMENT '文件名称',
  `filepath` text NOT NULL COMMENT '文件路径',
  `filetype` varchar(255) NOT NULL COMMENT '文件类型',
  `article_id` bigint(20) NOT NULL COMMENT '文章编号',
  PRIMARY KEY (`id`),
  KEY `acticle_id` (`article_id`),
  CONSTRAINT `acticle_id` FOREIGN KEY (`article_id`) REFERENCES `b_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `b_file` */

/*Table structure for table `b_menu` */

DROP TABLE IF EXISTS `b_menu`;

CREATE TABLE `b_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `code` varchar(255) NOT NULL COMMENT '菜单缩写',
  `p_code` varchar(255) NOT NULL COMMENT '菜单父及名称',
  `level` varchar(255) NOT NULL DEFAULT '0' COMMENT '菜单级别',
  `iconname` varchar(255) DEFAULT NULL COMMENT '图标名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `b_menu` */

insert  into `b_menu`(`id`,`name`,`code`,`p_code`,`level`,`iconname`) values (1,'Java','java','---','0','#iconjava'),(2,'Spring','spring','---','0','#iconspring'),(3,'Liunx','liunx','---','0','#iconspring'),(4,'SpringCloud','SpringCloud','---','0','#iconspring'),(5,'关于作者','about_me','---','0',NULL);

/*Table structure for table `b_role` */

DROP TABLE IF EXISTS `b_role`;

CREATE TABLE `b_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `superName` varchar(255) NOT NULL COMMENT '上级角色',
  `createdate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `b_role` */

insert  into `b_role`(`id`,`name`,`superName`,`createdate`) values (2,'管理员','---','2020-04-15 17:11:56');

/*Table structure for table `b_user` */

DROP TABLE IF EXISTS `b_user`;

CREATE TABLE `b_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `account` varchar(255) NOT NULL COMMENT '账户',
  `username` varchar(255) NOT NULL COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `wx` varchar(255) DEFAULT NULL COMMENT '微信',
  `role_id` bigint(20) DEFAULT NULL COMMENT '职位/角色',
  `createdate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `b_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `b_user` */

insert  into `b_user`(`id`,`account`,`username`,`password`,`email`,`qq`,`wx`,`role_id`,`createdate`) values (6,'eac4108912af90ae96e858190f4d8af7','一只羊','efd9d1b8bfb00e8e3647990f7d74d1d8','1607011324@qq.com','1607011324','yx1607011324',2,'2020-04-15 17:11:31');

/*Table structure for table `b_visitor` */

DROP TABLE IF EXISTS `b_visitor`;

CREATE TABLE `b_visitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访客编号',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `createdate` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `b_visitor` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
