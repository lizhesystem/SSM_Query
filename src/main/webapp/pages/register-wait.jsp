<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style>


        body, html {
            height: 100%;
            width: 100%;
            background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
        }
        #text {
            margin-top: 80px;
        }
    </style>

</head>
<body>


<div class="container ">

    <div id="text" align="center">
        <a href="${pageContext.request.contextPath}/pages/login.jsp" style="text-decoration:none;font-size:20px;color: #23527c;margin-top: 50px">注册成功,<span
                id="time">5秒后自动跳转登录,点击立即跳转</span></a>
    </div>

</div>


<script type="text/javascript">
    $(function () {
        var t = 4;
        function countDown() {

            if (t === 0) {
                window.location.href = "${pageContext.request.contextPath}/pages/login.jsp"
            }

            $("#time").text(t + "秒后自动跳转登录,点击立即跳转")
            t--;
        }
        setInterval(countDown, 1000);
    })

</script>
</body>
</html>