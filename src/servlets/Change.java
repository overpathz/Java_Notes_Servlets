package servlets;

import db.Database;
import models.Note;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/change")
public class Change extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String receivedContent = Database.getNoteContent();
        String contentRequest = request.getParameter("content");

        List<Note> notes = Database.getNotes();

        for (Note note: notes) {
            if (note.getContent().equals(receivedContent)) {
                note.setContent(contentRequest);
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/notes.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
