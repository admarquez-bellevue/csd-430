<%@ page import="movieproject.MovieBean, movieproject.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Movie</title>
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
            margin-top: 20px;
        }
        input {
            display: block;
            margin: 10px 0;
            padding: 8px;
            width: 300px;
            font-size: 14px;
        }
        input[type=submit] {
            width: auto;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #218838;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    String movieIdParam = request.getParameter("movie_id");
    Movie movie = null;

    if (movieIdParam != null) {
        try {
            int id = Integer.parseInt(movieIdParam);
            MovieBean bean = new MovieBean();
            movie = bean.getMovieById(id);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error loading movie: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
%>

<h2>Edit Movie</h2>

<% if (movie != null) { %>
<form action="update.jsp" method="post">
    <label>Movie ID (Read-only):</label>
    <input type="text" name="movie_id" value="<%= movie.getMovie_id() %>" readonly />

    <label>Title:</label>
    <input type="text" name="title" value="<%= movie.getTitle() %>" required />

    <label>Genre:</label>
    <input type="text" name="genre" value="<%= movie.getGenre() %>" required />

    <label>Release Year:</label>
    <input type="number" name="release_year" value="<%= movie.getRelease_year() %>" required />

    <label>Director:</label>
    <input type="text" name="director" value="<%= movie.getDirector() %>" required />

    <label>Rating:</label>
    <input type="number" step="0.1" name="rating" value="<%= movie.getRating() %>" required />

    <input type="submit" value="Update Movie" />
</form>
<% } else { %>
    <p style="color:red;">No movie found with the given ID.</p>
<% } %>

<a href="index.jsp">← Back to Home</a>

</body>
</html>