package com.codesquad.signup.api;

import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class ApiUserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/form")
    public String form() {
        return "index";
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
