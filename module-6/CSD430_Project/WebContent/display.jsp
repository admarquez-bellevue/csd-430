<%@ page import="movieproject.MovieBean" %>
<%@ page import="movieproject.Movie" %>
<%
    String movieId = request.getParameter("movie_id");
    Movie movie = null;

    if (movieId != null) {
        try {
            int id = Integer.parseInt(movieId);
            MovieBean bean = new MovieBean();
            movie = bean.getMovieById(id);
        } catch (NumberFormatException e) {
            out.println("Invalid movie ID.");
        } catch (Exception e) {
            out.println("Error fetching movie: " + e.getMessage());
            e.printStackTrace();
        }
    } else {
        out.println("No movie ID provided.");
    }
%>
<html>
<head>
    <title>Movie Info</title>
</head>
<body>
<h2>Movie Details</h2>
<table border="1">
    <tr><th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th></tr>
    <tr>
        <td><%= movie.getMovie_id() %></td>
        <td><%= movie.getTitle() %></td>
        <td><%= movie.getDirector() %></td>
        <td><%= movie.getRelease_year() %></td>
        <td><%= movie.getGenre() %></td>
    </tr>
</table>
<a href="index.jsp">Back</a>
</body>
</html>
