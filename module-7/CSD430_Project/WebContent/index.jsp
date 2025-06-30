<%@ page import="movieproject.MovieBean, java.sql.SQLException, java.util.List, java.util.ArrayList" %>
<html>
<head><title>Movie List</title></head>
<body>
<%
MovieBean bean = new MovieBean();
List<Integer> movieIds = new ArrayList<>();  // Initialize to empty list
movieIds = bean.getAllMovieIds();  // No try/catch needed if no SQLException thrown
%>

<h2>Select a Movie</h2>
<form action="display.jsp" method="get">
    <select name="movie_id">
        <% for (Integer id : movieIds) { %>
            <option value="<%=id%>"><%=id%></option>
        <% } %>
    </select>
    <input type="submit" value="Submit" />
</form>

<hr>

<h2>Add a New Movie</h2>
<form action="insert.jsp" method="post">
    Title: <input type="text" name="title" required><br>
    Genre: <input type="text" name="genre" required><br>
    Release Year: <input type="number" name="release_year" required><br>
    Director: <input type="text" name="director" required><br>
    Rating: <input type="number" step="0.1" name="rating" required><br>
    <input type="submit" value="Add Movie" />
</form>
</body>
</html>