package com.codesquad.signup.api;

import com.codesquad.signup.domain.DuplicateDTO;
import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiDuplicateController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/exist/userId/{userId}")
    public DuplicateDTO isDuplicatedUserId(@PathVariable String userId) {
        return getDuplicateDTO(userId);
    }

    @GetMapping("/exist/email/{email}")
    public DuplicateDTO isDuplicatedEmail(@PathVariable String email) {
        return getDuplicateDTO(email);
    }

    @GetMapping("/exist/mobile/{mobile}")
    public DuplicateDTO isDuplicatedMobile(@PathVariable String mobile) {
        return getDuplicateDTO(mobile);
    }

    private DuplicateDTO getDuplicateDTO(String comparison) {
        return new DuplicateDTO(200, HttpStatus.OK, isDuplicated(comparison));
    }

    private boolean isDuplicated(String comparison) {
        switch (comparison) {
            case("userId"):
                 return userRepository.findUserByUserId(comparison).isPresent();
            case("email"):
                return userRepository.findUserByEmail(comparison).isPresent();
            case("mobile"):
                return userRepository.findUserByMobile(comparison).isPresent();
        }
        return false;
    }
}
