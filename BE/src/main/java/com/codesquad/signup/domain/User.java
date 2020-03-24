package com.codesquad.signup.domain;

//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;

import org.springframework.data.annotation.Id;

import javax.validation.constraints.NotEmpty;

public class User {

    @Id
    private Long id;

    @NotEmpty
    private String userId;

    @NotEmpty
    private String password;

    public User(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }

    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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
