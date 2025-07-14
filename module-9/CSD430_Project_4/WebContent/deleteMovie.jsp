<!-- Adrian Marquez
	 CSD 430
	 07/13/2025
-->
<%@ page import="movieproject.MovieBean" %>
<%
    int id = Integer.parseInt(request.getParameter("movie_id"));
    MovieBean bean = new MovieBean();
    bean.deleteMovieById(id);
    response.sendRedirect("delete.jsp"); // refresh with updated table
%>