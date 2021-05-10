package models;

import db.Database;

import java.util.Random;

public class Note {
    private static int count = 0;

    private String content;
    private String username;
    private long id;

    public Note(String content, String username) {
        count++;
        this.content = content;
        this.username = username;
        id = (long) (Math.random()*(999998+1)) + 1;
    }

    @Override
    public String toString() {
        return "Note:"+
                "\nUsername: " + username +
                "\nContent: " + content + "\n";
    }


    public static void setCount(int count) {
        Note.count = count;
    }

    public static int getCount() {
        return count;
    }

    public long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
