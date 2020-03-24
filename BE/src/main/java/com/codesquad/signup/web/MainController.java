package com.codesquad.signup.web;

import org.springframework.web.bind.annotation.GetMapping;

public class MainController {

    @GetMapping("/")
    public String main() {
        return "/main";
    }
}
