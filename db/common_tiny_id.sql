CREATE TABLE `tiny_id_info`
(
    `id`          bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `biz_type`    varchar(63)         NOT NULL DEFAULT '' COMMENT '业务类型，唯一',
    `begin_id`    bigint(20)          NOT NULL DEFAULT '0' COMMENT '开始id，仅记录初始值，无其他含义。初始化时begin_id和max_id应相同',
    `max_id`      bigint(20)          NOT NULL DEFAULT '0' COMMENT '当前最大id',
    `step`        int(11)                      DEFAULT '0' COMMENT '步长',
    `delta`       int(11)             NOT NULL DEFAULT '1' COMMENT '每次id增量',
    `remainder`   int(11)             NOT NULL DEFAULT '0' COMMENT '余数',
    `create_time` timestamp           NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '更新时间',
    `version`     bigint(20)          NOT NULL DEFAULT '0' COMMENT '版本号',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_biz_type` (`biz_type`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT 'id信息表';

CREATE TABLE `tiny_id_token`
(
    `id`          int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `token`       varchar(255)     NOT NULL DEFAULT '' COMMENT 'token',
    `biz_type`    varchar(63)      NOT NULL DEFAULT '' COMMENT '此token可访问的业务类型标识',
    `remark`      varchar(255)     NOT NULL DEFAULT '' COMMENT '备注',
    `create_time` timestamp        NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '创建时间',
    `update_time` timestamp        NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT 'token信息表';

INSERT INTO `tiny_id_info` (`id`, `biz_type`, `begin_id`, `max_id`, `step`, `delta`, `remainder`, `create_time`,
                            `update_time`, `version`)
VALUES (1, 'UserId', 100000, 0, 1, 1, 0, '2019-02-14 0:0:0', '2019-02-14 0:0:0', 1);

INSERT INTO `tiny_id_info` (`id`, `biz_type`, `begin_id`, `max_id`, `step`, `delta`, `remainder`, `create_time`,
                            `update_time`, `version`)
VALUES (2, 'OrderId', 0, 0, 1, 1, 0, '2019-02-14 0:0:0', '2019-02-14 0:0:0', 1);

INSERT INTO `tiny_id_token` (`id`, `token`, `biz_type`, `remark`, `create_time`, `update_time`)
VALUES (1, 'e051e12a920bc015c57759cc017ce00a', 'UserId', 'UserId', '2019-02-14 0:0:0', '2019-02-14 0:0:0');

INSERT INTO `tiny_id_token` (`id`, `token`, `biz_type`, `remark`, `create_time`, `update_time`)
VALUES (2, 'a7a4ac1c78fb29ccbb07c12ae867a5ce', 'OrderId', 'OrderId', '2019-02-14 0:0:0', '2019-02-14 0:0:0');

