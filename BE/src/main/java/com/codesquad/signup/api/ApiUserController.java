package com.codesquad.signup.api;

import com.codesquad.signup.domain.DuplicateDTO;
import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class ApiUserController {

    @Autowired
    UserRepository userRepository;
    private Logger logger = LoggerFactory.getLogger(ApiUserController.class);

    @GetMapping("/form")
    public String form() {
        return "index";
    }

    @PostMapping("")
    public String create() {
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginForm() {
        return null;
    }
}
