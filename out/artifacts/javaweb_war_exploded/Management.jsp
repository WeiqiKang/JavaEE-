<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link>
    <title>学生管理系统</title>
    <link rel = "stylesheet" href="css/head.css">
    <script src="js/Database.js" defer="true"></script>
<%--页面布局的一些css--%>
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
        table, th, td{
            border:2px solid black;
            margin-left: 21%;
        }
    </style>
<%--数据库操作引用的Js--%>

<%--导入jquery--%>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body>

<%--导航条--%>
<div class="head-back">
    <div class="head">
        <div class="head-left">
            <ul>
                <li><a href="index.jsp">返回主页</a></li>
                <li><a href="exit">注销</a></li>
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

<%--主体页面--%>

<div class="pAGE">
    <p>
        <div class="InsertItems">
            <h2>录入成绩</h2>
            姓名：<input type="text" id="name"> <br>
            学号：<input type="text" id="id"> <br>
            班级：<input type="text" id="class_num"> <br>
            政治：<input type="text" id="zz"> <br>
            英语：<input type="text" id="yy"> <br>
            数学：<input type="text" id="sx"> <br>
            计算机408：<input type="text" id="_408"> <br>
            <button id="btn_insert" onclick="UpdateItem()">执行插入/修改</button>
        </div>
    </p>
    <br>
    <br>
    <p>
        <div class="SelectItems">
            <h2>查询成绩（按学号）</h2>
            学号：<input type="text" id = "S_name"> <br>

            <button id="btn_select" onclick="SelectItemById()">查询</button>

            <p id = "H_outcome" style="visibility:hidden">查询结果如下：</p>

            <table id = "Selectbyid" style="visibility:hidden">
                <thead>
                <tr>
                    <td>姓名</td>
                    <td>学号</td>
                    <td>班级</td>
                    <td>政治</td>
                    <td>英语</td>
                    <td>数学</td>
                    <td>计算机408</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </p>


</div>



</body>

</html>
