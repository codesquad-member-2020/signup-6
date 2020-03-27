package com.codesquad.signup.web;

import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/users/login")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("")
    public String loginForm() {
        return "/login";
    }

    @PostMapping("")
    public String login(HttpSession session, String userId, String password) {
        User user = userRepository.findUserByUserId(userId).orElseThrow(IllegalArgumentException::new);

        if (user.matchPassword(password)) {
            return "redirect:/users/login";
        }

        session.setAttribute("loginUser", user);
        return "redirect:/";
    }
}
