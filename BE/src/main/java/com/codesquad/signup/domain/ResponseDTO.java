package com.codesquad.signup.domain;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ResponseDTO {
    private HttpStatus status;
    private int code;
    private Object message;

    public ResponseDTO(HttpStatus status, int code, boolean message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

    public ResponseDTO(HttpStatus status, int code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

    public ResponseDTO(HttpStatus status, int code, User message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
