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
                <table class="table table-hover">
                    <thead>
                    <tr class="info">
                        <th><input type="checkbox" class="minimal icheck_master"></th>
                        <th>序号</th>
                        <th>店名</th>
                        <th>地址</th>
                        <th>联系电话</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input id="1" type="checkbox" class="minimal" value="Mark"></td>
                        <td>1</td>
                        <td>Mark</td>
                        <td><a href="index.html">地址</a></td>
                        <td>@mdo</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-default"><i class="fa fa-search"></i>查看</button>
                        </td>
                    </tr>
                    <tr>
                        <td><input id="2" type="checkbox" class="minimal" value="Jacob"></td>
                        <td>2</td>
                        <td>Jacob</td>
                        <td><a href="index.html">Thornton</a></td>
                        <td>@fat</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-default"><i class="fa fa-search"></i>查看</button>
                        </td>
                    </tr>
                    <tr>
                        <td><input id="3" type="checkbox" class="minimal" value="Larry"></td>
                        <td>3</td>
                        <td>Larry</td>
                        <td><a href="index.html">the Bird</a></td>
                        <td>@twitter</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-default"><i class="fa fa-search"></i>查看</button>
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

<script>
    //选择店铺的信息
    function isChoiceStroe(dialog) {
        return App.initIsChiose();
    }
</script>
</body>
</html>
