package com.codesquad.signup.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main() {
        return "redirect:/users/form";
    }

    @GetMapping("/users/form")
    public String create() {
        return "/index.html";
    }
}
