let url = "http://localhost:8080/javaweb_war/db.do";
function UpdateItem()
{
    var name, id, class_num, zz, yy ,sx, _408;
    name = document.getElementById("name").value;
    id = document.getElementById("id").value;
    class_num = document.getElementById("class_num").value;
    zz = document.getElementById("zz").value;
    yy = document.getElementById("yy").value
    sx = document.getElementById("sx").value;
    _408 = document.getElementById("_408").value;

    $.ajax({
        type:"get",
        url:url,
        data:{method:"UpdateDB", name1:name, id1:id, class_num1:class_num, zz1:zz, yy1:yy, sx1:sx, _4081:_408},
        datatype:"json",
        success:function (data) {
            if(data.result == "Updatesuccess"){
                alert("成功更新一条数据！");
            }
            else if(data.result == "Insertsuccess")
            {
                alert("成功插入一条数据！")
            }
            else{
                alert("插入失败！");
            }
        },
        error:function (data) {
            alert("更新失败！请检查服务器是否有误");
        }
    });

}

function SelectItemById() {
    var tab = document.getElementById("Selectbyid");//表格
    var id = document.getElementById("S_name").value;
    $('#Selectbyid tbody').html("");//清空，只留表头

    $('#H_outcome').css({"visibility" : "visible"});

    $.ajax({
        type:"get",
        url:url,
        data:{method:"SelectItemById", id1:id},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes")
            {
                $('#Selectbyid').css({"visibility" : "visible"});

                var tp = $('#Selectbyid tbody');

                tp.append("<tr>" +
                    "<td>" + data.name + "</td>"+
                     "<td>" + data.id + "</td>" +
                    "<td>" + data.class_num + "</td>" +
                    "<td>" + data.zz + "</td>" +
                    "<td>" + data.yy + "</td>" +
                    "<td>" + data.sx + "</td>" +
                    "<td>" + data._408 + "</td>" +
                    "</tr>");

            }
            else if(data.result == "no")
            {

            }
            else{
                alert("查询失败！");
            }
        },
        error:function (data) {
            alert("查询失败！请检查服务器是否有误");
        }
    });
}

function Regist() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var identify = document.getElementById("identify").value;
    var class_num = document.getElementById("class_num").value;
    var id = document.getElementById("id").value;
    $.ajax({
        type:"get",
        url:url,
        data:{method:"RegistDB", username1:username, password1:password, identify1:identify, class_num1:class_num, id1:id},
        datatype:"json",
        success:function (data) {
            if(data.result == "Registsuccess"){
                alert("注册成功！请牢记您的账号密码！");
            }
            else{
                alert("注册失败！用户名已经存在");
            }
        },
        error:function (data) {
            alert("操作失败！请检查服务器是否有误");
        }
    });
}

function ChangePwd()
{
    var username, oldpwd, newpwd, newpwd1;
    username = document.getElementById("TopUsername").innerText;
    oldpwd = document.getElementById("oldpwd").value;
    newpwd = document.getElementById("newpwd").value;
    newpwd1 = document.getElementById("newpwd1").value;

    if(newpwd != newpwd1)
    {
        alert("两次输入的密码不一致！");
        return;
    }

    $.ajax({
        type:"get",
        url:url,
        data:{method:"ChangePwd", username1:username, oldpwd1:oldpwd ,newpwd1:newpwd},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes"){
                alert("密码修改成功！请牢记新密码");
            }
            else if(data.result == "fail"){
                alert("修改失败！");
            }else
            {
                alert("未知错误！");
            }
        },
        error:function (data) {
            alert("操作失败！请检查服务器是否有误");
        }
    });
}

function SelectAllCourse() {
    $('#SelectAllCourse tbody').html("");//清空，只留表头
    $('#Course_outcome').toggleClass("appear");
    let course_arr;
    $.ajax({
        type:"get",
        url:url,
        data:{method:"SelectAllCourse"},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes"){
                $('#SelectAllCourse').toggleClass("appear");
                course_arr = JSON.parse(data.CourseData);
                let len = course_arr.length;
                for(let i = 0; i < len; i ++ )
                {
                    let tp = $('#SelectAllCourse tbody');
                    tp.append("<tr>" +
                        "<td>" + course_arr[i].sid + "</td>"+
                        "<td>" + course_arr[i].courseNo + "</td>" +
                        "<td>" + course_arr[i].courseName + "</td>" +
                        "<td>" + course_arr[i].credits + "</td>" +
                        "<td>" + course_arr[i].classNo + "</td>" +
                        "<td>" + course_arr[i].dayOfWeek + "</td>" +
                        "<td>" + course_arr[i].timeOfDay + "</td>" +
                        "<td>" + course_arr[i].room + "</td>" +
                        "<td>" + course_arr[i].capacity + "</td>" +
                        "</tr>");
                }
            }
            else if(data.result == "fail"){
                alert("查询失败！");
            }else
            {
                alert("未知错误！");
            }
        },
        error:function (data) {
            alert("操作失败！请检查服务器是否有误");
        }
    });
}

function SubmitChooseCourse() {
    let sid = document.getElementById("Sid").value;
    let stuID = document.getElementById("S_name").value;
    $.ajax({
        type:"get",
        url:url,
        data:{method:"SubmitChooseCourse", sid:sid, stuID:stuID},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes"){
                alert("选课成功！");
            }
            else if(data.result == "no"){
                alert("请求失败！");
            }else
            {
                alert("选课失败！请检查是否重复选课！或者选择了不存在的课程");
            }
        },
        error:function (data) {
            alert("请求失败！请检查服务器是否有误");
        }
    });
}

function ShowStudentSchedule()
{
    let stuID = document.getElementById("S_name").value;
    $('#ShowStudentSchedule tbody').html("");//清空，只留表头
    $('#Course_outcome').css({"visibility" : "visible"});
    let course_arr;
    $.ajax({
        type:"get",
        url:url,
        data:{method:"ShowStudentSchedule", stuID:stuID},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes"){
                $('#ShowStudentSchedule').css({"visibility" : "visible"});
                course_arr = JSON.parse(data.CourseData);
                let len = course_arr.length;
                for(let i = 0; i < len; i ++ )
                {
                    let tp = $('#ShowStudentSchedule tbody');
                    tp.append("<tr>" +
                        "<td>" + course_arr[i].stuID + "</td>"+
                        "<td>" + course_arr[i].stuName + "</td>" +
                        "<td>" + course_arr[i].sid + "</td>" +
                        "<td>" + course_arr[i].courseID + "</td>" +
                        "<td>" + course_arr[i].courseName + "</td>" +
                        "<td>" + course_arr[i].dayOfWeek + "</td>" +
                        "<td>" + course_arr[i].timeOfDay + "</td>" +
                        "<td>" + course_arr[i].room + "</td>" +
                        "</tr>");
                }
            }
            else if(data.result == "fail"){
                alert("查询失败！");
            }else
            {
                alert("未知错误！");
            }
        },
        error:function (data) {
            alert("操作失败！请检查服务器是否有误");
        }
    });
}

function DeleteCourse() {
    let sid = document.getElementById("Sid").value;
    let stuID = document.getElementById("S_name").value;
    $.ajax({
        type:"get",
        url:url,
        data:{method:"DeleteCourse", sid:sid, stuID:stuID},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes"){
                alert("退选成功！");
            }
            else if(data.result == "no"){
                alert("请求失败！");
            }else
            {
                alert("退选失败！请检查是否退选了不存在的课程！");
            }
        },
        error:function (data) {
            alert("请求失败！请检查服务器是否有误");
        }
    });
}