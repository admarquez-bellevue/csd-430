<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<!-- Adrian Marquez
	 Module 3.2 Assignment
	 06/08/2025
 -->
<html>
<head>
    <title>Restaurant Feedback Form</title>
</head>
<body>
    <h2>Restaurant Service Feedback</h2>
    <form action="displayFeedback.jsp" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Date of Visit:</label><br>
        <input type="date" name="visitDate" required><br><br>

        <label>Rate our service:</label><br>
        <select name="rating">
            <option>Excellent</option>
            <option>Good</option>
            <option>Fair</option>
            <option>Poor</option>
        </select><br><br>

        <label>Additional Comments:</label><br>
        <textarea name="comments" rows="4" cols="40"></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>