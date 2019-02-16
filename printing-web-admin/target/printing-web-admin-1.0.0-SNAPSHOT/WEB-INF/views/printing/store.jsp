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
<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-hover" style="table-layout:fixed;">
                    <thead>
                    <tr class="info">
                        <th width="10%" class="text-center">序号</th>
                        <th width="20%">店名</th>
                        <th>地址</th>
                        <th width="20%">联系电话</th>
                        <th width="15%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row" class="text-center">1</th>
                        <td>Mark</td>
                        <td><a href="index.html">地址</a></td>
                        <td>@mdo</td>
                        <td>
                            <a href="index.html"><span class="glyphicon glyphicon-search"
                                                       aria-hidden="true">查看</span></a>
                            <a href="index.html"><span class="glyphicon glyphicon-ok" aria-hidden="true">确定</span></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">2</th>
                        <td>Jacob</td>
                        <td><a href="index.html">Thornton</a></td>
                        <td>@fat</td>
                        <td>
                            <a href="index.html"><span class="glyphicon glyphicon-search"
                                                       aria-hidden="true">查看</span></a>
                            <a href="index.html"><span class="glyphicon glyphicon-ok" aria-hidden="true">确定</span></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">3</th>
                        <td>Larry</td>
                        <td><a href="index.html">the Bird</a></td>
                        <td>@twitter</td>
                        <td>
                            <a href="index.html"><span class="glyphicon glyphicon-search"
                                                       aria-hidden="true">查看</span></a>
                            <a href="index.html"><span class="glyphicon glyphicon-ok" aria-hidden="true">确定</span></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../includes/footer.jsp"/>

<script src="/static/assets/plugins/easyui/jquery.easyui.min.js"></script>
<script src="/static/assets/plugins/easyui/openWindow.js"></script>
</body>
</html>
