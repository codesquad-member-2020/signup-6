package com.codesquad.signup.api;

import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

@RestController
@RequestMapping("/api/users")
public class ApiUserController {

    private Logger logger = LoggerFactory.getLogger(ApiUserController.class);

    @Autowired
    UserRepository userRepository;

    @GetMapping("/form")
    public String form() {
        return "index";
    }

    @GetMapping("/exist/{userId}")
    public boolean checkUserId(@PathVariable String userId) {
        if (!userRepository.findByUserId(userId).isPresent()) {
            User checkedUserId = new User (userId, "empty", "empty", "empty", "empty", "empty", "empty");
            userRepository.save(checkedUserId);
            return true;
        }
        return false;
    }

    @GetMapping("/exist/{userId}/email/{email}")
    public boolean checkEmail(@PathVariable String userId, @PathVariable String email) {
        Optional<String> duplicateEmail = userRepository.findByEmail(email);
        System.out.println(duplicateEmail);
        if (!duplicateEmail.isPresent()) {
            userRepository.updateEmail(userId, email);
            return true;
        }
        return false;
    }

    @GetMapping("/exist/{userId}/mobile/{mobile}")
    public boolean checkMobile(@PathVariable String userId, @PathVariable String mobile) {
        Optional<String> duplicatePhone = userRepository.findByMobile(mobile);
        if (!duplicatePhone.isPresent()) {
            userRepository.updateMobile(userId, mobile);
            return true;
        }
        return false;
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
