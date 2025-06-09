<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String visitDate = request.getParameter("visitDate");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Received</title>
</head>
<body>
    <h2>Thank You for Your Feedback!</h2>
    <p>Here is a summary of your submission:</p>
    <table border="1">
        <tr><th>Field</th><th>Response</th></tr>
        <tr><td>Name</td><td><%= name %></td></tr>
        <tr><td>Email</td><td><%= email %></td></tr>
        <tr><td>Date of Visit</td><td><%= visitDate %></td></tr>
        <tr><td>Service Rating</td><td><%= rating %></td></tr>
        <tr><td>Comments</td><td><%= comments %></td></tr>
    </table>
</body>
</html>