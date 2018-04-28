<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>房产信息查询系统</title>
    <link rel="stylesheet" href="${ctx }/static/css/loginsuc.css"/>
</head>
<body>
<div class="container">
    <div style="padding-bottom: 70px">
        <span style="font-size: 18px">用户名：${usersInfo.name}</span>，<a href="${ctx}/users/logout" style="font-size: 18px">退出</a>
    </div>
    <div class="content">
        <div class="content_left">
            <a href="${cxt}/estate/index" class="left content_left_b">房产信息查询</a><br>
        </div>
        <div class="content_right">
            <c:if test="${empty page.list}">
                <h1 style="text-align: center;position: relative;top: 90px;">欢迎使用房产信息查询系统</h1>
            </c:if>
                <c:if test="${not empty page.list}">
                <h3 style="text-align: center;padding-bottom: 20px;">房产信息查询</h3>
                <form action="${ctx }/estate/page" method="post" style="text-align: center;padding-bottom: 20px;">
                        查询类型：<select name="selectType">
                                    <option value="1" 	<c:if test="${type == 1 }">selected="selected"</c:if> >用户名</option>
                                    <option value="2" 	<c:if test="${type == 2 }">selected="selected"</c:if>>身份证</option>
                                </select>
                    <input name="inputStr" value="${inputStr }">
                     <input type="button" value="查找" id="selectBtn">
                    </form>
                <table id="tableSort">
                    <thead>
                    <tr style="background-color: #5bc0de">
                        <th>序号</th>
                        <th>项目名称</th>
                        <th>产权人</th>
                        <th>身份证号</th>
                        <th>房屋类型</th>
                        <th>使用面积</th>
                        <th>建造时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list }" var="obj" varStatus="vs">
                        <tr ${vs.count%2==1 ? "style='background-color:#FFF'" : "style='background-color:#c7ddef'"}>
                            <td>${vs.index + 1}</td>
                            <td>${obj.projectname }</td>
                            <td>${obj.users.name }</td>
                            <td>${obj.users.cardId }</td>
                            <td>${obj.hoursetype }</td>
                            <td>${obj.area }</td>
                            <td><fmt:formatDate value="${obj.buildtime }" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="7" style="padding-top: 17px">
                            <a href="javascript:void(0)" id="homePage">首 页</a>|
                            <a href="javascript:void(0)" id="prevPage" >《 上一页</a>|
                            <a href="javascript:void(0)" id="nextPage">下一个页 》</a>|
                            <a href="javascript:void(0)" id="lastPage">尾 页</a>
                            到 第 <input name="inputPageNum" style="width: 25px"> 页&nbsp;&nbsp;<button id="skipPageBtn"> 确 定 </button>
                            第&nbsp;${page.pageNum }&nbsp;页 /共&nbsp;${page.pages }&nbsp;页 (${page.total }&nbsp;条)
                        </td>
                    </tr>
                    </c:if>
                    </tbody>
                </table>
                <div style="clear: both"></div>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
<form action="${ctx}/estate/page" method="post" id="formSubmit">
    <input type="hidden" name="pageNum"><br>
    <input type="hidden" name="pageSize" value="2"><br>
    <input type="hidden" name="type"><br>
    <input type="hidden" name="inputValue"><br>
</form>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.pagination.js"></script>
<script type="text/javascript">
    $("#homePage").click(function () {
        //1更新当前页码
        var pageNum = 1;
        //获取选择的查询类型
        var selectType =$('select[name=selectType]').val();
        //填写的信息
        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();
    })

    $("#prevPage").click(function () {
        //1更新当前页码
        var pageNum = '${page.pageNum-1}';
        //获取选择的查询类型
        var selectType =$('select[name=selectType]').val();
        //填写的信息
        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();
    })

    $("#nextPage").click(function () {
        //1更新当前页码
        var pageNum = '${page.pageNum+1}';
        //获取选择的查询类型
        var selectType =$('select[name=selectType]').val();
        //填写的信息
        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();
    })

    $("#lastPage").click(function () {
        //1更新当前页码
        var pageNum = '${page.pages}';
        //获取选择的查询类型
        var selectType =$('select[name=selectType]').val();
        //填写的信息
        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();
    })

    $("#selectBtn").click(function () {
        var pageNum = 1;
        var selectType = $('select[name=selectType]').val();
        // 3填写的值
        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();

    })

    //skipPageBtn
    $('#skipPageBtn').click(function(){
        var pageNum = $("input[name=inputPageNum]").val();

        var selectType = $('select[name=selectType]').val();

        var inputStr = $('input[name=inputStr]').val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=type]').val(selectType);
        $('input[name=inputValue]').val(inputStr);
        $('#formSubmit').submit();
    })
</script>
</html>