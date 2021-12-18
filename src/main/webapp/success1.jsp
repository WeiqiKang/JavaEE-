<%@ page import="com.kang.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>登录成功</title>
    <link rel = "stylesheet" href="css/head.css">
    <style>
        html {
            overflow: hidden;
        }

        body {
            background: url("./resources/success.jpeg");
            background-size: cover;
            overflow: hidden;
        }

        .clearfix::after{
            content: "";
            clear: both;
            display: table;
        }

        .info {
            /*width: 280px;*/
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 20px;
            line-height: 2.5;
            width:550px;
            height: 150px;
        }

        .info p {
            height: 50px;
        }

        .right {
            position: absolute;
            left: 28%;
        }

        .span1 {
            position: absolute;
            left: 55%;
        }

        .span {
            display: inline-block;
            text-align: right;
            width: 140px;
        }

        .popUp {
            visibility: hidden;
            position: relative;
            width: 600px;
            height: 410px;
            left: 50%;
            transform: translateX(-50%);
        }

        .pAGE{
            width:550px;
            height:350px;
            text-align: center;
            background-color: #FFFeee;
            border-radius: 20%;
            box-shadow: 0px 0px 50px #eee;
            position:absolute;
            top: -10%;
            left:0;
            margin-left:-300px;
            opacity: 1; /* 透明度为0 */
        }

        #showCont{
            animation: showPopUp 1s linear .2s;
            animation-fill-mode: forwards; /*保持动画后的状态*/
        }

        /*定义动画规则*/
        @keyframes showPopUp{
            0%{
                visibility: visible;
                opacity: 0;
                top:-60%;
                transform: rotateZ(0deg);
            }
            50%{
                visibility: visible;
                transform: rotateZ(-10deg);
            }
            100%{
                visibility: visible;
                opacity: 1;
                top:20%;
                transform: rotateZ(0deg);
            }
        }

    </style>
</head>
<body>

<div class="head-back">
    <div class="head">
        <div class="head-left">
            <ul>
                <li><a href="DeleteCourse.jsp">退选课程</a></li>
                <li><a href="SelectCourse.jsp">自主选课</a></li>
                <li><a href="ShowStudentSchedule.jsp">课表查询</a></li>
            </ul>
        </div>
        <div class="head-right">
            <ul>
                <li><a href="AdminShow.jsp">进入后台</a></li>
                <li><a href="exit">退出登录&nbsp&nbsp&nbsp</a></li>
                <li><a href="ChangePwd.jsp">修改密码&nbsp&nbsp&nbsp</a></li>
                <li>&nbsp;&nbsp;</li>
                <li id="TopUsername"></li>
            </ul>
        </div>
    </div>
</div>

<div class="popUp">
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
                else if(cookies[i].getName().equals("id")) user.setId(cookies[i].getValue());
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
                out.write("<div class = 'info cleafix'>");

                out.write("<p class = 'cleafix'>");
                out.write("<span class = 'right span'>当前用户名为：</span>" + "<span class = 'span1'>" + user.getUsername() + "</span>");
                out.write("</p>");

                out.write("<p class = 'cleafix'>");
                out.write("<span class = 'right span'>用户身份：</span>");
                out.write("<span class = 'span1' id = \"usr\">");
                out.write(user.getIdentify());
                out.write("</span>");
                out.write("</p>");

                if(user.getIdentify().equals("admin"))
                {
                    out.write("<p class = 'cleafix'>");
                    out.write("<span class = 'span1'>班级信息：当前为超级管理员，可以管理所有班级的成绩！</span>");
                    out.write("</p>");
                    out.write("</div>");
                }
                else
                {
                    out.write("<p>");
                    out.write("<span class = 'right span'>班级信息：</span>" + "<span class = 'span1'>" + user.getClass_num() + "</span>");
                    out.write("</div>");
                }
                session.setAttribute("user", user);
            }
            else//信息不存在，提示未检测到登录信息
            {
                out.write("登录失败！未检测到登录信息" ); out.write("<br>");
            }
        %>
    </div>
</div>
    <script>
        window.onload = function(){
            var popUp = document.getElementsByClassName('popUp'); //获取div.popUp的DOM节点,注意！popUp此时是一个数组

            //给div.popUp添加一个名叫showCont的id,随后该id执行对应动画
            popUp[0].setAttribute('id','showCont');
        }
    </script>

    <p style="background: none;height:5%;position: fixed;bottom: 0px;width: 100%;text-align: center">
        <a class="banquan" style="color: #000;" href="https://beian.miit.gov.cn" target="_blank">冀ICP备2021025101号</a>
    </p>
</body>
</html>
