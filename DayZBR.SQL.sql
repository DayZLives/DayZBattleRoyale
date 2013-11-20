/*
DayZ Battle Royale SQL
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `deployable`
-- ----------------------------
DROP TABLE IF EXISTS `deployable`;
CREATE TABLE `deployable` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq1_deployable` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deployable
-- ----------------------------
INSERT INTO `deployable` VALUES ('4', 'Hedgehog_DZ');
INSERT INTO `deployable` VALUES ('5', 'Sandbag1_DZ');
INSERT INTO `deployable` VALUES ('7', 'StashMedium');
INSERT INTO `deployable` VALUES ('6', 'StashSmall');
INSERT INTO `deployable` VALUES ('1', 'TentStorage');
INSERT INTO `deployable` VALUES ('2', 'TrapBear');
INSERT INTO `deployable` VALUES ('3', 'Wire_cat1');
INSERT INTO `deployable` VALUES ('8', 'DomeTentStorage');
INSERT INTO `deployable` VALUES ('9', 'CamoNet_DZ');
INSERT INTO `deployable` VALUES ('10', 'Trap_Cans');
INSERT INTO `deployable` VALUES ('11', 'TrapTripwireFlare');
INSERT INTO `deployable` VALUES ('12', 'TrapBearTrapSmoke');
INSERT INTO `deployable` VALUES ('13', 'TrapTripwireGrenade');
INSERT INTO `deployable` VALUES ('14', 'TrapTripwireSmoke');
INSERT INTO `deployable` VALUES ('16', 'TrapBearTrapFlare');

-- ----------------------------
-- Table structure for `instance`
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '11',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `backpack` varchar(2048) NOT NULL DEFAULT '["",[[],[]],[[],[]]]',
  PRIMARY KEY (`id`),
  KEY `fk1_instance` (`world_id`),
  CONSTRAINT `instance_ibfk_1` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES ('1', '11', '[]', '[\"\",[[],[]],[[],[]]]');

-- ----------------------------
-- Table structure for `instance_deployable`
-- ----------------------------
DROP TABLE IF EXISTS `instance_deployable`;
CREATE TABLE `instance_deployable` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(60) NOT NULL,
  `deployable_id` smallint(5) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[0,[0,0,0]]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Hitpoints` varchar(500) NOT NULL DEFAULT '[]',
  `Fuel` double(13,0) NOT NULL DEFAULT '0',
  `Damage` double(13,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx1_instance_deployable` (`deployable_id`),
  KEY `idx2_instance_deployable` (`owner_id`),
  KEY `idx3_instance_deployable` (`instance_id`),
  CONSTRAINT `instance_deployable_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`),
  CONSTRAINT `instance_deployable_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `survivor` (`id`),
  CONSTRAINT `instance_deployable_ibfk_3` FOREIGN KEY (`deployable_id`) REFERENCES `deployable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance_deployable
-- ----------------------------

-- ----------------------------
-- Table structure for `instance_vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `instance_vehicle`;
CREATE TABLE `instance_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `world_vehicle_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[0,[0,0,0]]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `parts` varchar(1024) NOT NULL DEFAULT '[]',
  `fuel` double NOT NULL DEFAULT '0',
  `damage` double NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx3_instance_vehicle` (`instance_id`),
  KEY `fk3_instance_vehicle` (`world_vehicle_id`),
  CONSTRAINT `fk3_instance_vehicle` FOREIGN KEY (`world_vehicle_id`) REFERENCES `world_vehicle` (`id`),
  CONSTRAINT `instance_vehicle_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2990 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for `log_code`
-- ----------------------------
DROP TABLE IF EXISTS `log_code`;
CREATE TABLE `log_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_log_code` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_code
-- ----------------------------
INSERT INTO `log_code` VALUES ('1', 'Login', 'Player has logged in');
INSERT INTO `log_code` VALUES ('2', 'Logout', 'Player has logged out');
INSERT INTO `log_code` VALUES ('3', 'Ban', 'Player was banned');
INSERT INTO `log_code` VALUES ('4', 'Connect', 'Player has connected');
INSERT INTO `log_code` VALUES ('5', 'Disconnect', 'Player has disconnected');

-- ----------------------------
-- Table structure for `log_entry`
-- ----------------------------
DROP TABLE IF EXISTS `log_entry`;
CREATE TABLE `log_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL DEFAULT '',
  `log_code_id` int(11) unsigned NOT NULL,
  `text` varchar(1024) DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk1_log_entry` (`log_code_id`),
  CONSTRAINT `fk1_log_entry` FOREIGN KEY (`log_code_id`) REFERENCES `log_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39770 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `migration_schema_log`
-- ----------------------------
DROP TABLE IF EXISTS `migration_schema_log`;
CREATE TABLE `migration_schema_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `schema_name` varchar(255) NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `old_version` varchar(255) NOT NULL,
  `new_version` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration_schema_log
-- ----------------------------
INSERT INTO `migration_schema_log` VALUES ('1', 'Reality', '2013-06-19 18:11:10', '0.000000', '0.010000');
INSERT INTO `migration_schema_log` VALUES ('2', 'Reality', '2013-06-19 18:11:10', '0.010000', '0.020000');
INSERT INTO `migration_schema_log` VALUES ('3', 'Reality', '2013-06-19 18:11:10', '0.020000', '0.030000');
INSERT INTO `migration_schema_log` VALUES ('4', 'Reality', '2013-06-19 18:11:10', '0.030000', '0.040000');
INSERT INTO `migration_schema_log` VALUES ('5', 'Reality', '2013-06-19 18:11:10', '0.040000', '0.050000');
INSERT INTO `migration_schema_log` VALUES ('6', 'Reality', '2013-06-19 18:11:10', '0.050000', '0.060000');
INSERT INTO `migration_schema_log` VALUES ('7', 'Reality', '2013-06-19 18:11:10', '0.060000', '0.070000');
INSERT INTO `migration_schema_log` VALUES ('8', 'Reality', '2013-06-19 18:11:10', '0.070000', '0.080000');
INSERT INTO `migration_schema_log` VALUES ('9', 'Reality', '2013-06-19 18:11:10', '0.080000', '0.090000');
INSERT INTO `migration_schema_log` VALUES ('10', 'Reality', '2013-06-19 18:11:10', '0.090000', '0.100000');
INSERT INTO `migration_schema_log` VALUES ('11', 'Reality', '2013-06-19 18:11:10', '0.100000', '0.110000');
INSERT INTO `migration_schema_log` VALUES ('12', 'Reality', '2013-06-19 18:11:10', '0.110000', '0.120000');
INSERT INTO `migration_schema_log` VALUES ('13', 'Reality', '2013-06-19 18:11:10', '0.120000', '0.130000');
INSERT INTO `migration_schema_log` VALUES ('14', 'Reality', '2013-06-19 18:11:10', '0.130000', '0.140000');
INSERT INTO `migration_schema_log` VALUES ('15', 'Reality', '2013-06-19 18:11:10', '0.140000', '0.150000');
INSERT INTO `migration_schema_log` VALUES ('16', 'Reality', '2013-06-19 18:11:10', '0.150000', '0.160000');
INSERT INTO `migration_schema_log` VALUES ('17', 'Reality', '2013-06-19 18:11:10', '0.160000', '0.170000');
INSERT INTO `migration_schema_log` VALUES ('18', 'Reality', '2013-06-19 18:11:10', '0.170000', '0.180000');
INSERT INTO `migration_schema_log` VALUES ('19', 'Reality', '2013-06-19 18:11:10', '0.180000', '0.190000');
INSERT INTO `migration_schema_log` VALUES ('20', 'Reality', '2013-06-19 18:11:10', '0.190000', '0.200000');
INSERT INTO `migration_schema_log` VALUES ('21', 'Reality', '2013-06-19 18:11:10', '0.200000', '0.210000');
INSERT INTO `migration_schema_log` VALUES ('22', 'Reality', '2013-06-19 18:11:10', '0.210000', '0.220000');
INSERT INTO `migration_schema_log` VALUES ('23', 'Reality', '2013-06-19 18:11:10', '0.220000', '0.230000');
INSERT INTO `migration_schema_log` VALUES ('24', 'Reality', '2013-06-19 18:11:10', '0.230000', '0.240000');
INSERT INTO `migration_schema_log` VALUES ('25', 'Reality', '2013-06-19 18:11:10', '0.240000', '0.250000');
INSERT INTO `migration_schema_log` VALUES ('26', 'Reality', '2013-06-19 18:11:10', '0.250000', '0.260000');
INSERT INTO `migration_schema_log` VALUES ('27', 'Reality', '2013-06-19 18:11:11', '0.260000', '0.270000');
INSERT INTO `migration_schema_log` VALUES ('28', 'Reality', '2013-06-19 18:11:11', '0.270000', '0.280000');
INSERT INTO `migration_schema_log` VALUES ('29', 'Reality', '2013-06-19 18:11:11', '0.280000', '0.290000');
INSERT INTO `migration_schema_log` VALUES ('30', 'Reality', '2013-06-19 18:11:11', '0.290000', '0.300000');
INSERT INTO `migration_schema_log` VALUES ('31', 'Reality', '2013-06-19 18:11:11', '0.300000', '0.310000');
INSERT INTO `migration_schema_log` VALUES ('32', 'Reality', '2013-06-19 18:11:11', '0.310000', '0.320000');
INSERT INTO `migration_schema_log` VALUES ('33', 'Reality', '2013-06-19 18:11:11', '0.320000', '0.330000');
INSERT INTO `migration_schema_log` VALUES ('34', 'Reality', '2013-06-19 18:11:11', '0.330000', '0.340000');
INSERT INTO `migration_schema_log` VALUES ('35', 'Reality', '2013-06-19 18:11:11', '0.340000', '0.350000');
INSERT INTO `migration_schema_log` VALUES ('36', 'Reality', '2013-06-19 18:11:11', '0.350000', '0.360000');
INSERT INTO `migration_schema_log` VALUES ('37', 'Reality', '2013-06-19 18:11:11', '0.360000', '0.370000');
INSERT INTO `migration_schema_log` VALUES ('38', 'Reality', '2013-06-19 18:11:11', '0.370000', '0.380000');
INSERT INTO `migration_schema_log` VALUES ('39', 'Reality', '2013-06-19 18:11:11', '0.380000', '0.390000');
INSERT INTO `migration_schema_log` VALUES ('40', 'Reality', '2013-06-19 18:11:11', '0.390000', '0.400000');
INSERT INTO `migration_schema_log` VALUES ('41', 'Reality', '2013-06-19 18:11:11', '0.400000', '0.410000');
INSERT INTO `migration_schema_log` VALUES ('42', 'Reality', '2013-06-19 18:11:11', '0.410000', '0.420000');

-- ----------------------------
-- Table structure for `migration_schema_version`
-- ----------------------------
DROP TABLE IF EXISTS `migration_schema_version`;
CREATE TABLE `migration_schema_version` (
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration_schema_version
-- ----------------------------
INSERT INTO `migration_schema_version` VALUES ('Reality', '0.420000');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `humanity` int(6) NOT NULL DEFAULT '2500',
  `survival_attempts` int(3) unsigned NOT NULL DEFAULT '1',
  `total_survival_time` int(5) unsigned NOT NULL DEFAULT '0',
  `total_survivor_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `total_bandit_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `total_zombie_kills` int(5) unsigned NOT NULL DEFAULT '0',
  `total_headshots` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_profile` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2633 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profile
-- ----------------------------

-- ----------------------------
-- Table structure for `survivor`
-- ----------------------------
DROP TABLE IF EXISTS `survivor`;
CREATE TABLE `survivor` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL,
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `backpack` varchar(2048) NOT NULL DEFAULT '[]',
  `medical` varchar(255) NOT NULL DEFAULT '[false,false,false,false,false,false,false,12000,[],[0,0],0]',
  `is_dead` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `model` varchar(128) NOT NULL DEFAULT 'Survivor2_DZ',
  `state` varchar(128) NOT NULL DEFAULT '["","aidlpercmstpsnonwnondnon_player_idlesteady04",36]',
  `survivor_kills` int(3) unsigned NOT NULL DEFAULT '0',
  `bandit_kills` int(3) unsigned NOT NULL DEFAULT '0',
  `zombie_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `headshots` int(4) unsigned NOT NULL DEFAULT '0',
  `last_ate` int(3) unsigned NOT NULL DEFAULT '0',
  `last_drank` int(3) unsigned NOT NULL DEFAULT '0',
  `survival_time` int(3) unsigned NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time` datetime NOT NULL,
  `DistanceFoot` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx1_main` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10390 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survivor
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) DEFAULT NULL,
  `damage_min` decimal(4,3) NOT NULL DEFAULT '0.100',
  `damage_max` decimal(4,3) NOT NULL DEFAULT '0.700',
  `fuel_min` decimal(4,3) NOT NULL DEFAULT '0.200',
  `fuel_max` decimal(4,3) NOT NULL DEFAULT '0.800',
  `limit_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `limit_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parts` varchar(1024) DEFAULT NULL,
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq1_vehicle` (`class_name`),
  KEY `idx1_vehicle` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `world`
-- ----------------------------
DROP TABLE IF EXISTS `world`;
CREATE TABLE `world` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `max_x` mediumint(9) DEFAULT '0',
  `max_y` mediumint(9) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_world` (`name`),
  KEY `idx1_world` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world
-- ----------------------------
INSERT INTO `world` VALUES ('1', 'chernarus', '14700', '15360');
INSERT INTO `world` VALUES ('2', 'lingor', '10000', '10000');
INSERT INTO `world` VALUES ('3', 'utes', '5100', '5100');
INSERT INTO `world` VALUES ('4', 'takistan', '14000', '14000');
INSERT INTO `world` VALUES ('5', 'panthera2', '10200', '10200');
INSERT INTO `world` VALUES ('6', 'fallujah', '10200', '10200');
INSERT INTO `world` VALUES ('7', 'zargabad', '8000', '8000');
INSERT INTO `world` VALUES ('8', 'namalsk', '12000', '12000');
INSERT INTO `world` VALUES ('9', 'mbg_celle2', '13000', '13000');
INSERT INTO `world` VALUES ('10', 'tavi', '25600', '25600');
INSERT INTO `world` VALUES ('11', 'isoladicapraia', '10000', '10000');

-- ----------------------------
-- Table structure for `world_vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `world_vehicle`;
CREATE TABLE `world_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[]',
  `description` varchar(1024) DEFAULT NULL,
  `chance` decimal(4,3) unsigned NOT NULL DEFAULT '0.000',
  `last_modified` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx1_world_vehicle` (`vehicle_id`),
  KEY `idx2_world_vehicle` (`world_id`),
  CONSTRAINT `world_vehicle_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `world_vehicle_ibfk_2` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2067 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for `v_deployable`
-- ----------------------------
DROP VIEW IF EXISTS `v_deployable`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_deployable` AS select `id`.`id` AS `instance_deployable_id`,`d`.`id` AS `vehicle_id`,`d`.`class_name` AS `class_name`,`s`.`id` AS `owner_id`,`p`.`name` AS `owner_name`,`p`.`unique_id` AS `owner_unique_id`,`s`.`is_dead` AS `is_owner_dead`,`id`.`worldspace` AS `worldspace`,`id`.`inventory` AS `inventory` from (((`instance_deployable` `id` join `deployable` `d` on((`id`.`deployable_id` = `d`.`id`))) join `survivor` `s` on((`id`.`owner_id` = `s`.`id`))) join `profile` `p` on((`s`.`unique_id` = `p`.`unique_id`))) ;

-- ----------------------------
-- View structure for `v_player`
-- ----------------------------
DROP VIEW IF EXISTS `v_player`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_player` AS select `p`.`name` AS `player_name`,`p`.`humanity` AS `humanity`,`s`.`id` AS `alive_survivor_id`,`s`.`world_id` AS `alive_survivor_world_id` from (`profile` `p` left join `survivor` `s` on(((`p`.`unique_id` = `s`.`unique_id`) and (`s`.`is_dead` = 0)))) ;

-- ----------------------------
-- View structure for `v_vehicle`
-- ----------------------------
DROP VIEW IF EXISTS `v_vehicle`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_vehicle` AS select `iv`.`id` AS `instance_vehicle_id`,`v`.`id` AS `vehicle_id`,`iv`.`instance_id` AS `instance_id`,`i`.`world_id` AS `world_id`,`v`.`class_name` AS `class_name`,`iv`.`worldspace` AS `worldspace`,`iv`.`inventory` AS `inventory`,`iv`.`parts` AS `parts`,`iv`.`damage` AS `damage`,`iv`.`fuel` AS `fuel` from (((`instance_vehicle` `iv` join `world_vehicle` `wv` on((`iv`.`world_vehicle_id` = `wv`.`id`))) join `vehicle` `v` on((`wv`.`vehicle_id` = `v`.`id`))) join `instance` `i` on((`iv`.`instance_id` = `i`.`id`))) ;

-- ----------------------------
-- Procedure structure for `proc_loglogin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_loglogin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_loglogin`(in `p_uniqueId` varchar(128), in `p_instanceId` int)
begin
  insert ignore into log_entry (unique_id, instance_id, log_code_id) values (p_uniqueId, p_instanceId, 1); --
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_loglogout`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_loglogout`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_loglogout`(in `p_uniqueId` varchar(128), in `p_instanceId` int)
begin
  insert into log_entry (unique_id, instance_id, log_code_id) values (p_uniqueId, p_instanceId, 5); --
end
;;
DELIMITER ;
