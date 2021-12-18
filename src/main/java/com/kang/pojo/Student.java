package com.kang.pojo;

public class Student {
    private String name; //学生姓名
    private String id; //学生学号
    private String major; //学生专业
    private String degree; //学生学位

    public Student(String name, String id, String major, String degree) {
        this.name = name;
        this.id = id;
        this.major = major;
        this.degree = degree;
    }

    public Student() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }
}
