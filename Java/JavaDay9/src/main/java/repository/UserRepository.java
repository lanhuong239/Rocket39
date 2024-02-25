package repository;

import entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.*;

import javax.swing.plaf.nimbus.State;


public class UserRepository {
    public List<User> findAll() throws SQLException {
        String sql = "SELECT * FROM users";
        try (
                Connection connection = util.JdbcUtil.getConnection();
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        ){
            List<User> users = new ArrayList<>();
            while(){
                User user = new User();
                int id = rs.getInt("id");
                user.setId(id);
                String fullName = rs.getString("full_name");
                user.setFullName(fullName);
                String email = rs.getString("email");
                user.setEmail(email);
                String password = rs.getString("password");
                user.setEmail(password);
                String role = rs.getString("role");
                user.setRole(role);
                users.add(user);
            }
            return users;
        }
    }

    public User findById(int id) throws SQLException{
        String sql = "SELECT * FROM users WHERE id = ?";
        try (
                Connection connection = util.JdbcUtil.getConnection();
                PreparedStatement pSmt = connection.prepareStatement(sql);
                ){
            pSmt.setInt(1, id);
            try (ResultSet rs = pSmt.executeQuery()){
                if (rs.next()){
                    User user = new User();
                    user.setId(id);
                    String fullName = rs.getString("full_name");
                    user.setFullName(fullName);
                    String email = rs.getString("email");
                    user.setEmail(email);
                    String password = rs.getString("password");
                    user.setPassword(password);
                    String role = rs.getString("role");
                    user.setRole(role);
                    return user;
                }
                return null;
            }
        }
    }

    public User findByEmailAndPassword(String email, String password) throws SQLException{
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (
                Connection connection = util.JdbcUtil.getConnection();
                PreparedStatement pStmt = connection.prepareStatement(sql);
                ){
            pStmt.setString(1, email);
            pStmt.setString(2, password);
            try (ResultSet rs = pStmt.executeQuery()){
                if (rs.next()){
                    User user = new User();
                    int id = rs.getInt("id");
                    user.setId(id);

                }
            }

        }

    }


}
