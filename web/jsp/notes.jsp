<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="db.Database" %>
<%@ page import="models.Note" %>
<%@ page import="servlets.Notes" %>
<%@ page import="java.util.List" %>
<%request.setCharacterEncoding("UTF-8");%>

<% List<Note> notes = Database.getNotes();
    request.setAttribute("notes", notes);
    int notesCounter = Note.getCount();
    request.setAttribute("notesCounter", notesCounter);
%>

<html>
    <head>
        <title>servlets.Notes</title>
        <link rel="stylesheet" href="/static/notes.css" type="text/css">
    </head>
    <body>
        <h1 align="center">NOTES</h1>

        <div align="center">
            <div class="form">
                <form action="/notes" method="POST" >
                    <label for="username"><b>Username:</b></label><br>
                    <input type="text" id="username" name="username">

                    <br><br>

                    <label for="content"><b>Your note:</b></label><br>
                    <textarea name="content" id="content" cols="40" rows="8" placeholder="Enter your note"></textarea>

                    <br><br>
                    <input type="submit" value="Add note">
                </form>

                <form action="/clearNotes" method="post">
                    <input type="submit" value="Clear all notes">
                </form>
            </div>
        </div>


        <div align="center">
            <h3>NOTES: <b>${notesCounter}</b></h3>
            <hr width="35%" align="cener" size="2" color="black">
        </div>


        <div align="center">

            <c:forEach var="note" items="${notes}">
                <div class="form" >
                    <p><b>Note username: </b><c:out value="${note.getUsername()}"> </c:out></p>
                    <p><b>Note content: </b><c:out value="${note.getContent()}"> </c:out></p>

                    <form action="/changeNote" method="post">
                        <label for="noteID" class="no1"></label>
                        <input type="text" name="noteID" id="noteID" class="no1" value="${note.getId()}">
                        <textarea id="noteContent" name="noteContent" class="no1">${note.getContent()}</textarea>
                        <input type="submit" value="Change note">
                    </form>

                    <form action="/deleteNote" method="post">
                        <label for="noteID1" class="no1"></label>
                        <input type="text" name="noteID1" id="noteID1" class="no1" value="${note.getId()}">
                        <input type="submit" value="Delete note">
                    </form>

                    <br><br>
                </div>
            </c:forEach>

        </div>


    </body>
</html>