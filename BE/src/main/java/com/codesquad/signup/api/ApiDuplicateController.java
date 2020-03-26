package com.codesquad.signup.api;

import com.codesquad.signup.domain.DuplicateDTO;
import com.codesquad.signup.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users/exist")
public class ApiDuplicateController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/userId")
    public DuplicateDTO isDuplicatedUserId(@RequestParam("userId") String userId) {
        return getDuplicateDTO("userId", userId);
    }

    @GetMapping("/email")
    public DuplicateDTO isDuplicatedEmail(@RequestParam("email") String email) {
        return getDuplicateDTO("email", email);
    }

    @GetMapping("/mobile")
    public DuplicateDTO isDuplicatedMobile(@RequestParam("mobile") String mobile) {
        return getDuplicateDTO("mobile", mobile);
    }

    private DuplicateDTO getDuplicateDTO(String type, String comparison) {
        boolean isDuplicated = isDuplicated(type, comparison);
        return new DuplicateDTO(200, HttpStatus.OK, isDuplicated);
    }

    private boolean isDuplicated(String type, String comparison) {
        switch (type) {
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
