package utils;

import java.io.File;

public class FileManager {
    public static final String FILE_NOT_EXISTS = "Error! File not exists."

    public static boolean exists(String path){
        return new File(path).exists();
    }

    public static boolean deleteFile(String path){
        if(!exists(path)){
            throw new IllegalStateException(FILE_NOT_EXISTS);
        }
        return new File(path).delete();
    }

    public static boolean isFile(String path){
        return new File(path).isFile();
    }
}
