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
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script type="text/javascript"  src="../js/bootstrap.min.js"></script>
    <style>
        .box{
            margin-top:180px;
        }
        body,html{
            height: 100%;
            width: 100%;
            background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);        }
    </style>

</head>
<body>


<div class="container ">

    <form action="${pageContext.request.contextPath}/login/UserRegister.do" method="post" >
        <div class="row box">
            <p class="lead text-center">注册</p>
            <div class="row">
                <div class="form-group col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4">
                    <label for="exampleInput">username</label>
                    <input type="text" name="username" class="form-control" id="exampleInput" placeholder="username">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4">
                    <label for="code">验证码：</label>
                    <img src="${pageContext.request.contextPath}/login/checkCodeServlet.do" id="code1" alt=""  style="cursor: pointer">
                    <input type="text" name="code" class="form-control" id="code" placeholder="验证码">
                    <%--<span style="color:red">${CodeErr}</span>--%>
                </div>
            </div>


            <button type="submit" class="btn btn-success col-lg-2 col-lg-offset-5 col-sm-2 col-sm-offset-5  col-xs-2 col-xs-offset-5  col-md-2 col-md-offset-5">Submit</button>
            <%--<span style="color: red;margin-left: 20px;font-size: 16px;display: inline-block;margin-top: 6px;">${registerErr}</span>--%>
        </div>
    </form>


</div>


<%--<c:if test="${!empty registerErr}">--%>
    <%--<div class="alert alert-warning alert-dismissible col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4" role="alert" style="margin-top: 20px">--%>
        <%--<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
        <%--<strong>${registerErr}</strong>--%>
    <%--</div>--%>
<%--</c:if>--%>

<c:if test="${!empty CodeErr}">
    <div class="alert alert-warning alert-dismissible col-lg-4 col-lg-offset-4  col-sm-4 col-sm-offset-4  col-xs-4 col-xs-offset-4" role="alert" style="margin-top: 20px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>${CodeErr}</strong>
    </div>
</c:if>

<script>
    $(function () {
        $('#code1').click(function () {
            $(this).attr("src","${pageContext.request.contextPath}/login/checkCodeServlet.do?time=" + new Date().getTime());
        });
    })
</script>
</body>
</html>