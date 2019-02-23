<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<!DOCTYPE html>
<html>
<head>
    <title>燚影无人打印后台管理系统 | 打印历史记录管理</title>
    <jsp:include page="../../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../../includes/nav.jsp"/>
    <jsp:include page="../../includes/menu.jsp"/>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                打印历史记录管理
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">历史记录</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>
                    <div class="box box-info box-info-search" style="display: none;">
                        <div class="box-header">
                            <h3 class="box-title">高级搜索</h3>
                        </div>

                        <div class="box-body">
                            <div class="row form-horizontal">
                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label for="orderId" class="col-sm-4 control-label">订单编号</label>
                                        <div class="col-sm-8">
                                            <input type="text" id="orderId" name="orderId" class="form-control"
                                                   placeholder="请输入订单编号">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label for="userName" class="col-sm-4 control-label">客户姓名</label>
                                        <div class="col-sm-8">
                                            <input type="text" id="userName" name="userName" class="form-control"
                                                   placeholder="请输入客户姓名">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label for="tel" class="col-sm-4 control-label">客户电话</label>
                                        <div class="col-sm-8">
                                            <input type="text" id="tel" name="tel" class="form-control"
                                                   placeholder="请输入客户电话">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" class="btn btn-info pull-right" onclick="search()">搜索
                            </button>
                        </div>


                    </div>

                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title">历史记录列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <a href="/printing/form" type="button" class="btn btn-sm btn-default"><i
                                    class="fa fa-plus"></i>发布新打印订单</a>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-sm btn-default"
                                    onclick="App.deleteMulti('/printing/delete')"><i
                                    class="fa fa-trash-o"></i>删除
                            </button>&nbsp;&nbsp;&nbsp;
                            <button href="#" type="button" class="btn btn-sm btn-primary"
                                    onclick="$('.box-info-search').css('display') == 'none' ? $('.box-info-search').show('fast') : $('.box-info-search').hide('fast')">
                                <i
                                        class="fa fa-search"></i>搜索
                            </button>
                        </div>
                        <div class="box-body table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="minimal icheck_master"></th>
                                    <th>订单编号</th>
                                    <th>客户姓名</th>
                                    <th>客户电话</th>
                                    <th>打印门店</th>
                                    <th>取货时间</th>
                                    <th>下单时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../../includes/copyright.jsp"/>
</div>
<jsp:include page="../../includes/footer.jsp"/>


<!-- 加载自定义模态对话框 -->
<sys:modal/>

<script>
    var _dataTable;

    $(function () {
        var url = "/printing/page";
        var _columns = [
            {
                "data": function (row, type, val, meta) {
                    return '<input id="' + row.id + '" type="checkbox" class="minimal">';
                }
            },
            {"data": "orderId"},
            {"data": "userName"},
            {"data": "tel"},
            {"data": "tbStore.name"},
            {
                "data": function (row, type, val, meta) {
                    return DateTime.format(row.pickTime, "yyyy-MM-dd HH:mm:ss")
                }
            },
            {
                "data": function (row, type, val, meta) {
                    return DateTime.format(row.created, "yyyy-MM-dd HH:mm:ss")
                }
            },
            {
                "data": function (row, type, val, meta) {
                    var detailUrl = "/printing/detail?id=" + row.id;
                    var deleteUrl = "/printing/delete";
                    return '<button type="button" class="btn btn-sm btn-default" onclick="App.initShowDetail(\'' + detailUrl + '\')"><i class="fa fa-search"></i>查看</button>&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle(\'' + deleteUrl + '\',\'' + row.id + '\')"><i class="fa fa-trash-o"></i>删除</button>';
                }
            }
        ];
        // 初始化表格数据
        _dataTable = App.initDataTables(url, _columns);
    });

    // 高级查询搜索
    function search() {
        var orderId = $("#orderId").val();
        var userName = $("#userName").val();
        var tel = $("#tel").val();

        //数据封装成param对象
        var param = {
            "orderId": orderId,
            "userName": userName,
            "tel": tel
        };
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();//重新装载

    }

</script>
</body>
</html>