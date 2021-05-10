<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="db.Database" %>
<%@ page import="models.Note" %>
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
        <style type="text/css">
            #content {
                resize: none;
            }

            .no1 {
                display: none;
            }

            .form:focus {
                border: 3px solid #555;
                transition: 2s;
            }
        </style>
    </head>
    <body>
        <h1 align="center">ЗАМЕТКИ</h1>
        <form action="/notes" method="POST">
            <label for="username"><b>Username:</b></label><br>
            <input type="text" id="username" name="username">

            <br><br>

            <label for="content"><b>Your note:</b></label><br>
            <textarea name="content" id="content" cols="60" rows="10" placeholder="Введите вашу заметку"></textarea>

            <br><br>
            <input type="submit" value="Добавить заметку">
        </form>

        <form action="/clearNotes" method="post">
            <input type="submit" value="Очистить заметки">
        </form>

        <h3>NOTES: <b>${notesCounter}</b></h3>
        <hr width="15%" align="left" size="3" color="black">



        <div>

            <c:forEach var="note" items="${notes}">
                <div class="form">
                    <p><b>Note username: </b><c:out value="${note.getUsername()}"> </c:out></p>
                    <p><b>Note content: </b><c:out value="${note.getContent()}"> </c:out></p>

                    <form action="/changeNote" method="post">
                        <label for="noteID" class="no1"></label>
                        <input type="text" name="noteID" id="noteID" class="no1" value="${note.getId()}">
                        <textarea id="noteContent" name="noteContent" class="no1">${note.getContent()}</textarea>
                        <input type="submit" value="Изменить заметку">
                    </form>

                    <form action="/deleteNote" method="post">
                        <label for="noteID1" class="no1"></label>
                        <input type="text" name="noteID1" id="noteID1" class="no1" value="${note.getId()}">
                        <input type="submit" value="Удалить заметку">
                    </form>

                    <br><br>
                </div>
            </c:forEach>

        </div>


    </body>
</html>