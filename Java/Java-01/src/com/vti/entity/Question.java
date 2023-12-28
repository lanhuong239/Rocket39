package com.vti.entity;
import com.vti.entity.Account;
import com.vti.entity.TypeQuestion;

import java.time.LocalDate;

public class Question {
    public int id;
    public String content;
    public TypeQuestion type;
    public Account creator;
    public LocalDate createdDate;
}
