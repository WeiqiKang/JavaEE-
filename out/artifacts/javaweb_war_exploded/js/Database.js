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
        url:"http://59.110.11.72:8080/javaweb_war/db.do",
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
    var id = document.getElementById("S_name").value;
    var tab = document.getElementById("Selectbyid");//表格

    $('#Selectbyid tbody').html("");//清空，只留表头

    $('#H_outcome').css({"visibility" : "visible"});
    //$('#Selectbyid').css({"visibility" : "visible", 'border' : '2px solid'});

    $.ajax({
        type:"get",
        url:"http://59.110.11.72:8080/javaweb_war/db.do",
        data:{method:"SelectItemById", id1:id},
        datatype:"json",
        success:function (data) {
            if(data.result == "yes")
            {

                $('#Selectbyid').css({"visibility" : "visible"});
                var tr = document.createElement("tr");
                var l1 = document.createElement("td"); l1.innerHTML = data.name;
                var l2 = document.createElement("td"); l2.innerHTML = data.id;
                var l3 = document.createElement("td"); l3.innerHTML = data.class_num;
                var l4 = document.createElement("td"); l4.innerHTML = data.zz;
                var l5 = document.createElement("td"); l5.innerHTML = data.yy;
                var l6 = document.createElement("td"); l6.innerHTML = data.sx;
                var l7 = document.createElement("td"); l7.innerHTML = data._408;

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