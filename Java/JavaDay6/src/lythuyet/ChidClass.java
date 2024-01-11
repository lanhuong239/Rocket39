package lythuyet;

public class ChidClass implements IParent{
    private String identity;
    private String name;

    public ChidClass(String identity, String name) {
        this.identity = identity;
        this.name = name;
    }

    @Override
    public void displayInfor() {
        System.out.println("Identity: " + identity);
        System.out.println("Name: " + name);

    }

    @Override
    public String getIdentity() {
        return this.identity;
    }
}
