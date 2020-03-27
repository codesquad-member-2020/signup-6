package com.codesquad.signup.api;

import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class ApiUserController {

    @Autowired
    UserRepository userRepository;

    private Logger logger = LoggerFactory.getLogger(ApiUserController.class);

    @GetMapping("")
    public String form() {
        return "/main.html";
    }

    @PostMapping("")
    public User create(@RequestBody User user) {
        return userRepository.save(user);
    }
}
