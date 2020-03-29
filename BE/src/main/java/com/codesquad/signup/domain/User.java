package com.codesquad.signup.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.NotEmpty;
import java.math.BigInteger;

@Getter
@Setter
@NoArgsConstructor
@Table("USERS")
public class User {

    @Id
    private BigInteger id;

    @NotEmpty
    private String userId;

    @NotEmpty
    private String password;

    @NotEmpty
    private String userName;

    @NotEmpty
    private String birthDate;

    @NotEmpty
    private String sex;

    @NotEmpty
    private String email;

    @NotEmpty
    private String mobile;

    @NotEmpty
    private String interests;

    public User(BigInteger id,
                @NotEmpty String userId,
                @NotEmpty String password,
                @NotEmpty String userName,
                @NotEmpty String birthDate,
                @NotEmpty String sex,
                @NotEmpty String email,
                @NotEmpty String mobile,
                @NotEmpty String interests) {
        this.id = id;
        this.userId = userId;
        this.password = password;
        this.userName = userName;
        this.birthDate = birthDate;
        this.sex = sex;
        this.email = email;
        this.mobile = mobile;
        this.interests = interests;
    }

    public boolean matchPassword(String password) {
        if (!this.password.equals(password)) {
            throw new IllegalArgumentException();
        }
        return true;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", userName='" + userName + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", interests='" + interests + '\'' +
                '}';
    }
}
