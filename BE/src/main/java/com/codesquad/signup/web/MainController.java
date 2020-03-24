package com.codesquad.signup.web;

import com.codesquad.signup.domain.User;
import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/")
    public String main() {
        User user = new User("POOGLE", "QWE");
        userRepository.save(user);
        System.out.println(userRepository.findUserById(1L));
        return "redirect:/users";
    }
}
