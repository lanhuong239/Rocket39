package Exercise2;

public class Department {
    private int id;
    private String dName;

    public Department(int id, String dName) {
        this.id = id;
        this.dName = dName;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", dName='" + dName + '\'' +
                '}';
    }
}
