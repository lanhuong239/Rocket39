package Exercise2;

public class q1 {
    public static void main(String[] args) {
        try {
            float result = divide(7, 0);

            System.out.println(result);
        } catch (Exception ex){
            System.out.println("cannot divide 0");
        } finally {
            System.out.println("divide completed");
        }
    }
    public static float divide(int a, int b){
        return a/b;
    }
}
