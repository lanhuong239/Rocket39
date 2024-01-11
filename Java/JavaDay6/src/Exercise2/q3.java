package Exercise2;

public class q3 {
    public static void main(String[] args) {
        try {
            int[] numbers = {1, 2, 3};
            System.out.println(numbers[10]);
        } catch (Exception ex){
            System.out.println("Index out of bound");
        }

    }
}
