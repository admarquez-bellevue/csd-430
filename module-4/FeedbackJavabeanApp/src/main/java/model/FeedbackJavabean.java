// Adrian Marquez
// Module 4.2 Assignment
// 06/15/2025
// The purpose of this assignment is to demonstrate how to use a JavaBean to encapsulate user 
// input data and display it dynamically on a JSP page using scriptlets and HTML formatting.
package model;

import java.io.Serializable;

public class FeedbackJavabean implements Serializable {
    private String name;
    private String email;
    private String visitDate;
    private String rating;
    private String comments;

    public FeedbackJavabean() {}

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getVisitDate() { return visitDate; }
    public void setVisitDate(String visitDate) { this.visitDate = visitDate; }

    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }
}

