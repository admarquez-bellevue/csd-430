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
            out.println("Invalid movie ID format.");
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

<% if (movie != null) { %>
    <p>Below are the details for the selected movie from the database:</p>
    <table border="1">
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Director</th>
                <th>Release Year</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= movie.getMovie_id() %></td>
                <td><%= movie.getTitle() %></td>
                <td><%= movie.getDirector() %></td>
                <td><%= movie.getRelease_year() %></td>
                <td><%= movie.getGenre() %></td>
                <td><%= movie.getRating() %></td>
            </tr>
        </tbody>
    </table>
<% } else { %>
    <p>No movie found or an error occurred.</p>
<% } %>

<br><a href="index.jsp">Back to Movie Selection</a>
</body>
</html>

