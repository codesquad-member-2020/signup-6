package com.codesquad.signup.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Getter
@Setter
@NoArgsConstructor
public class ResponseDTO {
    private HttpStatus status;
    private int code;
    private Object message;

    public ResponseDTO(HttpStatus status, int code, Object message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
