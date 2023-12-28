package com.vti.entity;

import java.time.LocalDate;

public class DayFour {
    public static void main(String[] args) {
        Department student1 = new Department("Huong");
        Department student2 = new Department();
        Position pos3 = new Position();
        Account acc3 = new Account(1, "abc@gmail.com", "lanhuong", "Nguyen Huong", pos3);
        System.out.println(acc3.createdDate);
        Position pos4 = new Position();
        Account acc4 = new Account(1, "abc@gmail.com", "lanhuong", "Nguyen Huong", pos4, LocalDate.of(2023,11,12));

    }
}
