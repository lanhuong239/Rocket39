package com.vti.entity;
import com.vti.entity.Account;

import java.time.LocalDate;

public class Group {
    public int id;
    public String name;
    public Account creator;
    public LocalDate createdDate;
    public Account[] accounts;

    public Group(String name, Account creator, Account[] accounts, LocalDate createdDate){
        this.name = name;
        this.creator = creator;
        this.accounts = accounts;
        this.createdDate = createdDate;
    }
    public Group(String name, Account creator, String[] userNames, LocalDate createdDate){
        this.name = name;
        this.creator = creator;
        this.createdDate = createdDate;
        //accounts
        Account[] accs = new Account[userNames.length];
        for (int i = 0; i < userNames.length; i ++){
            accs[i] = new Account(userNames[i]);
        }
    }
}
