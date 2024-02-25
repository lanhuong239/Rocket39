package frontend;

import java.sql.SQLException;

public class UserProgram {
    public static void main(String[] args) throws SQLException {
        UserFunction function = new UserFunction();
        function.showMenu();
    }
}
