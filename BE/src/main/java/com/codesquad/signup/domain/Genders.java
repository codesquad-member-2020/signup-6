package com.codesquad.signup.domain;

public enum Genders {
    MALE("남자"),
    FEMALE("여자");

    private String gender;

    private Genders(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return this.gender;
    }
}
