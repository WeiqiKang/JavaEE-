<%@ page import="com.kang.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生课表查询</title>
    <link rel = "stylesheet" href="css/head.css">
    <script src="js/Database.js" defer="true"></script>

    <style>
        html {
            overflow: hidden;
        }

        body {
            background: url("./resources/schedule.jpeg");
            background-size: cover;
            overflow: hidden;
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
            width:600px;
            height:420px;
            text-align: center;
            background-color: #FFFeee;
            border-radius: 20% 20% 0 0;
            box-shadow: 0px 0px 50px #eee;
            position:absolute;
            top: -10%;
            left:0;
            margin-left:-300px;
            opacity: 1; /* 透明度为0 */
        }

        button {
            width:85px;
            height:40px;
            border-radius:20%;
            line-height:40px;
            border:1px solid #c9c9c9;
            background-color: orange;
            color: #FFFFFF;
            font-size: 14px;
            box-shadow: 1px 1px 1px 1px #eee;
            transition: all .2s linear;
            /*margin-top: 20px;*/
        }

        button:hover {
            cursor:pointer;
            color: black;
            font-size: 16px;
        }

        .scroll {
            height: 245px;
            overflow: auto;
        }

        .show {
            width: 570px;
        }

        table, th, td{
            border:2px solid black;
            margin-left: 2%;
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

    <%--导入jquery--%>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body>
    <%
        //首先进行学生身份判断
        User user = (User) session.getAttribute("user");
        String TopUsername = user.getUsername();
        String identify = user.getIdentify();
        if(!identify.equals("student"))
        {
            String newsite = "/javaweb_war/error";
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", newsite);
        }
    %>
    <%--导航条--%>
    <div class="head-back">
        <div class="head">
            <div class="head-left">
                <ul>
                    <li><a href="index.jsp">返回主页</a></li>
                </ul>
            </div>
            <div class="head-right">
                <ul>
                    <li><a href="exit">退出登录</a></li>
                    <li>&nbsp;&nbsp;</li>
                    <li id="TopUsername">当前用户：<%=TopUsername%></li>
                </ul>
            </div>
        </div>
    </div>

    <%
        String id = user.getId();
    %>

 <div class="popUp">
    <div class="pAGE">
        <div class="SelectItems">
            <h2>学生课表查询</h2>
            <p style="margin: 15px 0px">当前学号：<input type="text" id = "S_name" readonly value="<%=id%>"></p>
            <button id="btn_select" onclick="ShowStudentSchedule()">查询课程</button>

            <p id = "Course_outcome" style="visibility:hidden; margin: 5px 0px;padding-left: 17px;">选课结果如下：</p>

            <div class="scroll">
            <table id = "ShowStudentSchedule" class="show" style="visibility:hidden">
                <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>开课号</td>
                    <td>课程编号</td>
                    <td>课程名</td>
                    <td>日期</td>
                    <td>上课时间</td>
                    <td>上课地点</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            </div>
        </div>
    </div>
 </div>

    <p style="background: none;height:5%;position: fixed;bottom: 0px;width: 100%;text-align: center">
        <a class="banquan" style="color: #000;" href="https://beian.miit.gov.cn" target="_blank">冀ICP备2021025101号</a>
    </p>

    <script>
        window.onload = function(){
            var popUp = document.getElementsByClassName('popUp'); //获取div.popUp的DOM节点,注意！popUp此时是一个数组

            //给div.popUp添加一个名叫showCont的id,随后该id执行对应动画
            popUp[0].setAttribute('id','showCont');
        }
    </script>
</body>
</html>
