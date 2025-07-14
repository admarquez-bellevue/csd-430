<!-- Adrian Marquez
	 CSD 430
	 07/13/2025
-->
<%@ page import="movieproject.MovieBean, movieproject.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Movie</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #e2e2e2;
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
    try {
        int id = Integer.parseInt(request.getParameter("movie_id"));
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        String director = request.getParameter("director");
        double rating = Double.parseDouble(request.getParameter("rating"));

        Movie updatedMovie = new Movie(id, title, genre, releaseYear, director, rating);
        MovieBean bean = new MovieBean();
        boolean success = bean.updateMovie(updatedMovie);

        if (success) {
%>
<h2>Movie Updated Successfully</h2>
<table>
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Director</th><th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= updatedMovie.getMovie_id() %></td>
            <td><%= updatedMovie.getTitle() %></td>
            <td><%= updatedMovie.getGenre() %></td>
            <td><%= updatedMovie.getRelease_year() %></td>
            <td><%= updatedMovie.getDirector() %></td>
            <td><%= updatedMovie.getRating() %></td>
        </tr>
    </tbody>
</table>
<%
        } else {
%>
<p style="color:red;">Failed to update the movie. Please try again.</p>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>

<a href="index.jsp">← Back to Home</a>

</body>
</html>