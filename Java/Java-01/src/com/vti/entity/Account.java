package com.vti.entity;

import java.time.LocalDate;

public class Account {
    public int id;
    public String email;
    public String userName;
    public String fullName;
    public Department department;
    public Position position;
    public LocalDate createdDate;
    public Group[] groups;

    public Account() {
    }

    public Account(int id, String email, String userName, String fullName, Position position){
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.position = position;
        this.createdDate = LocalDate.now();
    }


    public Account(int id, String email, String userName, String fullName, Position position, LocalDate createdDate){
        super();
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.position = position;
        this.createdDate = createdDate;
    }

    public Account(String userName) {
        this.userName = userName;
    }
}
