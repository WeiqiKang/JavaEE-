package com.kang.pojo;

public class Faculty {
    //老师表
    private String name; //姓名
    private String pid; //工号
    private String title; //职称
    private String dept; //部门

    public Faculty(String name, String pid, String title, String dept) {
        this.name = name;
        this.pid = pid;
        this.title = title;
        this.dept = dept;
    }

    public Faculty() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
}
