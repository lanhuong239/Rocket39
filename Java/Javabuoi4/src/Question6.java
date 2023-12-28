import java.util.Scanner;

public class Question6 {
    public static void question6() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập full name: ");
        String fullName = scanner.nextLine().trim();
        String[] partOfName = fullName.split(" ");

        if (partOfName.length == 3) {
            System.out.println("Họ là: " + partOfName[0]);
            System.out.println("Tên đệm là: " + partOfName[1]);
            System.out.println("Tên là: " + partOfName[2]);
        } else if (partOfName.length == 2) {
            System.out.println("Họ là: " + partOfName[0]);
            System.out.println("Tên là: " + partOfName[1]);
        } else {
            System.out.println("Nhập tên gồm 3 từ");
        }

        scanner.close();
    }
    public static void main(String[] args) {
        question6();
    }
}
