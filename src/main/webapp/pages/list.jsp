<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<%--<c:if test="${!empty adminUser}">--%>


<div class="container">
    <div>
        <a href="${pageContext.request.contextPath}/login/loginOut.do">
            <button style="float: right;margin: 10px 8px;" type="button" class="btn btn-success">退出登录</button>
        </a>
    </div>
    <h3 style="text-align: center">用户信息列表</h3>


    <!--表格上查询按钮-->
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/list/findUserMessage.do" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${inputPara.name}" class="form-control"
                       id="exampleInputName2">
            </div>
            <%--这里EL获取Map总结下--%>

            <div class="form-group">
                <label for="jiguan">籍贯</label>
                <input type="text" name="address" value="${inputPara.address}" class="form-control" id="jiguan">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="text" name="email" value="${inputPara.email}" class="form-control"
                       id="exampleInputEmail2">
            </div>


            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>


    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/pages/add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelectUser">删除选中</a>

    </div>

    <form id="form" action="${pageContext.request.contextPath}/list/delSelectUser.do" method="post">
        <table border="1" class="table table-hover table-bordered">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>email</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${PageInfo.list}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gendet}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/list/editUser.do?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="deleteUser(${user.id});">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=1&rows=5&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}"
                       aria-label="Next">
                        <span aria-hidden="true">首页</span>
                    </a>
                </li>

                <c:if test="${PageInfo.pageNum == 1}">
                <li class="disabled">
                    </c:if>

                    <c:if test="${PageInfo.pageNum != 1}">
                <li>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${PageInfo.pageNum -1}&size=5&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <%--计算页码--%>
                <c:choose>
                    <%--如果总页码小于10，开始1结束为最大页码--%>
                    <c:when test="${PageInfo.pages < 10}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="${PageInfo.pages}"/>
                    </c:when>
                    <%--默认情况下 开始是当前页码是-5,结束是+ 4的的值来定义开市页和结束页--%>
                    <c:otherwise>
                        <c:set var="begin" value="${PageInfo.pageNum - 5}"/>
                        <c:set var="end" value="${PageInfo.pageNum + 4}"/>
                        <%--如果计算出来的begin前面不够5个--%>
                        <c:if test="${begin - 5 < 1}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${begin + 9}"/>
                        </c:if>

                        <%--如果计算出来end后面不够4个，也就是到末尾了--%>
                        <c:if test="${end > PageInfo.pages}">
                            <c:set var="end" value="${PageInfo.pages}"/>
                            <c:set var="begin" value="${end - 9}"/>
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <%--遍历把begin和end放到页码中--%>
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <%--是否被选中--%>
                    <c:if test="${PageInfo.pageNum == i}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${i}&size=${PageInfo.pageSize}&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}">${i}</a>
                        </li>
                    </c:if>
                    <c:if test="${PageInfo.pageNum != i}">
                        <li class="">
                            <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${i}&size=${PageInfo.pageSize}&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}">${i}</a>
                        </li>
                    </c:if>

                </c:forEach>

                <c:if test="${PageInfo.pageNum == PageInfo.pages}">
                    <li class="disabled">
                        <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${PageInfo.pages}&size=5&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${PageInfo.pageNum != PageInfo.pages}">
                    <li class="">
                        <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${PageInfo.pageNum + 1}&size=5&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li>
                    <a href="${pageContext.request.contextPath}/list/findUserMessage.do?page=${PageInfo.pages}&rows=5&name=${inputPara.name}&address=${inputPara.address}&email=${inputPara.email}"
                       aria-label="Next">
                        <span aria-hidden="true">尾页</span>
                    </a>
                </li>


                &nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 22px">总共${PageInfo.total}条数据，共${PageInfo.pages}页</span>
            </ul>
        </nav>
    </div>


</div>
<%--</c:if>--%>
<script>

    function deleteUser(id) {
        if (confirm("确定要删除吗?")) {
            location.href = "${pageContext.request.contextPath}/list/delUser.do?id=" + id;
        }
    }

    $(function () {
        $("#delSelectUser").click(function () {
            if (confirm("确定要删除选中吗?")) {
                var flag = false;

                var uid = $("input[name='uid']");
                for (var i = 0; i < uid.length; i++) {
                    if (uid[i].checked) {
                        flag = true;
                        break;
                    }
                }

                if (flag) {
                    $("#form").submit();
                }
            }

        });

        $("#firstCb").click(function () {

            var uid = $("input[name='uid']");
            for (var i = 0; i < uid.length; i++) {
                uid[i].checked = this.checked;
            }

        })


    })

</script>
</body>
</html>