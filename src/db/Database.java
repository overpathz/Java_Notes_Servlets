package db;

import models.Note;

import java.util.ArrayList;
import java.util.List;

import models.Note;

public final class Database {

    private static int noteID;
    private static String noteContent;
    private static List<Note> notes = new ArrayList<>();

    public static void addNote(Note note) {
        notes.add(note);
    }

    public static void clearNotes() {
        Database.getNotes().clear();
        Note.setCount(0);
    }
    
    // TODO
    public static void removeNote(int id) {
        List<Note> notes = Database.getNotes();
        for (int i = 0; i < notes.size(); i++) {
            if (notes.get(i).getId() == id) {
                notes.remove(i);
            }
        }

        Note.setCount(Note.getCount() - 1);
    }

    public static int getNoteID() {
        return noteID;
    }

    public static void setNoteID(int noteID) {
        Database.noteID = noteID;
    }

    public static String getNoteContent() {
        return noteContent;
    }

    public static void setNoteContent(String noteContent) {
        Database.noteContent = noteContent;
    }

    public static List<Note> getNotes() {
        return notes;
    }

}
