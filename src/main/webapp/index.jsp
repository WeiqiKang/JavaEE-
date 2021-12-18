<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>

<head>
    <title>欢迎来到学生管理系统</title>
    <%--引用JS--%>
    <script src = "js/SubmitChecker.js"></script>
    <script src = "js/Refreshcheckwords.js"></script>
    <script src = "js/tanchuang.js"></script>
    <script src = "js/Database.js"></script>
    <script src = "js/jquery-3.6.0.js"></script>
    <%--引用CSS--%>
    <link rel="stylesheet" href="css/cs.css">
    <link rel = "stylesheet" href="css/head.css">

    <style>
        span {
            display: inline-block;
            width: 70.66px;
            text-align: right;
        }

    </style>

    <%
        Cookie[] cookies = request.getCookies();
        boolean flag = false;

        for(int i = 0; cookies != null && i < cookies.length; i ++ )
        {
            if(cookies[i].getName().equals("userinfo"))
            {
                flag = true;
                break;
            }
        }
        if(flag)
        {
            //页面重定向
            String newsite = "/javaweb_war/success1.jsp";
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", newsite);
        }
    %>
</head>


<body>



<div class="head-back">
    <div class="head">
        <div class="head-left">
            <ul>
                <li><a href="index.jsp">进入主页</a></li>
            </ul>
        </div>
        <div class="head-right">
            <ul>
                <li><a href="register.jsp">注册</a></li>
                <li>/</li>
                <li><a href="index.jsp">登录</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="btnDiv">
    <button class="openPopUpBtn" id="openBtn">开始</button>
</div>


<div class="popUp">

    <h1>登录</h1>
    <form action="${pageContext.request.contextPath}/getinfo.jsp" name = "form1" method="post" onsubmit = "return checklogin()" align = "left">
       <div class="content">
        <p>
            <span>用户名：</span><input type="text" name = "username" required autocomplete="off"> <br>
            <span>密码：</span><input type="password" name = "password" required autocomplete="off"> <br>
        </p>
        <br>
        <p>
            <span>验证码：</span><input type="text" name = "checkwords" required autocomplete="off">
            <br>
            <span><input type="button" value = "刷新验证码" onclick="refreshcheckwords()"></span>
            <input type="text" readonly id = "showcheckwords">
            <br>
        </p>
        <br>
        <%
            request.setCharacterEncoding("utf-8");
        %>

        <p>
            24小时内免登录：<input type="radio" name = "RememberMe" value = "1"> 是
            <input type="radio" name = "RememberMe" value = "0"> 否
        </p>
        <p>
            <input type="submit">
            <input type="reset">
        </p>
       </div>
    </form>

    <button class="closePopUpBtn" id="closeBtn">关闭</button>

</div>


<p style="background: none;height:5%;position: fixed;bottom: 0px;width: 100%;text-align: center">
    <a class="banquan" style="color: #000;" href="https://beian.miit.gov.cn" target="_blank">冀ICP备2021025101号</a>
</p>
</body>

</html>
