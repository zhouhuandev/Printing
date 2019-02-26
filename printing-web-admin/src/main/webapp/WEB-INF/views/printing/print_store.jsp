<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouhuan
  Date: 2019/2/15
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>门店</title>
    <jsp:include page="../../includes/header.jsp"/>
</head>
<body>
<div class="row-fluid">
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="info">
                <%--<th><input type="checkbox" class="minimal icheck_master"></th>--%>
                <th></th>
                <th>序号</th>
                <th>店名</th>
                <th>地址</th>
                <th>联系电话</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${tbStores}" var="tbStore">
                <tr>
                    <td><input id="${tbStore.id}" type="checkbox" class="minimal" value="${tbStore.name}"></td>
                    <td>${tbStore.id}</td>
                    <td>${tbStore.name}</td>
                    <td><a href="#">${tbStore.address}</a></td>
                    <td>${tbStore.tel}</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-default" onclick="App.initShowDetail('/store/detail?id=${tbStore.id}')"><i class="fa fa-search"></i>查看</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="../../includes/footer.jsp"/>
<!-- 加载自定义模态对话框 -->
<sys:modal/>
<script src="/static/assets/plugins/easyui/jquery.easyui.min.js"></script>
<script src="/static/assets/plugins/easyui/openWindow.js"></script>

<script>
    //选择店铺的信息
    function isChoiceStroe(dialog) {
        return App.initIsChiose();
    }
</script>
</body>
</html>
