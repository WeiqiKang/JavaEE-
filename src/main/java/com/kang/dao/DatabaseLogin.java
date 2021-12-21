package com.kang.dao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseLogin extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/RGStudent?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSI=true";
    String username_0 = "root";
    String password_0 = "123456";
    Connection connection = null;
    Statement statement = null;

    protected void InitDatabase() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        connection = DriverManager.getConnection(url, username_0, password_0);
        statement = connection.createStatement();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            InitDatabase();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String method = req.getParameter("method");

        String username = req.getParameter("username1");
        String password = req.getParameter("password1");
        String RememberMe1 = req.getParameter("RememberMe1");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
