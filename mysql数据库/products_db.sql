/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : products_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-02-14 21:45:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '良药不苦口呢', 'user1', '2019-01-14 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '这个药还真的不错！', 'user1', '2019-01-22 22:31:11');
INSERT INTO `t_comment` VALUES ('3', '3', '我得了炎症 试下这个药', 'user1', '2019-03-01 12:51:59');
INSERT INTO `t_comment` VALUES ('4', '3', '我也想试下这药', 'user2', '2019-03-01 12:52:29');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '店里儿童的药品比较少', '很多家长有小朋友的，需要多进点这方面的药品哦！', 'user1', '2019-01-13 23:46:29', '你的意见我们收到了', '2019-01-14 23:46:33');
INSERT INTO `t_leaveword` VALUES ('2', '希望药品销售网站卖好', '新的一年祝药房生意好，人民少生病', 'user1', '2019-01-23 23:08:02', '很好', '2019-01-23 23:28:01');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '药房药品销售网成立了', '<p>朋友们，需要药品的话可以来这里选购哦！</p>', '2019-01-14 23:47:02');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('14433334433', 'user1', '60', '支付宝', '已付款', '2019-12-19 15:13:14', '马云林', '13958398343', '四川成都万年场13号', 'test');
INSERT INTO `t_orderinfo` VALUES ('user120180122225749', 'user1', '92.5', '支付宝', '已发货', '2019-01-22 22:57:49', '双鱼林', '13598308394', '四川成都红星路13号', '尽快发货哦！');
INSERT INTO `t_orderinfo` VALUES ('user120180123234311', 'user1', '99.5', '支付宝', '已付款', '2019-01-23 23:43:11', '王忠强', '13598308394', '四川成都红星路13号', 'test333');
INSERT INTO `t_orderinfo` VALUES ('user120180301125118', 'user1', '138.5', '支付宝', '已发货', '2019-03-01 12:51:18', '双鱼林', '13598308394', '四川成都红星路13号', '快点发货吧');
INSERT INTO `t_orderinfo` VALUES ('user120190214213141', 'user1', '92.5', '支付宝', '已发货', '2019-02-14 21:31:41', '双鱼林', '13598308394', '四川成都红星路13号', '测试订单');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1', '14433334433', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('2', 'user120180122225749', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('3', 'user120180122225749', '2', '35.5', '1');
INSERT INTO `t_orderitem` VALUES ('4', 'user120180123234311', '2', '35.5', '2');
INSERT INTO `t_orderitem` VALUES ('5', 'user120180123234311', '1', '28.5', '1');
INSERT INTO `t_orderitem` VALUES ('6', 'user120180301125118', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('7', 'user120180301125118', '2', '35.5', '1');
INSERT INTO `t_orderitem` VALUES ('8', 'user120180301125118', '3', '23', '2');
INSERT INTO `t_orderitem` VALUES ('9', 'user120190214213141', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('10', 'user120190214213141', '2', '35.5', '1');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '999感冒灵颗粒', 'upload/134f691c-1f07-4461-a99f-b57b76cfcbe2.jpg', '98', '28.5', '是', '否', '<p>治疗感冒的良药</p>', '2019-01-14 23:43:22');
INSERT INTO `t_product` VALUES ('2', '2', '胆舒软胶囊', 'upload/eaf79bdc-4505-473d-8c34-e60ed215144e.jpg', '99', '35.5', '是', '否', '<p>疏肝利胆！</p>', '2019-01-22 22:57:14');
INSERT INTO `t_product` VALUES ('3', '1', '青霉素V钾胶囊', 'upload/93b6f162-0b0f-4a90-b507-d044a69fa7d5.jpg', '100', '23', '是', '是', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：衡立妥 青霉素V钾胶囊 0....</p></li><li><p>产品剂型:&nbsp;胶囊</p></li><li><p>使用剂量:&nbsp;详见说明书</p></li><li><p>品牌:&nbsp;衡立妥</p></li><li><p>套餐类型:&nbsp;标准装</p></li><li><p>批准文号:&nbsp;国药准字H20030064</p></li><li><p>有效期:&nbsp;24个月</p></li><li><p>生产企业:&nbsp;上海衡山药业有限公司</p></li><li><p>用法:&nbsp;口服</p></li><li><p>疾病:&nbsp;咽喉炎&nbsp;扁桃腺炎&nbsp;肺炎</p></li><li><p>症状:&nbsp;咽喉炎&nbsp;扁桃体炎</p></li><li><p>药品分类:&nbsp;处方药</p></li><li><p>药品名称:&nbsp;青霉素V钾胶囊</p></li><li><p>药品类别:&nbsp;化学药</p></li><li><p>药品规格:&nbsp;0.236mg*36粒/盒</p></li><li><p>药品通用名:&nbsp;青霉素V钾胶囊</p></li><li><p>适用人群:&nbsp;不限</p></li></ul><p><br/></p>', '2019-03-01 12:29:21');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '常见药品推荐', '一些常见药品');
INSERT INTO `t_productclass` VALUES ('2', '中成药区', '中成药区');
INSERT INTO `t_productclass` VALUES ('3', '西药区', '西药区');
INSERT INTO `t_productclass` VALUES ('4', '中药区', '中药区');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2019-01-14 23:46:49');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '50', 'test22', '2019-01-23 23:31:50');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '50', '333', '2019-01-23 23:33:05');
INSERT INTO `t_recharge` VALUES ('4', 'user1', '500', '来给你充值', '2019-03-01 12:50:48');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/cde06bca-4585-4b16-a288-95c6fa6a5e81.jpg', 'user1', '二医院医院开的处方', '待处理', '2019-01-14 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/05e3f114-e71b-4132-b8c4-4209bed324e1.jpg', 'user1', '开点青霉素', '已处理', '2019-01-23 22:51:44');
INSERT INTO `t_recipel` VALUES ('3', 'upload/3d01d3e9-fbcd-4890-aa43-d1c603958041.jpg', 'user1', '我要开青霉素胶囊消炎javascript:void(0)', '已处理', '2019-03-01 12:48:47');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------
INSERT INTO `t_shopcart` VALUES ('6', '3', 'user1', '23', '2');
INSERT INTO `t_shopcart` VALUES ('7', '1', 'user1', '28.5', '1');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2019-01-02', 'upload/2e132d04-f747-4297-ad59-42f35c7b7d80.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '289', '2019-01-14 23:41:53');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '王丽丽', '女', '2019-02-14', 'upload/38353750-0fff-41e9-9dd8-1807c675155f.jpg', '15129893233', 'wanglili@163.com', '福建福州', '0', '2019-03-01 12:37:33');
