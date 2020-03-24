package com.codesquad.signup.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class ApiUserController {

    @GetMapping("/createForm")
    public String createForm() {
        return null;
    }

    @PostMapping("")
    public String create() {
        return "redirect:/";
    }

    @PostMapping("/duplicateUserId")
    public String duplicateUserId() {
        return "redirect:/users/createForm";
    }

    @PostMapping("/duplicateMobile")
    public String duplicateMobile() {
        return "redirect:/users/createForm";
    }

    @PostMapping("/duplicateEmail")
    public String duplicateEmail() {
        return "redirect:/users/createForm";
    }

    @GetMapping("/reset")
    public String resetForm() {
        return null;
    }

    @GetMapping("/login")
    public String loginForm() {
        return null;
    }
}
