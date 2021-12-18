package com.kang.pojo;

public class Coursecatalog {
    private String courseNo;
    private String courseName;
    private double credits;

    public Coursecatalog(String courseNo, String courseName, double credits) {
        this.courseNo = courseNo;
        this.courseName = courseName;
        this.credits = credits;
    }

    public Coursecatalog() {
    }

    public String getCourseNo() {
        return courseNo;
    }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public double getCredits() {
        return credits;
    }

    public void setCredits(double credits) {
        this.credits = credits;
    }
}
