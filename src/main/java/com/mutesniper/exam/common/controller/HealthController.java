package com.mutesniper.exam.common.controller;

import com.mutesniper.exam.common.result.Result;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {
    @RequestMapping("/health")
    public Result<String> health() {
        return Result.success("ok");

    }
}
