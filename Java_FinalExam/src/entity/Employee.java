package entity;

public class Employee extends User{
    private int projectId;
    private String proSkill;
    @Override
    public String toString() {
        return super.toString() + String.format(" ProjectID: %-2d | ProSkill: %-10s |", projectId, proSkill);
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProSkill() {
        return proSkill;
    }

    public void setProSkill(String proSkill) {
        this.proSkill = proSkill;
    }
}
