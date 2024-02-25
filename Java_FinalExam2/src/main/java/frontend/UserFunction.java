package frontend;

import entity.Employee;
import entity.Manager;
import entity.User;
import repository.UserRepository;
import util.ScannerUtil;

import java.sql.SQLException;
import java.util.List;

public class UserFunction {
    private UserRepository repository = new UserRepository();

    public void showMenu() throws SQLException {
        while (true) {
            System.out.println("1. Hiển thị danh sách employee theo project");
            System.out.println("2. Hiển thị tất cả manager");
            System.out.println("3. Đăng nhập");
            System.out.println("4. Thoát chương trình");
            System.out.println("Mời bạn chọn chức năng:");
            int menu = ScannerUtil.inputInt();
            if (menu == 1) {
                getEmployeesByProjectId();
            } else if (menu == 2) {
                showAllManager();
            } else if (menu == 3) {
                loginManager();
            } else if (menu == 4) {
                return;
            } else {
                System.err.println("Yêu cầu chọn đúng chức năng.");
                System.err.println("Chọn lại.");
            }
            System.out.println("Hello1");
            System.out.println("Hello2");
            System.out.println("Hello3");
        }
    }


    public void getEmployeesByProjectId() throws SQLException {
        System.out.println("Nhập vào id của project.");
        int projectId = ScannerUtil.inputInt();
        List<Employee> users = repository.getEmployeesByProjectId(projectId);
        System.out.println("+------+--------------------+--------------------+");
        System.out.println("|  ID  |     FULL NAME      |       EMAIL        |");
        System.out.println("+------+--------------------+--------------------+");
        for (Employee user : users) {
//            int id = user.getId();
            int id = 0;
            String fullName = user.getFullName();
            String email = user.getEmail();
            System.out.printf("| %-4s | %-18s | %-18s |%n", id, fullName, email);
            System.out.println("+------+--------------------+--------------------+");
        }
    }
    public void showAllManager() throws SQLException {
        List<Manager> users = repository.showAllManager();
        System.out.println("+------+--------------------+--------------------+");
        System.out.println("|  ID  |     FULL NAME      |       EMAIL        |");
        System.out.println("+------+--------------------+--------------------+");
        for (Manager user : users) {
            int id = user.getId();
            String fullName = user.getFullName();
            String email = user.getEmail();
            System.out.printf("| %-4s | %-18s | %-18s |%n", id, fullName, email);
            System.out.println("+------+--------------------+--------------------+");
        }
    }
// nho -> to
    public void loginManager() throws SQLException {
        System.out.println("Nhập vào thông tin đăng nhập.");
        System.out.println("Nhập vào email:");
        String email = ScannerUtil.inputEmail();
        System.out.println("Nhập vào password:");
        String password = ScannerUtil.inputPassword();
        Manager user = (Manager) repository.loginManager(email, password);
        if (user == null) {
            System.err.println("Đăng nhập thất bại.");
        } else {
            System.out.printf(
                    "Đăng nhập thành công: %s - %s.%n",
                    user.getFullName(), user.getRole()
            );
        }
    }


}
