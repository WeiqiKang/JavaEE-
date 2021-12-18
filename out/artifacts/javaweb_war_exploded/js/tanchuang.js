window.onload = function(){
    var popUp = document.getElementsByClassName('popUp'); //获取div.popUp的DOM节点,注意！popUp此时是一个数组
    var openBtn = document.getElementById('openBtn');     //获取点击按钮的DOM节点
    var closeBtn = document.getElementById('closeBtn');   //获取弹框里面关闭按钮的DOM节点

    //点击弹窗按钮触发事件
    openBtn.onclick = function(){
        //给div.popUp添加一个名叫showCont的id,随后该id执行对应动画
        popUp[0].setAttribute('id','showCont');
    }

    //点击关闭按钮触发事件
    closeBtn.onclick = function(){
        //给div.popUp添加一个名叫hiddenCont的id,随后该id执行对应动画
        popUp[0].setAttribute('id','hiddenCont');
    }

}