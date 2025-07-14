<!-- Adrian Marquez
	 CSD 430
	 07/13/2025
-->
<%@ page import="movieproject.MovieBean, movieproject.Movie, java.util.List" %>
<html>
<head>
    <title>Delete a Movie</title>
        <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 40px;
	            background-color: #f5f5f5;
	        }
	        h1, h2, h3 {
	            color: #333;
	        }
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-bottom: 25px;
	        }
	        table, th, td {
	            border: 1px solid #aaa;
	        }
	        th, td {
	            padding: 10px;
	            text-align: left;
	            background-color: #fff;
	        }
	        thead {
	            background-color: #e0e0e0;
	        }
	        form {
	            background-color: #fff;
	            padding: 20px;
	            border: 1px solid #ccc;
	            width: fit-content;
	        }
	        input[type="submit"] {
	            margin-top: 10px;
	            padding: 8px 15px;
	        }
	        a {
	            display: inline-block;
	            margin-top: 20px;
	        }
    </style>
</head>
<body>
    <h2>All Movies</h2>
    <%
        MovieBean bean = new MovieBean();
        List<Movie> movies = bean.getAllMovies();
        List<Integer> movieIds = bean.getAllMovieIds();
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Director</th><th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <% for (Movie m : movies) { %>
                <tr>
                    <td><%= m.getMovie_id() %></td>
                    <td><%= m.getTitle() %></td>
                    <td><%= m.getGenre() %></td>
                    <td><%= m.getRelease_year() %></td>
                    <td><%= m.getDirector() %></td>
                    <td><%= m.getRating() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <h3>Delete a Movie by ID</h3>
    <form action="deleteMovie.jsp" method="post">
        <label for="movie_id">Choose a Movie ID to delete:</label>
        <select name="movie_id" id="movie_id">
            <% for (Integer id : movieIds) { %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
        <input type="submit" value="Delete Movie" />
    </form>

    <p><a href="index.jsp">Back to Index</a></p>
</body>
</html>