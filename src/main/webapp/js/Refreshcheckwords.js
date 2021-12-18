function refreshcheckwords()
{
    let str = 0;
    for(let i = 0; i < 4; i ++ )
    {
        str = str * 10 + parseInt(Math.random() * (9 - 1 + 1) + 1);
    }
    console.log(str);
    document.getElementById("showcheckwords").value = str;

}