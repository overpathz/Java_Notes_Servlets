package servlets;

import db.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;

@WebServlet("/changeNote")
public class ChangeNote extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteIDreq = Integer.parseInt(request.getParameter("noteID"));
        String noteContentReq = request.getParameter("noteContent");
        Database.setNoteID(noteIDreq);

        Database.setNoteContent(noteContentReq);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/changenote.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
