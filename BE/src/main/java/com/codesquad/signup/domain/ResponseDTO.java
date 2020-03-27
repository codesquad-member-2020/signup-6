package com.codesquad.signup.domain;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ResponseDTO {
    private int code;
    private HttpStatus status;
    private Object message;

    public ResponseDTO(int code, HttpStatus status, boolean message) {
        this.code = code;
        this.status = status;
        this.message = message;
    }

    public ResponseDTO(int code, HttpStatus status, String message) {
        this.code = code;
        this.status = status;
        this.message = message;
    }
}
