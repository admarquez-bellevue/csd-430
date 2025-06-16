<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Form</title>
</head>
<body>
    <h2>Submit Your Restaurant Feedback</h2>
    <form action="displayFeedback.jsp" method="post">
        <label>Name:</label><br>
        <input type="text" name="name"><br><br>

        <label>Email:</label><br>
        <input type="email" name="email"><br><br>

        <label>Date of Visit:</label><br>
        <input type="date" name="visitDate"><br><br>

        <label>Rate our Service:</label><br>
        <select name="rating">
            <option>Excellent</option>
            <option>Good</option>
            <option>Fair</option>
            <option>Poor</option>
        </select><br><br>

        <label>Comments:</label><br>
        <textarea name="comments" rows="4" cols="40"></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>