package Exercise1;

public class Student {
    private int id;
    private String name;
    public static int COUNT = 0;

    public Student(String name) {
        this.id = COUNT;

        this.name = name;
    }
}
