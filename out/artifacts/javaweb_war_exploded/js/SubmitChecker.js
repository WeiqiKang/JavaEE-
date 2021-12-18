function checklogin()
{
    if(document.forms["form1"]["showcheckwords"].value != document.forms["form1"]["checkwords"].value) {
        alert("验证码不正确！");
        return false;
    }


    if(document.forms["form1"]["identity"].value.length == 0)
    {
        alert("请选择身份！");
        return false;
    }
    return true;
}