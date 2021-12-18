package com.kang.dao;

import com.alibaba.fastjson.JSONArray;
import com.kang.pojo.Coursecatalog;
import com.kang.pojo.StudentLinkSchedule;
import com.kang.pojo.StudentSelectinfo;
import com.kang.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DatabaseServlet extends HttpServlet {

    String url = "jdbc:mysql://59.110.11.72:3306/RGStudent?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSI=true";
    String username_0 = "root";
    String password_0 = "123456";
    Connection connection = null;
    Statement statement = null;

    public DatabaseServlet() throws SQLException {
    }

    protected void InitDatabase() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        connection = DriverManager.getConnection(url, username_0, password_0);
        statement = connection.createStatement();
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            this.InitDatabase();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String method = req.getParameter("method");
        String id  = req.getParameter("id1");

        if(method.equals("SelectItemById"))
        {
            try {
                Find_Item_by_id(req, resp, req.getParameter("id1"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(method.equals("RegistDB")) //用户注册
        {
            String username = req.getParameter("username1");
            String password = req.getParameter("password1");
            String identify = req.getParameter("identify1");
            String class_num = req.getParameter("class_num1");
            String id1 = req.getParameter("id1");
            User user = new User(username, password, identify, class_num, id1);
            try {
                RegistDB(req, resp, user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(method.equals("ChangePwd")) //修改密码
        {
            String username = req.getParameter("username1");
            String oldpwd = req.getParameter("oldpwd1");
            String newpwd = req.getParameter("newpwd1");
            try {
                ChangePwd(req, resp, username, oldpwd, newpwd);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(method.equals("SelectAllCourse")) //显示所有课程
        {
            try {
                SelectAllCourse(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(method.equals("SubmitChooseCourse"))
        {
            String stuID = req.getParameter("stuID");
            String sid = req.getParameter("sid");
            try {
                SubmitChooseCourse(req, resp, stuID, sid);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(method.equals("ShowStudentSchedule"))
        {
            String stuID = req.getParameter("stuID");
            try {
                ShowStudentSchedule(req, resp, stuID);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(method.equals("DeleteCourse"))
        {
            String stuID = req.getParameter("stuID");
            String sid = req.getParameter("sid");
            try {
                DeleteCourse(req, resp, stuID, sid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void Find_Item_by_id(HttpServletRequest req, HttpServletResponse resp, String id) throws SQLException, IOException {
        String sql = "select * from people where `id` =" + id;
        ResultSet rs = statement.executeQuery(sql);
        boolean flag = false;
        Map<String, String> resultset = new HashMap<String, String>();
        while(rs.next())
        {
            flag = true;
            resultset.put("name", rs.getString("name"));
            resultset.put("id", rs.getString("id"));
            resultset.put("class_num", rs.getString("class_num"));
            resultset.put("zz", rs.getString("zz"));
            resultset.put("yy", rs.getString("yy"));
            resultset.put("sx", rs.getString("sx"));
            resultset.put("_408", rs.getString("_408"));
        }
        if(!flag)
        {
            resultset.put("result", "no");
        }else {
            resultset.put("result", "yes");
        }
        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultset));
        writer.flush();
        writer.close();
    }

    public void RegistDB(HttpServletRequest req, HttpServletResponse resp, User user) throws SQLException, IOException {
        String sql = "INSERT INTO `admin` values(?, ?, md5(?), ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getClass_num());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getIdentify());
        ps.setString(5, req.getParameter("id1"));
        boolean flag = false;
        int i = ps.executeUpdate();
        Map<String, String> resultset = new HashMap<String, String>();
        if(i > 0)
        {
            resultset.put("result", "Registsuccess");
        }
        else resultset.put("result", "Registfail");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultset));
        writer.flush();
        writer.close();
    }

    public boolean checkPwdEQU(String username, String oldpwd) throws SQLException {
        String sql = "Select * FROM `admin` where `username` = ? and `password` = MD5(?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, oldpwd);
        ResultSet rs = ps.executeQuery();
        System.out.println(username);
        System.out.println(oldpwd);
        while(rs.next())
        {
            return true;
        }
        return false;
    }

    public void ChangePwd(HttpServletRequest req, HttpServletResponse resp, String username, String oldpwd, String newpwd) throws SQLException, IOException {
        //先检查旧密码是否正确
        Map<String, String> resultset = new HashMap<String, String>();
        if(!checkPwdEQU(username, oldpwd))
        {
            System.out.println("11111111");
            resultset.put("result", "fail");
            return;
        }
        System.out.println("旧密码正确！");
        String sql = "update `admin` set `password` = md5(?) where username = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, newpwd);
        ps.setString(2, username);
        int i = ps.executeUpdate();
        if(i > 0)
        {
            resultset.put("result", "yes");
        }
        else resultset.put("result", "fail");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultset));
        writer.flush();
        writer.close();
    }

    public void SelectAllCourse(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String sql = "select * from scheduledcourses, coursecatalog where scheduledcourses.courseNo = coursecatalog.courseNo;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        Map<String, String> resultset = new HashMap<String, String>();
        ArrayList<StudentLinkSchedule> coursecatalogArrayList = new ArrayList<StudentLinkSchedule>();
        boolean flag = false;

        while(rs.next())
        {
            flag = true;
            StudentLinkSchedule SLS = new StudentLinkSchedule();
            SLS.setSid(Integer.parseInt(rs.getString("sid")));
            SLS.setCourseNo(rs.getString("courseNo"));
            SLS.setCourseName(rs.getString("courseName"));
            SLS.setCredits(rs.getDouble("credits"));
            SLS.setClassNo(rs.getString("classNo"));
            SLS.setDayOfWeek(rs.getString("dayOfWeek"));
            SLS.setTimeOfDay(rs.getString("timeOfDay"));
            SLS.setRoom(rs.getString("room"));
            SLS.setCapacity(Integer.parseInt(rs.getString("capacity")));

            coursecatalogArrayList.add(SLS);
        }
        if(flag)
        {
            resultset.put("result", "yes");
            String arr_json = JSONArray.toJSONString(coursecatalogArrayList);
            resultset.put("CourseData", arr_json);
        }
        else resultset.put("result", "no");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultset));

        writer.flush();
        writer.close();
    }

    public void SubmitChooseCourse(HttpServletRequest req, HttpServletResponse resp, String stuID, String sid) throws SQLException, IOException {

        String sql1 = "INSERT into student_schedule values(?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql1);
        ps = connection.prepareStatement(sql1);
        ps.setString(1, stuID);
        ps.setInt(2, Integer.parseInt(sid));

        Map<String, String> resultSet = new HashMap<String, String>();
        System.out.println();
        int i = ps.executeUpdate();

        if(i > 0) resultSet.put("result", "yes");
        else resultSet.put("result", "no");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultSet));

        writer.flush();
        writer.close();
    }

    public void ShowStudentSchedule(HttpServletRequest req, HttpServletResponse resp, String stuID) throws SQLException, IOException {
        String sql = "select `student_schedule`.sid as stuID, `student`.`name` as stuName,  `student_schedule`.cid as sid, `scheduledcourses`.courseNo as courseNo, `coursecatalog`.courseName as courseName, scheduledcourses.dayOfWeek as dayOfWeek, scheduledcourses.timeOfDay as timeOfDay, scheduledcourses.room as room from student_schedule, student, scheduledcourses, coursecatalog where `student_schedule`.cid = scheduledcourses.sid and student_schedule.sid = student.id and scheduledcourses.courseNo = coursecatalog.courseNo and `student_schedule`.sid = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, stuID);
        ResultSet rs = ps.executeQuery();

        Map<String, String> resultset = new HashMap<String, String>();
        ArrayList<StudentSelectinfo> coursecatalogArrayList = new ArrayList<StudentSelectinfo>();
        boolean flag = false;
        System.out.println(stuID);
        while(rs.next())
        {
            StudentSelectinfo SSF = new StudentSelectinfo();
            flag = true;
            SSF.setStuID(rs.getString("stuID"));
            SSF.setStuName(rs.getString("stuName"));
            SSF.setSid(rs.getInt("sid"));
            SSF.setCourseID(rs.getString("courseNo"));
            SSF.setCourseName(rs.getString("courseName"));
            SSF.setDayOfWeek(rs.getString("dayOfWeek"));
            SSF.setTimeOfDay(rs.getString("timeOfDay"));
            SSF.setRoom(rs.getString("room"));
            coursecatalogArrayList.add(SSF);
        }
        for(StudentSelectinfo it : coursecatalogArrayList)
        {
            System.out.println("-----" + it.getSid());
        }
        if(flag)
        {
            resultset.put("result", "yes");
            String arr_json = JSONArray.toJSONString(coursecatalogArrayList);
            resultset.put("CourseData", arr_json);
        }
        else resultset.put("result", "no");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultset));

        writer.flush();
        writer.close();
    }

    public void DeleteCourse(HttpServletRequest req, HttpServletResponse resp, String stuID, String sid) throws SQLException, IOException {
        String sql = "delete from `student_schedule` where sid = ? and cid = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, stuID);
        ps.setString(2, sid);
        Map<String, String> resultSet = new HashMap<String, String>();
        int i = ps.executeUpdate();

        if(i > 0) resultSet.put("result", "yes");
        else resultSet.put("result", "no");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");

        PrintWriter writer = resp.getWriter();
        writer.write(JSONArray.toJSONString(resultSet));

        writer.flush();
        writer.close();
    }

}
