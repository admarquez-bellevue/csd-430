<!-- Adrian Marquez
	 CSD 430
	 07/06/2025
-->
<%@ page import="movieproject.MovieBean, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Database</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f9f9f9;
        }
        h2 {
            color: #333;
        }
        form {
            margin-bottom: 30px;
        }
        input, select {
            margin: 5px 0;
            padding: 8px;
            width: 300px;
            font-size: 14px;
        }
        input[type=submit] {
            width: auto;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #0056b3;
        }
        hr {
            margin: 40px 0;
        }
    </style>
</head>
<body>

<%
    MovieBean bean = new MovieBean();
    List<Integer> movieIds = bean.getAllMovieIds();  // Load all movie IDs for selection
%>

<h2>View or Update a Movie</h2>
<form action="edit.jsp" method="get">
    <label for="movie_id">Select a Movie ID:</label><br>
    <select name="movie_id" id="movie_id">
        <% for (Integer id : movieIds) { %>
            <option value="<%=id%>"><%=id%></option>
        <% } %>
    </select><br>
    <input type="submit" value="Edit Movie">
</form>

<hr>

<h2>Add a New Movie</h2>
<form action="insert.jsp" method="post">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" required><br>

    <label for="genre">Genre:</label><br>
    <input type="text" id="genre" name="genre" required><br>

    <label for="release_year">Release Year:</label><br>
    <input type="number" id="release_year" name="release_year" required><br>

    <label for="director">Director:</label><br>
    <input type="text" id="director" name="director" required><br>

    <label for="rating">Rating (0.0 - 10.0):</label><br>
    <input type="number" step="0.1" min="0" max="10" id="rating" name="rating" required><br>

    <input type="submit" value="Add Movie">
</form>
<hr>
<p><a href="delete.jsp">Go to Delete Movie Page</a></p>

</body>
</html>