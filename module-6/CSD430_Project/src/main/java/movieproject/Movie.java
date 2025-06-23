package movieproject;

public class Movie {
    private int movie_id;
    private String title;
    private String genre;
    private int release_year;
    private String director;
    private double rating;

    public Movie(int movie_id, String title, String genre, int release_year, String director, double rating) {
        this.movie_id = movie_id;
        this.title = title;
        this.genre = genre;
        this.release_year = release_year;
        this.director = director;
        this.rating = rating;
    }

    public int getMovie_id() { return movie_id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public int getRelease_year() { return release_year; }
    public String getDirector() { return director; }
    public double getRating() { return rating; }
}
