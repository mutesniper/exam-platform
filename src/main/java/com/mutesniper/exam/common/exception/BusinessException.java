package com.mutesniper.exam.common.exception;

import lombok.Getter;

public class BusinessException extends RuntimeException {

    @Getter
    private final int code;

    public BusinessException(BusinessExceptionEnum businessExceptionEnum) {
        super(businessExceptionEnum.getMsg());
        this.code = businessExceptionEnum.getCode();
    }

}
