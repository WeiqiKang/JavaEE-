<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>新用户注册</title>
    <%--js--%>
    <script src = "js/Database.js"></script>
    <script src = "js/jquery-3.6.0.js"></script>
    <%--css--%>
    <link rel="stylesheet" href="css/cs.css">
    <link rel = "stylesheet" href="css/head.css">
    <style>
        .popUp {
            visibility: hidden;
        }

        .pAGE{
            width:600px;
            height:410px;
            text-align: center;
            background-color: #FFFeee;
            border-radius: 20%;
            box-shadow: 0px 0px 50px #eee;
            position:absolute;
            top: 20%;
            left:50%;
            margin-left:-300px;
            opacity: 1; /* 透明度为0 */
            margin-top: -40px;
        }

        table, th, td{
            border:2px solid black;
            margin-left: 27%;
        }

        .content1 {
            width: 450px;
            height: 200px;
            position: absolute;
            top: 22%;
            left: 8%;
        }

        button {
            width:85px;
            height:50px;
            border-radius:20%;
            line-height:40px;
            border:1px solid #c9c9c9;
            background-color: orange;
            color: #FFFFFF;
            font-size: 14px;
            box-shadow: 1px 1px 1px 1px #eee;
            transition: all .2s linear;
            margin-top: 150px;
        }

        button:hover {
            cursor:pointer;
            color: black;
            font-size: 16px;
        }

        #showCont{
            animation: showPopUp 1s linear .2s;
            animation-fill-mode: forwards; /*保持动画后的状态*/
        }

        /*定义动画规则*/
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
    <%--导航条--%>
    <div class="head-back">
        <div class="head">
            <div class="head-left">
                <ul>

                </ul>
            </div>
            <div class="head-right">
                <ul>
                    <li><a href="index.jsp">返回主页</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="popUp">
    <div class="pAGE">
        <h1>新用户注册</h1>
        <br>
        <br>

        <div class="content1">
        <table>
            <tr>
                <td>用户名：</td> <td><input type="text" id = "username"> </td>
            </tr>
            <tr>
                <td>密码：</td> <td><input type="password" id = "password"></td>
            </tr>
            <tr>
                <td>用户身份：</td> <td><select name="id" id="identify">
                                        <option value="teacher">老师</option>
                                        <option value="student">学生</option>
                                        </select></td>
            </tr>
            <tr>
                <td>所属班级：</td> <td><input type="text" id = "class_num"></td>
            </tr>
            <tr>
                <td>学号/工号</td> <td><input type="text" id = "id"></td>
            </tr>
        </table>
        </div>

        <br>
        <br>

        <button id="btn_submit" onclick="Regist()">提交注册</button>
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
