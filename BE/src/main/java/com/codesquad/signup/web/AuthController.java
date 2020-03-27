package com.codesquad.signup.web;

import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String loginForm() {
        return "/";
    }

    @PostMapping("/login")
    public String login(HttpSession session, String userId, String password) {
        User user = userRepository.findUserByUserId(userId).orElseThrow(IllegalArgumentException::new);
        session.setAttribute("loginUser", user);
        return "redirect:/api/users/";
    }
}
