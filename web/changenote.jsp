<%--
  Created by IntelliJ IDEA.
  User: overpathz
  Date: 09.05.2021
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.Database" %>
<%@ page import="models.Note" %>
<html>
<head>
    <title>Изменить заметку</title>
</head>
<body>
    <form action="/change" method="post">
        <label for="content"><b>Enter the new note text:</b></label>
        <br>

        <% String content = Database.getNoteContent();
            request.setAttribute("content", content);
        %>

        <textarea name="content" id="content" cols="30" rows="10">${content}</textarea>
        <br><br>
        <input type="submit" value="Изменить">
    </form>
</body>
</html>
