package com.vti.entity;

public class Student {
    private int id;
    private String name;
    private String homeTown;
    private double grade;

    public Student(String name, String homeTown) {
        this.name = name;
        this.homeTown = homeTown;
        this.grade = 0.0;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public void addGrade(double additionalGrade) {
        this.grade += additionalGrade;
    }

    public void displayInfo() {
        System.out.println("Student information:");
        System.out.println("Name:" + name);
        System.out.println("Hometown:" + homeTown);
        System.out.println("Grade:" + grade);
    }

    private String getGrade() {
        if (grade < 4.0) {
            return "Weak";
        } else if (grade < 6.0) {
            return "Acceptable";
        } else if (grade < 8.0) {
            return "Good";
        } else {
            return "Excellent";
        }
    }
}
