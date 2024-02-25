
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/final_exam";
        String user = "root";
        String password = "290319990";
        return DriverManager.getConnection(url, user, password);
    }

    public static void checkConnection() {
        try (Connection connection = getConnection()) {
            System.out.println("Kết nối thành công: " + connection.getCatalog());
        } catch (SQLException exception) {
            System.out.println("Kết nối thất bại: " + exception.getMessage());
        }
    }

//    public static void check()  {
//        Connection connection = getConnection();
//        if (connection == null)
//            throw new RuntimeException("");
//    }

    public static void main(String[] args) {
        checkConnection();
    }

//    try catch: xu ly ngoai le, giong if else, biet la xay ra loi nhung ko biet loi cho nao
//
//    throw: su dung if else
//
//    throws


}
