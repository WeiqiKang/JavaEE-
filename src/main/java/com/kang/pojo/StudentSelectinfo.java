package com.kang.pojo;

public class StudentSelectinfo {
    private String stuID;
    private String stuName;
    private int sid;
    private String courseID;
    private String courseName;
    private String dayOfWeek;
    private String timeOfDay;
    private String room;

    public StudentSelectinfo(String stuID, String stuName, int sid, String courseID, String courseName, String dayOfWeek, String timeOfDay, String room) {
        this.stuID = stuID;
        this.stuName = stuName;
        this.sid = sid;
        this.courseID = courseID;
        this.courseName = courseName;
        this.dayOfWeek = dayOfWeek;
        this.timeOfDay = timeOfDay;
        this.room = room;
    }

    public StudentSelectinfo() {
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getTimeOfDay() {
        return timeOfDay;
    }

    public void setTimeOfDay(String timeOfDay) {
        this.timeOfDay = timeOfDay;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
}
