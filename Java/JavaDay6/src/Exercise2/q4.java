package Exercise2;

public class q4 {

    public static void ques4(int i, Department[] departments) throws CustomException {
//        try {
//            Department department = departments[i];
//            System.out.println(department);
//        } catch ( e){
//            System.out.println(e.getMessage());
//        }
//        if (i<0 || i>departments.length-1)
//            throw new CustomException("Sai do dai");
//        else
            System.out.println(departments[i]);
    }

    public static void main(String[] args){
        Department[] departments = new Department[3];
        departments[1] = new Department(1, "A");
        // lay ptu o vtri thu i=1
        try {
            Department department = departments[10];
            System.out.println(department);
        } catch (Exception e){
            System.out.println("ko tim thay");
        }
//        try {
//            ques4(10, departments);
//        }catch (CustomException e){
//            System.out.println(e.getMessage());
//        }


    }

}
