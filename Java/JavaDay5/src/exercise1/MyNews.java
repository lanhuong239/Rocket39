package exercise1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class MyNews {
    private Scanner scanner;
    private ArrayList<News> listNews;

    public MyNews(){
        scanner = new Scanner(System.in);
        listNews = new ArrayList<>();
    }

    public void question1() {
        loadMenu();

    }

    private void loadMenu() {
        while (true) {
            System.out.println("1. Insert news");
            System.out.println("2. View list news");
            System.out.println("3. Average rate");
            System.out.println("4. Exit");
            int choice = scanner.nextInt();

            switch (choice){
                case 1:
                    System.out.println("Input title");
                    String title = scanner.next();
                    System.out.println("Input publish date");
                    String publishDate = scanner.next();
                    System.out.println("Input author");
                    String author = scanner.next();
                    System.out.println("Input content");
                    String content = scanner.next();
                    System.out.println("Input first rate: ");
                    int rate1 = scanner.nextInt();
                    System.out.println("Input second rate: ");
                    int rate2 = scanner.nextInt();
                    System.out.println("Input third rate: ");
                    int rate3 = scanner.nextInt();
                    int[] rates = {rate1, rate2, rate3};
                    News news = new News(title, publishDate, author, content, rates);
                    listNews.add(news);
                    break;
                case 2:
                    for (News news1 : listNews){
                        news1.Display();
                    }

                    break;
                case 3:
                    //Average rate display
                    for (News news1 : listNews){
                        System.out.println("Title: " + news1.getTitle()+ "Average rate: " + news1.Calculate());
                    }
                    break;
                case 4:
                    return;

                default:
                    System.out.println("Input the right number");
                    break;
            }
        }

    }



}
