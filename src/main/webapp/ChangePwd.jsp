<%@ page import="com.kang.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <%--页面布局的一些css--%>
    <link rel = "stylesheet" href="css/head.css">
    <style>
        html {
            overflow: hidden;
        }

        body {
            background: url("./resources/change.jpeg");
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
            height:410px;
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
            margin-top: 40px;
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
            margin-top: 40px;
        }

        button:hover {
            cursor:pointer;
            color: black;
            font-size: 16px;
        }

        table, th, td{
            border:2px solid black;
            margin-left: 21%;
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
    <%--数据库操作引用的Js--%>
    <script src="js/Database.js" defer="true"></script>
    <%--导入jquery--%>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<%
    User user = (User) session.getAttribute("user");
    String TopUsername = user.getUsername();
%>
<body>
    <%--导航条--%>
    <div class="head-back">
        <div class="head">
            <div class="head-left">
                <ul>

                </ul>
            </div>
            <div class="head-right">
                <ul>
                    <li><a href="exit">退出登录</a></li>
                    <li><a href="index.jsp">返回主页&nbsp&nbsp&nbsp</a></li>
                    <li>&nbsp;&nbsp;</li>
                    <li id="TopUsername"><%=TopUsername%></li>
                    <li >当前用户：</li>
                </ul>
            </div>
        </div>
    </div>


    <%--主体页面--%>
<div class="popUp">
<div class="pAGE">
    <h2>修改密码</h2>
    <div class="content">
    <table>
        <tr>
            <td>请输入旧密码：</td> <td> <input type="password" id = "oldpwd"> </td>
        </tr>
        <tr>
            <td>请输入新密码：</td> <td> <input type="password" id = "newpwd"> </td>
        </tr>
        <tr>
            <td>请再次输入新密码：</td> <td><input type="password" id = "newpwd1"></td>

        </tr>
    </table>
    </div>
    <button onclick="ChangePwd()">提交修改</button>
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
