<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="${ctx}/static/css/register.css"/>
</head>
<body>
    <c:if test="${not empty sucRegister}">
        <script type="text/javascript">
            var msg = confirm("注册成功，现在去登录吗？");
            if(msg == true){
                window.location = '/login.jsp';
            }
        </script>
    </c:if>
    <div class="superlogin"></div>
    <div class="loginBox">
        <div class="loginMain">
        <form action="${ctx}/users/register" method="post">
            <div class="tabwrap">
                <table>
                    <tbody>
                    <tr>
                        <td class="title"><label for="cardId">身份证号：</label></td>
                        <td><input class="form-control txt" type="text" id="cardId" name="cardId"></td>
                    </tr>
                    <tr>
                        <td class="title"><label for="user">用户名：</label></td>
                        <td><input class="form-control txt" type="text" id="user" name="name"></td>
                    </tr>
                    <tr>
                        <td class="title"><label for="pwd">密   码：</label></td>
                        <td><input class="form-control txt" type="password" id="pwd" name="password"></td>
                    </tr>
                    <tr>
                        <td class="title"><label for="rePassword">确认密码：</label></td>
                        <td><input class="form-control txt" type="password" id="rePassword"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input class="loginbtn" value="注册"  type="button" id="registerBtn">
                            <input class="resetbtn" value="返回" type="button" onclick="goBack()">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            </form>
        </div>
    </div>
    <div class="footer">
        Copyright © 2017-2020 uimaker  All Rights Reserved.
    </div>
</body>
<script src="${ctx}/static/js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#registerBtn").click(function () {
        //获取身份证号
        var cardId = $('input[name=cardId]').val();
        var name = $('input[name=name]').val();
        var password = $('input[name=password]').val();
        var rePassword = $('#rePassword').val();

        //全数字的18位
        var reg = /^\d{18}$/;
        if(!reg.test(cardId)){
            alert("请输入18位数字身份证号码");
            return;
        }
        if(name > 25){
            alert('用户名长度过长');
            return;
        }
        if (password < 6){
            alert('密码长度不足6位');
            return;
        }

        if (password != rePassword){
            alert('两次输入的密码不一致');
            return;
        }

        //验证身份证号码是否被使用，ajax进行验证
        $.ajax({
            url:'${ctx}/users/isUsed/'+cardId,
            type:'get',
            success:function(data){
                if(data.code == 1){
                    alert('该账号已经被注册，请换一个');
                    return;
                }else {
                    $('form').submit();
                }
            }
        })
    })

    function goBack() {
        window.history.go(-1);
    }
</script>
</html>