package movieproject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/csd430?useSSL=false&serverTimezone=UTC";
    private final String jdbcUsername = "student1";
    private final String jdbcPassword = "pass";

    private Connection jdbcConnection;

    // Establish connection and assign to jdbcConnection
    public void connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
    }

    // Close connection if open
    public void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Fetch all movie IDs from the database
    public List<Integer> getAllMovieIds() throws SQLException {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT movie_id FROM adrian_movies_data";

        connect(); // connect to DB
        try (Statement statement = jdbcConnection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                ids.add(resultSet.getInt("movie_id"));
            }
        } finally {
            disconnect();
        }

        return ids;
    }

    // Fetch a movie by ID
    public Movie getMovieById(int id) throws SQLException {
        Movie movie = null;
        String sql = "SELECT * FROM adrian_movies_data WHERE movie_id = ?";

        connect();
        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
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
            }
        } finally {
            disconnect();
        }

        return movie;
    }
}
