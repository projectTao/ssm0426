<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" href="${ctx }/static/css/login.css"/>
</head>
<body>

<div class="superlogin"></div>
<div class="loginBox">
    <div class="loginMain">
        <form action="${ctx }/users/login" method="post" id="myform">
            <input type="hidden" name="_method" value="login">
            <div class="tabwrap">
                <table>
                    <tbody>
                    <tr>
                        <td class="title"><label for="cardId">请输入身份证号码：</label></td>
                        <td><input class="form-control txt" type="text" id="cardId" name="cardId"></td>
                    </tr>
                    <tr>
                        <td class="title"><label for="pwd">请输入密码：</label></td>
                        <td><input class="form-control txt" type="password" id="pwd" name="password"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input class="loginbtn" value="登录"  type="submit" id="">
                            <a class="resetbtn" href="register.jsp"><span style="position: relative;top: 12px;">注册</span></a>
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
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript"src="${ctx }/static/js/login.js"></script>
<c:if test="${not empty msg}">
    <script type="text/javascript">
        alert("${msg.message}")
    </script>
</c:if>
</body>
</html>