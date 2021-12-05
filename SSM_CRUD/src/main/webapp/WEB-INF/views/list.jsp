<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--引入BootStrap的css样式--%>
    <link href="/crud/static/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet">
    <%--引入BootStrap的js样式--%>
    <script src="/crud/static/bootstrap-3.4.1-dist/js/bootstrap.js" rel="script"></script>
    <%--引入jquery样式--%>
    <script src="/crud/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>departmentName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.email}</th>
                        <th>${emp.gender}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button type="button" class="btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button type="button" class="btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <%--分页条--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
           当前第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，总共有${pageInfo.total}条数据
        </div>
        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <li><a href="/crud/emps?pageNo=1">首页</a></li>
                    <li>
                        <%--如果还有上一页，显示该图标--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="/crud/emps?pageNo=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNo">
                        <%--如果当前页码和遍历的页码相同，高亮--%>
                        <c:if test="${pageInfo.pageNum==pageNo}">
                            <li class="active"><a href="/crud/emps?pageNo=${pageNo}">${pageNo}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=pageNo}">
                            <li><a href="/crud/emps?pageNo=${pageNo}">${pageNo}</a></li>
                        </c:if>
                    </c:forEach>
                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="/crud/emps?pageNo=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="/crud/emps?pageNo=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>

