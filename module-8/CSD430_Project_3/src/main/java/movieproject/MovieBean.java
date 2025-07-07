// Adrian Marquez
// CSD 430
// 07/06/25

package movieproject;

import java.sql.*;
import java.util.*;

public class MovieBean {
    private String jdbcURL = "jdbc:mysql://localhost:3306/csd430?useSSL=false&serverTimezone=UTC";
    private String jdbcUsername = "student1";
    private String jdbcPassword = "pass";
    private Connection jdbcConnection;

    // Connect to database
    public Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connected successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("SQL Exception during connection.");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("General exception during connection.");
            e.printStackTrace();
        }
        return jdbcConnection;
    }

    // Disconnect from database
    public void disconnect() {
        try {
            if (jdbcConnection != null && !jdbcConnection.isClosed()) {
                jdbcConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all movie IDs
    public List<Integer> getAllMovieIds() {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT movie_id FROM adrian_movies_data";

        try {
            connect();
            Statement statement = jdbcConnection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                ids.add(resultSet.getInt("movie_id"));
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return ids;
    }

    // Get movie by ID
    public Movie getMovieById(int id) {
        Movie movie = null;
        String sql = "SELECT * FROM adrian_movies_data WHERE movie_id = ?";

        try {
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                movie = new Movie(
                    resultSet.getInt("movie_id"),
                    resultSet.getString("title"),
                    resultSet.getString("genre"),
                    resultSet.getInt("release_year"),
                    resultSet.getString("director"),
                    resultSet.getDouble("rating")
                );
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return movie;
    }

    // Add new movie
    public boolean addMovie(Movie movie) {
        String sql = "INSERT INTO adrian_movies_data (title, genre, release_year, director, rating) VALUES (?, ?, ?, ?, ?)";
        boolean success = false;

        try {
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getGenre());
            statement.setInt(3, movie.getRelease_year());
            statement.setString(4, movie.getDirector());
            statement.setDouble(5, movie.getRating());

            int rowsInserted = statement.executeUpdate();
            success = rowsInserted > 0;

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return success;
    }

    // Add movie and return its generated ID
    public int addMovieAndReturnId(Movie movie) {
        int newId = -1;
        String sql = "INSERT INTO adrian_movies_data (title, genre, release_year, director, rating) VALUES (?, ?, ?, ?, ?)";

        try {
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getGenre());
            statement.setInt(3, movie.getRelease_year());
            statement.setString(4, movie.getDirector());
            statement.setDouble(5, movie.getRating());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    newId = generatedKeys.getInt(1);
                }
                generatedKeys.close();
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return newId;
    }

    // Update existing movie
    public boolean updateMovie(Movie movie) {
        String sql = "UPDATE adrian_movies_data SET title = ?, genre = ?, release_year = ?, director = ?, rating = ? WHERE movie_id = ?";
        boolean success = false;

        try {
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getGenre());
            statement.setInt(3, movie.getRelease_year());
            statement.setString(4, movie.getDirector());
            statement.setDouble(5, movie.getRating());
            statement.setInt(6, movie.getMovie_id());

            int rowsUpdated = statement.executeUpdate();
            success = rowsUpdated > 0;

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }

        return success;
    }
}
