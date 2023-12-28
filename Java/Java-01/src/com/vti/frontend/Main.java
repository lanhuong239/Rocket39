package com.vti.frontend;
import com.vti.entity.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter name: ");
        String name = sc.nextLine();
        System.out.print("Enter hometown: ");
        String homeTown = sc.nextLine();
        Student student1 = new Student(name, homeTown);
        System.out.print("Enter grade: ");
        double grade = sc.nextDouble();
        student1.setGrade(grade);

        System.out.print("Enter additional grade: ");
        double additionalGrade = sc.nextDouble();
        student1.addGrade(additionalGrade);

        student1.displayInfo();
        sc.close();
    }


}
