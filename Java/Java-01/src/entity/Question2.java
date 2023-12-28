package entity;
import java.time.LocalDate;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Group;
import com.vti.entity.Position;

/*
Question 2:
Tạo file Program.java có chứa main() method và khởi tạo ít nhất 3 đối tượng
đối với mỗi table trong java
Question 3:
Trong file Program.java, hãy in ít nhất 1 giá trị của mỗi đối tượng ra
 */


public class Question2 {
    public static void main(String[] args) {

        //Department
        Department dep1 = new Department();
        dep1.id = 1;
        dep1.name = "Hr";

        Department dep2 = new Department();
        dep2.id = 2;
        dep2.name = "Sales";

        Department dep3 = new Department();
        dep3.id = 3;
        dep3.name = "IT";

        //Position
        Position po1 = new Position();
        po1.id = 1;
        po1.name = Position.PositionName.Dev;

        Position po2 = new Position();
        po2.id = 2;
        po2.name = Position.PositionName.PM;

        Position po3 = new Position();
        po3.id = 3;
        po3.name = Position.PositionName.Scrum_Master;

        //Group
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Div1";

        Group group2 = new Group();
        group2.id = 2;
        group2.name = "Div2";

        Group group3 = new Group();
        group3.id = 3;
        group3.name = "Div3";

        //Account
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "huongntl@gmail.com";
        acc1.userName = "huongntl1";
        acc1.fullName = "Huong Nguyen 1";
        acc1.department = dep1;
        acc1.position = po1;
        acc1.createdDate = LocalDate.now();
        Group[] groupAcc1 = { group1, group2 };
        acc1.groups = groupAcc1;

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "huongntl2";
        acc2.userName = "huongntl2";
        acc2.fullName = "Huong Nguyen 2";
        acc2.department = dep2;
        acc2.position = po2;
        acc2.createdDate = LocalDate.now();
        Group[] groupAcc2 = { group2, group3 };
        acc1.groups = groupAcc2;

        Account acc3 = new Account();
        acc3.id = 2;
        acc3.email = "huongntl2";
        acc3.userName = "huongntl2";
        acc3.fullName = "Huong Nguyen 2";
        acc3.department = dep2;
        acc3.position = po2;
        acc3.createdDate = LocalDate.of(2021,12,29);
        Group[] groupAcc3 = { group3 };
        acc3.groups = groupAcc2;

        System.out.println("Account 1: ID : " + acc1.id + " Email: " +

                acc1.email + " UserName: " + acc1.userName

                + " FullName: " + acc1.fullName + " Department: " +

                acc1.department.name + " Position: "

                + acc1.position.name + " Group: "+
                acc1.groups[0].name +" "+ acc1.groups[1].name + "CreateDate: " +
                acc1.createdDate);

    }
}
