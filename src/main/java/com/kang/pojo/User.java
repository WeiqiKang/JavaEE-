package com.kang.pojo;

public class User {
    private String username;
    private String password;
    private String identify;
    private String class_num;
    private String id;
    public User() {

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String identify, String class_num, String id) {
        this.username = username;
        this.password = password;
        this.identify = identify;
        this.class_num = class_num;
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify;
    }

    public String getClass_num() {
        return class_num;
    }

    public void setClass_num(String class_num) {
        this.class_num = class_num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
