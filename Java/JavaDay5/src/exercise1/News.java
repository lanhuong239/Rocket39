package exercise1;

public class News implements INews {
    private int id;
    private String title;
    private String publishDate;
    private String author;
    private String content;
    private float averageRate;
    private int[] rates;
    public static int COUNT = 0;

    public News(String title, String publishDate, String author, String content, int[] rates) {
        COUNT++;
        this.id = id;
        this.title = title;
        this.publishDate = publishDate;
        this.author = author;
        this.content = content;
        this.rates = rates;
        this.Calculate();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getAverageRate() {
        return averageRate;
    }





    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title=" + title +
                ", publishDate=" + publishDate +
                ", author=" + author +
                ", content=" + content +
                ", averageAge=" + averageRate +
                '}';
    }

    @Override
    public void Display() {
        System.out.println(this.toString());
    }

    @Override
    public float Calculate() {
//         rates = new int[3];
//
//        this.averageRate = 0;
//        //cach 1
//        this.averageRate = (float)(rates[0] + rates[1] + rates[2])/3);

        //cach 2
        for (int i = 0; i < this.rates.length; i++) {
            averageRate = averageRate + rates[i];
        }
        this.averageRate = averageRate / rates.length;
        return averageRate;

    }
}
