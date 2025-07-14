<%@ page import="movieproject.MovieBean, movieproject.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get parameters from the form submission
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    String releaseYearParam = request.getParameter("release_year");
    String ratingParam = request.getParameter("rating");

    // Basic validation: check required parameters
    if (title == null || genre == null || director == null || releaseYearParam == null || ratingParam == null ||
        title.isEmpty() || genre.isEmpty() || director.isEmpty() || releaseYearParam.isEmpty() || ratingParam.isEmpty()) {
        out.println("Error: All fields are required.");
        return;
    }

    try {
        int releaseYear = Integer.parseInt(releaseYearParam);
        double rating = Double.parseDouble(ratingParam);

        // Create new Movie object using setters or constructor
        Movie newMovie = new Movie();
        newMovie.setTitle(title);
        newMovie.setGenre(genre);
        newMovie.setDirector(director);
        newMovie.setRelease_year(releaseYear);
        newMovie.setRating(rating);

        // Create MovieBean and add movie
        MovieBean bean = new MovieBean();
        boolean success = bean.addMovie(newMovie);

        if (success) {
            // Redirect to index.jsp or display.jsp after successful insert
            response.sendRedirect("index.jsp");
        } else {
            out.println("Failed to add movie. Please try again.");
        }

    } catch (NumberFormatException e) {
        out.println("Invalid number format for release year or rating.");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }
%>