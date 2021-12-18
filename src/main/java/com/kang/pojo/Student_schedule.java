package com.kang.pojo;

public class Student_schedule { //学生选课
    private String sid; //学生学号
    private String cid; //课程号

    public Student_schedule(String sid, String cid) {
        this.sid = sid;
        this.cid = cid;
    }

    public Student_schedule() {
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }
}
