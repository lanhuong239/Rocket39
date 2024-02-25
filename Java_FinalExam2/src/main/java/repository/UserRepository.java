package repository;

import entity.Employee;
import entity.Manager;
import entity.User;
import util.JdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {

    public List<Manager> showAllManager() throws SQLException {
        String sql = "SELECT * FROM User WHERE role = 'MANAGER'";
        try (
                Connection connection = util.JdbcUtil.getConnection();
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql)
        ) {
            List<Manager> users = new ArrayList<>();
            while (rs.next()) {
                Manager user = new Manager();
                int id = rs.getInt("id");
                user.setId(id);
                String fullName = rs.getString("full_name");
                user.setFullName(fullName);
                String email = rs.getString("email");
                user.setEmail(email);
                String password = rs.getString("password");
                user.setPassword(password);
                String role = rs.getString("role");
                user.setRole(role);
                int projectId = rs.getInt("project_id");
                user.setProjectId(projectId);
                int expInYear = rs.getInt("exp_in_year");
                user.setExpInYear(expInYear);
                users.add(user);
            }
            return users;
        }
    }

    public List<Employee> getEmployeesByProjectId(int projectId) throws SQLException {
        String sql = "SELECT * FROM User WHERE project_id = ? AND role = 'EMPLOYEE'";

        try (Connection connection = JdbcUtil.getConnection();
             PreparedStatement pStmt = connection.prepareStatement(sql)) {

            pStmt.setInt(1, projectId);
            ResultSet rs = pStmt.executeQuery();

            List<Employee> employees = new ArrayList<>();

            while (rs.next()) {
                Employee user = new Employee();
                int id = rs.getInt("id");
                user.setId(id);
                String fullName = rs.getString("full_name");
                user.setFullName(fullName);
                String email = rs.getString("email");
                user.setEmail(email);
                String password = rs.getString("password");
                user.setPassword(password);
                String proSkill = rs.getString("pro_skill");
                ((Employee) user).setProSkill(proSkill);
                String role = rs.getString("role");
                user.setRole(role);
                employees.add(user);
            }

            return employees;
        }
    }



    public User loginManager(String email, String password) throws SQLException {
        Manager manager = null;
        String sql = "SELECT * FROM User WHERE email = ? AND password = ?AND role = 'manager'";
        try (
                Connection connection = JdbcUtil.getConnection();
                PreparedStatement pStmt = connection.prepareStatement(sql)
        ) {
            pStmt.setString(1, email);
            pStmt.setString(2, password);
            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    Manager user = new Manager();
                    int id = rs.getInt("id");
                    user.setId(id);
                    String fullName = rs.getString("full_name");
                    user.setFullName(fullName);
                    user.setEmail(email);
                    user.setPassword(password);
                    String role = rs.getString("role");
                    user.setRole(role);
                    return user;
                }
                return null;
            }
        }
    }



}
