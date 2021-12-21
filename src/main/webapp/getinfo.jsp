<%@page import="com.kang.pojo.User"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--设置字符编码--%>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

%>
<%--连接数据库--%>
<%
    //配置信息
    String url = "jdbc:mysql://localhost:3306/RGStudent?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSI=true";
    String username_0 = "root";
    String password_0 = "123456";
    //1、加载驱动
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    //2、连接数据库，代表数据库
    try (Connection connection = DriverManager.getConnection(url, username_0, password_0)) {
        String sql = "select * from `admin` where `username` = ? and `password` = md5(?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
%>
<%--获取登录request中的各种参数--%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String class_num = null;
    String identify = null;
    String id = null;
    //为Sql语句赋值
    ps.setString(1, username);
    ps.setString(2, password);

    //在数据库中查询是否用户是否存在
    ResultSet rs = ps.executeQuery();
    if (!rs.next())//如果数据库中不存在，报错
    {
        out.write("用户名或密码错误！即将为你跳转到主页，请重新登录！");
        out.write("<br>");
        response.setHeader("refresh", "3;url=index.jsp");
        return;
    }
    else
    {
        rs = ps.executeQuery();
        while(rs.next())
        {
            try {
                identify = rs.getString("identify");
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                class_num = rs.getString("class_num");
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                id = rs.getString("id");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println(identify + " " + class_num);
    }
    //如果所有内容不为空就将其加入session和cookie
    if (username != null && password != null ) {
        User user = new User(username, password, identify, class_num, id);

        //加入session
        session.setAttribute("user", user);

        //判断是否勾选了24小时免密登录
        String remember = (String) request.getParameter("RememberMe");
        if (remember != null && remember.equals("1")) //1代表免密登录
        {

            Cookie username1 = new Cookie("userinfo", user.getUsername());
            Cookie password1 = new Cookie("password", user.getPassword());
            Cookie identify1 = new Cookie("identify", user.getIdentify());
            Cookie class_num1 = new Cookie("class_num", user.getClass_num());
            Cookie id1 = new Cookie("id", user.getId());

            username1.setMaxAge(60 * 60 * 24);//设置1天免密登录, 所以cookie的存活时间是1天
            password1.setMaxAge(60 * 60 * 24);
            identify1.setMaxAge(60 * 60 * 24);
            class_num1.setMaxAge(60 * 60 * 24);
            id1.setMaxAge(60 * 60 * 24);

            response.addCookie(username1);
            response.addCookie(password1);
            response.addCookie(identify1);
            response.addCookie(class_num1);
            response.addCookie(id1);
        }

        //设置完信息，页面重定向到登录成功页面
        String newsite = "/javaweb_war/success1.jsp";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", newsite);
    }

%>

<%
            //6、关闭连接，释放资源（先开后关）
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<p style="background: none;height:5%;position: fixed;bottom: 0px;width: 100%;text-align: center">
    <a class="banquan" style="color: #000;" href="https://beian.miit.gov.cn" target="_blank">冀ICP备2021025101号</a>
</p>
</body>
</html>