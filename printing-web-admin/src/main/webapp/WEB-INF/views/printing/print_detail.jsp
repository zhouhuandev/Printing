<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>燚影无人打印后台管理系统 | 历史详情</title>
    <jsp:include page="../../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="box-body">
    <table class="table table-striped table-hover">
        <tbody>
        <tr>
            <td>订单编号：</td>
            <td>${tbOrder.orderId}</td>
        </tr>
        <tr>
            <td>客户姓名：</td>
            <td>${tbOrder.userName}</td>
        </tr>
        <tr>
            <td>客户电话：</td>
            <td>${tbOrder.tel}</td>
        </tr>
        <tr>
            <td>文件名：</td>
            <td><a href="${tbOrder.url}">${tbOrder.fileName}</a></td>
        </tr>
        <tr>
            <td>门店：</td>
            <td>${tbOrder.tbStore.name}</td>
        </tr>
        <tr>
            <td>是否双面打印：</td>
            <td>${tbOrder.isTwoFace == false ? '否' : '是'}</td>
        </tr>
        <tr>
            <td>是否彩色打印：</td>
            <td>${tbOrder.isColorPrinting == false ? '否' : '是'}</td>
        </tr>
        <tr>
            <td>打印数量：</td>
            <td>${tbOrder.numberPrinting}份</td>
        </tr>
        <tr>
            <td>是否立取：</td>
            <td>${tbOrder.isPickNow == false ? '否' : '是'}</td>
        </tr>
        <tr>
            <td>取货时间：</td>
            <td><fmt:formatDate value="${tbOrder.pickTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <td>创建时间：</td>
            <td><fmt:formatDate value="${tbOrder.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../../includes/footer.jsp"/>
</body>
</html>
