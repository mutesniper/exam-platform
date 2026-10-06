# 考务平台 (Exam Registration Platform)

## 项目简介
一个多考试类型的在线报名考务平台，核心解决“稀缺考位高并发分配”问题。
本项目采用**模块化单体架构（Modular Monolith）**，重点实践写/读高并发、MQ异步解耦及 Agent 工程化隔离。

## 技术栈
- **基础底座**：Java 17, Spring Boot 3.x, MyBatis-Plus
- **数据存储**：MySQL 8.x, Redis 7.x
- **高并发核心**：Redis Lua 脚本, Redisson, Sentinel
- **异步与消息**：Kafka 3.x
- **AI 接入**：Spring AI Alibaba (用于智能政策咨询 Agent 隔离)

## 目录结构规划
```text
exam-platform/
├── sql/                # 数据库初始化脚本
├── src/main/java/
│   ├── common/         # 全局通用组件 (Result, Exception, Config)
│   ├── registration/   # 报名核心域 (Lua扣减/限流)
│   ├── score/          # 查分系统域 (多级缓存)
│   ├── payment/        # 缴费中心域 (延迟队列)
│   └── agent/          # Agent 咨询域 (舱壁隔离/熔断)
└── README.md
```

## 如何启动

1. 确保本地已安装 JDK 17+, MySQL 8.0+, Redis 7.0+
2. 执行 `sql/init.sql` 初始化数据库表结构
3. 复制 `application.yml.example` 为 `application.yml` 并配置数据库/Redis连接
4. 运行 `ExamApplication.java` 启动服务