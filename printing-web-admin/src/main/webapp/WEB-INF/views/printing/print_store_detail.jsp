<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>燚影无人打印后台管理系统 | 店铺详情</title>
    <jsp:include page="../../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="box-body">
    <table class="table table-striped table-hover">
        <tbody>
        <tr>
            <td>店铺 ID：</td>
            <td>${tbStore.id}</td>
        </tr>
        <tr>
            <td>店铺名：</td>
            <td>${tbStore.name}</td>
        </tr>
        <tr>
            <td>地址：</td>
            <td>${tbStore.address}</td>
        </tr>
        <tr>
            <td>店铺照片：</td>
            <td>
                <div class="image">
                    <img src="${tbStore.imgUrl == null ? '' : tbStore.imgurl}"
                         class="img-circle" alt="Store Image" style="width: 80px;">
                </div>
            </td>
        </tr>
        <tr>
            <td>联系电话：</td>
            <td>${tbStore.tel}</td>
        </tr>
        <tr>
            <td>店主：</td>
            <td>${tbStore.shopman}</td>
        </tr>
        <tr>
            <td>共计打印数量：</td>
            <td>${tbStore.number}份</td>
        </tr>
        <tr>
            <td>创建时间：</td>
            <td><fmt:formatDate value="${tbStore.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../../includes/footer.jsp"/>
</body>
</html>
