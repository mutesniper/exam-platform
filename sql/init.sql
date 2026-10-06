```sql
-- ==========================================
-- 考务平台数据库初始化脚本 (W1 底座)
-- ==========================================

-- 1. 考试场次表
CREATE TABLE IF NOT EXISTS `exam_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) NOT NULL COMMENT '考试名称',
  `total_stock` int NOT NULL COMMENT '总考位',
  `available_stock` int NOT NULL COMMENT '剩余考位',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试场次表';

-- 2. 用户表
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 3. 报名记录表 (注意：这里需要你自己思考如何加防重索引)
CREATE TABLE IF NOT EXISTS `registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `session_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报名记录表';

-- 4. 支付订单表
CREATE TABLE IF NOT EXISTS `payment_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) NOT NULL,
  `user_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `expire_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付订单表';