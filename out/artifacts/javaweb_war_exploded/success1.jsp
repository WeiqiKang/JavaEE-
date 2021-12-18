<%@ page import="com.kang.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>登录成功</title>
    <style>
        .pAGE{
            width:600px;
            height:500px;
            text-align: center;
            background-color: #c9c9c9;
            border:1px solid #FFF;
            box-shadow: 1px 1px 1px 1px #eee;
            position:absolute;
            left:50%;
            margin-left:-300px;
            opacity: 50; /* 透明度为0 */
        }
    </style>
    <link rel = "stylesheet" href="css/head.css">
</head>
<body>
<p>
<div class="head-back">
    <div class="head">
        <div class="head-left">
            <ul>
                <li><a href="Management.jsp">进入成绩管理系统</a></li>
                <li><a href="exit">注销</a></li>
                <li><a href="">返回主页</a></li>
            </ul>
        </div>
        <div class="head-right">
            <ul>
                <li><a href="">注册</a></li>
                <li>/</li>
                <li><a href="">登录</a></li>
            </ul>
        </div>
    </div>
</div>
</p>

<div class="pAGE">


    <%
        Cookie[] cookies = request.getCookies();
        User user = new User();
        boolean flag = false; //标记cookie中是否有用户名信息
        for(int i = 0; i < cookies.length; i ++ )
        {
            if(cookies[i].getName().equals("userinfo"))
            {
                flag = true;
                user.setUsername(cookies[i].getValue());
            }
            else if(cookies[i].getName().equals("password")) user.setPassword(cookies[i].getValue());
            else if(cookies[i].getName().equals("identify")) user.setIdentify(cookies[i].getValue());
            else if(cookies[i].getName().equals("class_num")) user.setClass_num(cookies[i].getValue());
        }

        if(!flag)//如果cookie中没有存信息，就从session中获得
        {
            user = (User)session.getAttribute("user");
        }

    %>
    <%
        //如果信息存在，就将其输出
        if(user != null)
        {
            out.write("当前用户名为：" + user.getUsername()); out.write("<br>");
            out.write("用户身份：" + user.getIdentify()); out.write("<br>");
            if(user.getIdentify().equals("admin"))
            {
                out.write("班级信息：当前为超级管理员，可以管理所有班级的成绩！"); out.write("<br>");
            }
            else
            {
                out.write("班级信息：" + user.getClass_num()); out.write("<br>");

            }
        }
        else//信息不存在，提示未检测到登录信息
        {
            out.write("登录失败！未检测到登录信息" ); out.write("<br>");
        }
    %>



</div>

</body>
</html>
