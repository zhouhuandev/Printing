<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>燚影无人打印后台管理系统 | 主页</title>
    <jsp:include page="../../includes/header.jsp"/>
    <!-- bootstrap-fileinput CSS -->
    <link href="/static/assets/plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
    <link href="/static/assets/plugins/bootstrap-fileinput/themes/explorer-fas/theme.css" media="all" rel="stylesheet"
          type="text/css"/>
    <!-- bootstrap-fileinput CSS End -->

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
                无人打印控制面板
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">无人打印控制面板</li>
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
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">${tbUser.id == null ? "新增" : "编辑"}管理</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal">
                            <div class="box-body">
                                <div class="row">

                                    <div class="form-group">
                                        <label for="username"
                                               class="control-label col-lg-1 col-md-2 col-sm-2 col-xs-4 col-lg-offset-4 text-right"
                                               style="font-size: 18px;">姓名：</label>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
                                            <input type="text" class="form-control" id="username" placeholder="Name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="tel"
                                               class="control-label col-lg-1 col-md-2 col-sm-2 col-xs-4 col-lg-offset-4 text-right"
                                               style="font-size: 18px;">电话：</label>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
                                            <input type="text" class="form-control" id="tel" placeholder="Tel"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="uploadfile"
                                               class="control-label col-lg-5 col-md-2 col-sm-2 col-xs-4  text-right"
                                               style="font-size: 18px;">上传文件：</label>
                                        <div class="col-lg-4 col-md-8 col-sm-8 col-xs-8">
                                            <div class="file-loading">
                                                <input id="uploadfile" type="file" multiple data-show-caption="true">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                <button type="submit" class="btn btn-info pull-right">提交</button>
                            </div>
                            <!-- /.box-footer -->
                        </form>
                        <!-- /.box -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../../includes/copyright.jsp"/>
</div>
<jsp:include page="../../includes/footer.jsp"/>
<!-- bootstrap-fileinput JS -->
<script src="/static/assets/plugins/bootstrap-fileinput/js/plugins/sortable.js"></script>
<script src="/static/assets/plugins/bootstrap-fileinput/js/fileinput.js"></script>
<script src="/static/assets/plugins/bootstrap-fileinput/themes/explorer-fas/theme.js"></script>

<script>
    <!--upfile input初始化 -->
    $("#uploadfile").fileinput({
        theme: 'explorer-fas', //更改文件载上传框中的样式
        language: 'zh', //更改语言,需要引入语言包zh.js
        uploadUrl: '#', //上传文件路径
        deleteUrl: '#', //删除文件的时候请求路径
        uploadAsync: false, //是否异步上传
        allowedFileExtensions: ['docx', 'doc', 'xlsx', 'xls', 'pptx', 'ppt', 'txt'], //接收的文件后缀，如['jpg', 'gif', 'png','docx', 'doc', 'xlsx','xls','pptx','ppt','txt'],不填将不限制上传文件后缀类型
        maxFileSize: 0, //单位为kb，如果为0表示不限制文件大小
        maxFileCount: 10, //表示允许同时上传的最大文件个数

    });
</script>
</body>
</html>