package entity;

public class User {
    private int id;
    private String fullName;
    private String email;
    private String password;
    private Role role;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = Role.valueOf(role);
    }

    public enum Role {
        MANAGER, EMPLOYEE
    }

//    public User(String fullName, String email, String password, Role role) {
//        this.fullName = fullName;
//        this.email = email;
//        this.password = password;
//        this.role = role;
//    }

    @Override
    public String toString() {
        return String.format("| %-2d | %-20s | %-25s | %-10s |", id, fullName, email, role);
    }

}
