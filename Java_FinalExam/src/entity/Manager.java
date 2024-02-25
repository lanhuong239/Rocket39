package entity;

public class Manager extends User{
    private int expInYear;
    private int projectId;

    public int getExpInYear() {
        return expInYear;
    }

    public void setExpInYear(int expInYear) {
        this.expInYear = expInYear;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return super.toString() + String.format(" Exp: %-2d | ProjectID: %-2d |", expInYear, projectId);
    }
}
