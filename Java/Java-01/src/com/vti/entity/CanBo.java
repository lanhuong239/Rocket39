package com.vti.entity;

public class CanBo {
    private String name;
    private int age;
    private Gender gender;
    private String address;

    public enum Gender {
        MALE, FEMALE, OTHER
    }
    public CanBo(String name, int age, Gender gender, String address) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.address = address;
    }

    @Override
    public String toString() {
        return "CanBo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", gender=" + gender +
                ", address='" + address + '\'' +
                '}';
    }
}
