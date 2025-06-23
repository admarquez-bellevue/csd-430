<%@ page import="movieproject.MovieBean, java.sql.SQLException, java.util.List, java.util.ArrayList" %>
<html>
<head><title>Movie List</title></head>
<body>
<%
    MovieBean bean = new MovieBean();
    List<Integer> movieIds = new ArrayList<>();  // Initialize to empty list
    try {
        movieIds = bean.getAllMovieIds();
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
        e.printStackTrace();
    }
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
</body>
</html>