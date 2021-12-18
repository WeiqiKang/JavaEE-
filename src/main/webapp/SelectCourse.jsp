<%@ page import="com.kang.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选课</title>
    <link rel = "stylesheet" href="css/head.css">
    <script src="js/Database.js" defer="true"></script>

    <style>
        html {
            overflow: hidden;
        }

        body {
            background: url("./resources/select.jpeg");
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
        }

        button:hover {
            cursor:pointer;
            color: black;
            font-size: 16px;
        }

        .button1 {
            margin-top: 10px;
        }

        .button2 {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            top: 89%;
        }

        .pAGE{
            width:600px;
            height:500px;
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

        .content {
            position: absolute;
            width: 312px;
            left: 50%;
            transform: translateX(-50%);
            top: 77%;
        }

        span {
            display: inline-block;
            width: 128px;
            text-align: right;
        }

        .scroll {
            width: 600px;
            height: 260px;
            overflow:auto;
        }

        .show {
            width: 570px;
        }

        .disappear {
            visibility: hidden;
        }

        .appear {
            visibility: visible;
        }

        .change {
            transition: visibility .4s linear;
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
            <h2>自主选课</h2>

            <button id="btn_select" class="button1" onclick="SelectAllCourse()">查询课程</button>

            <p id = "Course_outcome" class="disappear change" style="margin: 5px 0px;padding-left: 17px;">现有课程如下：</p>

            <div class="scroll">
                <table id = "SelectAllCourse" class="show disappear change">
                <thead>
                <tr>
                    <td>序号</td>
                    <td>课程编号</td>
                    <td>课程名</td>
                    <td>课程学分</td>
                    <td>教学班级</td>
                    <td>所在周</td>
                    <td>上课时间</td>
                    <td>上课地点</td>
                    <td>课程剩余容量</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            </div>

            <div class="content">
                <span>当前学号：</span><input type="text" id = "S_name" readonly value="<%=id%>"><br>
                <span>请输入选课编号：</span> <input type="text" id="Sid">
            </div>

            <button class="button2" onclick="SubmitChooseCourse()">提交选择</button>

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
