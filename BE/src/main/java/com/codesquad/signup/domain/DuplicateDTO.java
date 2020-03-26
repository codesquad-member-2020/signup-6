package com.codesquad.signup.domain;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class DuplicateDTO {
    private int code;
    private HttpStatus status;
    private boolean exsits;

    public DuplicateDTO(int code, HttpStatus status, boolean exsits) {
        this.code = code;
        this.status = status;
        this.exsits = exsits;
    }
}
