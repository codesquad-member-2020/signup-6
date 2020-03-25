package com.codesquad.signup.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.NotEmpty;

@Table("USERS")
public class User {

    @Id
    private Long id;

    @NotEmpty
    private String userId;

    @NotEmpty
    private String password;

    @NotEmpty
    private String name;

    @NotEmpty
    private String birthDay;

    @NotEmpty
    private String gender;

    @NotEmpty
    private String email;

    @NotEmpty
    private String mobile;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public java.lang.String getUserId() {
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

    public User(@NotEmpty String userId
            , @NotEmpty String password
            , @NotEmpty String name
            , @NotEmpty String birthDay
            , @NotEmpty String gender
            , @NotEmpty String email
            , @NotEmpty String mobile) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.birthDay = birthDay;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
    }

    @Override
    public java.lang.String toString() {
        return "User{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
