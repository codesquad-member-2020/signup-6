package com.codesquad.signup.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@NoArgsConstructor
public class User {

    public User(Long id, @NotEmpty String userId, @NotEmpty String password) {
        this.id = id;
        this.userId = userId;
        this.password = password;
    }

    @Id
    private Long id;

    @NotEmpty
    private String userId;

    @NotEmpty
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    //
//    @NotEmpty
//    private String name;
//
//    @NotEmpty
//    private String birthDay;
//
//    @NotEmpty
//    private Gender gender;
//
//    @NotEmpty
//    private String email;
//
//    @NotEmpty
//    private String mobile;
}
