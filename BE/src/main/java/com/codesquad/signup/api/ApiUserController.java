package com.codesquad.signup.api;

import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class ApiUserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/createForm")
    public String createForm() {
        return null;
    }

    @PostMapping("/create")
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
