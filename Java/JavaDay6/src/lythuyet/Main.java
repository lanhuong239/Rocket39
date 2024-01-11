package lythuyet;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world");
        IParent parent;
        parent = new ChidClass("123-123-654-654","Axx Bxx Cxx");

        parent.displayInfor();

        System.out.println(parent.getIdentity());
    }
}