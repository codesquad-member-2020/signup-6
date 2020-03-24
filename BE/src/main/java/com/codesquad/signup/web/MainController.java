package com.codesquad.signup.web;

import com.codesquad.signup.domain.Genders;
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
    public java.lang.String main() 1{
        User user = new User("POOGLE", "QWE", "LEE", "2020-02-01", Genders.FEMALE.getGender(), "ER@GMAIL.COM", "010-3333-4444");
        userRepository.save(user);
        System.out.println(userRepository.findById(user.getId()));
        System.out.println(userRepository.existsByUserId("POOGLE"));
        System.out.println(userRepository.existsByUserId("HONUX"));
        System.out.println(userRepository.existsByEmail("ASD@GMAIL.COM"));
        return "redirect:/users";
    }
}
