package com.codesquad.signup.domain;

import org.springframework.http.HttpStatus;

public class LoginResponseDTO {
    private int code;
    private HttpStatus status;
    private String title;
    private String details;

    public LoginResponseDTO(int code, HttpStatus status, String title, String details) {
        this.code = code;
        this.status = status;
        this.title = title;
        this.details = details;
    }
}
