<%@ page import="model.FeedbackJavabean" %>
<%
    // Create JavaBean and populate it
    FeedbackJavabean fb = new FeedbackJavabean();
    fb.setName(request.getParameter("name"));
    fb.setEmail(request.getParameter("email"));
    fb.setVisitDate(request.getParameter("visitDate"));
    fb.setRating(request.getParameter("rating"));
    fb.setComments(request.getParameter("comments"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Summary</title>
</head>
<body>
    <h2>Feedback Summary</h2>
    <p>Thank you for your feedback! Here's what you submitted:</p>
    <table border="1">
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>Name</td><td><%= fb.getName() %></td></tr>
        <tr><td>Email</td><td><%= fb.getEmail() %></td></tr>
        <tr><td>Visit Date</td><td><%= fb.getVisitDate() %></td></tr>
        <tr><td>Rating</td><td><%= fb.getRating() %></td></tr>
        <tr><td>Comments</td><td><%= fb.getComments() %></td></tr>
    </table>
</body>
</html>