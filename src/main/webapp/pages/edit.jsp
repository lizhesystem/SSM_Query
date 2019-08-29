<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <center><h3>修改联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/list/Update.do" method="post">

        <input type="text" hidden name="id" value="${user.id}">

        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" value="${user.name}" readonly id="name" name="name">
        </div>

        <c:if test="${user.gendet == '男'}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="gendet" value="男" checked/>男
                <input type="radio" name="gendet" value="女"/>女
            </div>
        </c:if>

        <c:if test="${user.gendet == '女'}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="gendet" value="男"/>男
                <input type="radio" name="gendet" value="女" checked/>女
            </div>
        </c:if>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" value="${user.age}" id="age" name="age" placeholder="请输入年龄">
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" id="address" class="form-control">
                <c:if test="${user.address == '陕西'}">
                    <option value="陕西" selected>陕西</option>
                    <option value="北京">北京</option>
                    <option value="上海">上海</option>
                </c:if>

                <c:if test="${user.address == '北京'}">
                    <option value="陕西">陕西</option>
                    <option value="北京" selected>北京</option>
                    <option value="上海">上海</option>
                </c:if>

                <c:if test="${user.address == '上海'}">
                    <option value="陕西">陕西</option>
                    <option value="北京">北京</option>
                    <option value="上海" selected>上海</option>
                </c:if>
            </select>
        </div>


        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" value="${user.qq}" id="qq" name="qq" placeholder="请输入QQ号码"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" value="${user.email}" id="email" name="email"
                   placeholder="请输入邮箱地址"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" id="reset" type="reset" value="重置"/>
            <a href="javascript:history.go(-1)"><input class="btn btn-default" type="button" value="返回"/></a>

        </div>
    </form>
</div>

<script>
    $(function () {
        $('#reset').click(function () {
            $(".form-control").reset();

        })

    })

</script>

</body>
</html>