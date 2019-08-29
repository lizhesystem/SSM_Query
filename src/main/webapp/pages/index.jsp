<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body>


<div>
    <a href="${pageContext.request.contextPath}/pages/register.jsp">
        <button style="float: right;margin: 10px 20px;" type="button" class="btn btn-primary">注册</button>
    </a>
</div>

<c:if test="${!empty user}">
    <div>
        <a href="${pageContext.request.contextPath}/login/loginOut.do">
            <button style="float: right;margin: 10px 20px;" type="button" class="btn btn-primary">退出登录</button>
        </a>
    </div>
</c:if>

<c:if test="${empty user}">
    <div>
        <a href="${pageContext.request.contextPath}/pages/login.jsp">
            <button style="float: right;margin: 10px 20px;" type="button" class="btn btn-primary">登录</button>
        </a>
    </div>
</c:if>

<%--<c:if test="${!empty user}">--%>
<%--<div style="display: none">--%>
<%--<a href="${pageContext.request.contextPath}/login/loginOut.do">--%>
<%--<button style="float: right;margin: 10px 20px;" type="button" class="btn btn-primary">登录</button>--%>
<%--</a>--%>
<%--</div>--%>
<%--</c:if>--%>


<%--<div>--%>
<%--<a href="${pageContext.request.contextPath}/loginOutServlet">--%>
<%--<button style="float: right;margin: 10px 20px;" type="button" class="btn btn-primary">退出登录</button>--%>
<%--</a>--%>
<%--</div>--%>


<div class="alert alert-success" role="alert">
    <c:if test="${!empty user}">
        <span style="color: chocolate">亲爱的${user}欢迎您，登陆成功。</span>
    </c:if>
    <c:if test="${empty user}">
        <span>首次访问请先注册~</span>
    </c:if>
</div>


<c:if test="${!empty user}">
    <div align="center">
        <a href="${pageContext.request.contextPath}/list/findUserMessage.do"
           style="text-decoration:none;font-size:33px">点击查询用户</a>
    </div>
</c:if>

<c:if test="${empty user}">
    <div align="center">
        <a href="javascript:void(0)"
           style="text-decoration:none;font-size:33px">欢迎访问用户查询系统</a>
    </div>
</c:if>


</body>
</html>