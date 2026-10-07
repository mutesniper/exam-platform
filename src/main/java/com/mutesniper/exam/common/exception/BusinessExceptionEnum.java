package com.mutesniper.exam.common.exception;

import lombok.Getter;

public enum BusinessExceptionEnum {

    /** 待扩展 */
    // === 通用 ===
    SUCCESS(200, "操作成功"),
    SYSTEM_ERROR(500, "系统内部错误"),

    // === 报名域 (40001 - 40099) ===
    STOCK_EMPTY(40001, "考位已满"),
    DUPLICATE_REGISTRATION(40002, "您已报名该场次，请勿重复操作"),
    SESSION_NOT_FOUND(40003, "考试场次不存在");


    @Getter
    private int code;
    @Getter
    private String msg;
    private BusinessExceptionEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
