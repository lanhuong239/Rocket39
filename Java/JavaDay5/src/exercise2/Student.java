package exercise2;

public class Student implements IStudent{
    private int id;
    private String name;
    private int group;
    public static int COUNT = 0;

    public Student(String name, int group) {
        COUNT++;
        this.id = COUNT;
        this.name = name;
        this.group = group;
    }

    @Override
    public void diemDanh() {
        System.out.println(name + "diem danh");
    }

    @Override
    public void hocBai() {
        System.out.println(name + "dang hoc bai");
    }

    @Override
    public void donVeSinh() {
        System.out.println(name + "don hoc bai");
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", group=" + group +
                ", COUNT=" + COUNT +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }
}
