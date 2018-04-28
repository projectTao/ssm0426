$(document).ready(function () {
    $("#myform").submit(function () {
        var flag=true;
        if(!checkcardId()){flag=false;}
        if(!checkPwd()){flag=false;}
        return flag;
    });
})
function checkcardId() {
    var $cardId = $("#cardId");
    if ($cardId.val() == "") {
        alert("用户名不能为空");
        return false;
    }
    var reg = /^\d{18}$/;
    if (!reg.test($cardId.val())){
        alert("身份证号码必须为18为数字");
        return false;
    }
    return true;
}
function checkPwd(){
    var $pwd=$("#pwd");
    if($pwd.val()==""){
        alert("密码不能为空");
        return false;
    }
    if ($pwd.val().length < 6){
        alert("密码长度不足6位");
        return false;
    }
    return true;
}