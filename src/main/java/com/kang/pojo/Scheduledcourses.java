package com.kang.pojo;

public class Scheduledcourses{ //排课表
    private int sid; // 排课id
    private String courseNo; //课程号
    private String classNo; //班级编号
    private String dayOfWeek;//星期
    private String timeOfDay;//上课时间
    private String room; //教室编号
    private int capacity;//课程容量

    public Scheduledcourses(int sid, String courseNo, String classNo, String dayOfWeek, String timeOfDay, String room, int capacity) {
        this.sid = sid;
        this.courseNo = courseNo;
        this.classNo = classNo;
        this.dayOfWeek = dayOfWeek;
        this.timeOfDay = timeOfDay;
        this.room = room;
        this.capacity = capacity;
    }

    public Scheduledcourses() {
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getCourseNo() {
        return courseNo;
    }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    public String getClassNo() {
        return classNo;
    }

    public void setClassNo(String classNo) {
        this.classNo = classNo;
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

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
}
