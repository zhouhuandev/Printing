<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<!DOCTYPE html>
<html>
<head>
    <title>燚影无人打印后台管理系统 | 发布任务订单</title>
    <jsp:include page="../../includes/header.jsp"/>
    <!-- bootstrap-fileinput CSS -->
    <link href="/static/assets/plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet"
          type="text/css"/>
    <link href="/static/assets/plugins/bootstrap-fileinput/themes/explorer-fas/theme.css" media="all" rel="stylesheet"
          type="text/css"/>
    <!-- Bootstrap Switch CSS -->
    <link rel="stylesheet" href="/static/assets/plugins/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css" />
    <!-- datetimepicker CSS -->
    <link rel="stylesheet" href="/static/assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
    <!-- easyui CSS -->
    <link rel="stylesheet" href="/static/assets/plugins/easyui/easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="/static/assets/plugins/easyui/easyui/themes/icon.css"/>
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
                            <h3 class="box-title">发布任务订单</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal" action="#">
                            <div class="box-body">
                                <div class="row">

                                    <div class="form-group">
                                        <label for="userName"
                                               class="control-label col-lg-1 col-md-2 col-sm-2 col-xs-4 col-lg-offset-4 text-right"
                                               style="font-size: 18px;">姓名：</label>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
                                            <input type="text" class="form-control" id="userName" placeholder="Name"/>
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
                                        <input id="fileName" name="fileName" type="hidden">
                                        <input id="url" name="url" type="hidden">
                                        <label for="uploadfile"
                                               class="control-label col-lg-5 col-md-2 col-sm-2 col-xs-4  text-right"
                                               style="font-size: 18px;">上传文件：</label>
                                        <div class="col-lg-4 col-md-8 col-sm-8 col-xs-8">
                                            <div class="file-loading">
                                                <input id="uploadfile" name="uploadfiles" type="file" multiple>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="store"
                                               class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right"
                                               style="font-size: 18px;">选择门店：</label>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <input type="text" class="form-control" id="store" placeholder="" readonly/>
                                            <input id="storeId" type="hidden">
                                        </div>
                                        <a href="#" class="btn btn-default col-lg-1 col-xs-2 text-center"
                                           onclick="App.initModalDialogStore()">>>></a>
                                    </div>
                                    <div class="form-group">
                                        <label for="istwo-face" class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right"
                                               style="font-size: 18px;">是否双面打印：</label>
                                        <div class="bootstrap-switch bootstrap-switch-mini" style="margin-left: 16px;margin-top: 5px;">
                                            <input type="checkbox" id="istwo-face" name="istwo-face" data-on-text="Yes" data-off-text="No" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="iscolor-printing" class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right"
                                               style="font-size: 18px;">是否彩印：</label>
                                        <div class="bootstrap-switch bootstrap-switch-mini" style="margin-left: 16px;margin-top: 5px;">
                                            <input type="checkbox" id="iscolor-printing" name="iscolor-printing" data-on-text="Yes" data-off-text="No" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="number" class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right" style="font-size: 18px;">份数：</label>
                                        <div class="col-lg-1 col-xs-1" id="number" name="number" style="margin-top: 3px;">
                                            <div class="numberInput"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ispick-now" class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right"
                                               style="font-size: 18px;">是否立取：</label>
                                        <div class="bootstrap-switch bootstrap-switch-mini" style="margin-left: 16px;margin-top: 5px;">
                                            <input type="checkbox" id="ispick-now" name="ispick-now" data-on-text="Yes" data-off-text="No" />
                                        </div>
                                    </div>
                                    <div class="form-group pick-time">
                                        <label for="time" class="control-label col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-3 text-right" style="font-size: 18px;">取货时间：</label>
                                        <div class="input-group date form_datetime col-lg-3 col-xs-8"
                                             data-date-format="yyyy/mm/dd hh:ii:ss"
                                             data-link-field="time" style="padding-left: 15px;padding-top: 4px;">
                                            <input class="form-control" size="16" type="text" value="" readonly>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                        </div>
                                        <input type="hidden" id="time" name="time" value="" /><br />
                                    </div>

                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-lg-2 col-xs-2 col-lg-offset-5 col-xs-offset-4">
                                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                    <button type="button" class="btn btn-primary pull-right">提交订单</button>
                                </div>

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
<!-- 加载自定义模态对话框 -->
<sys:modal/>

<!-- bootstrap-fileinput JS -->
<script src="/static/assets/plugins/bootstrap-fileinput/js/fileinput.js"></script>
<script src="/static/assets/plugins/bootstrap-fileinput/themes/explorer-fas/theme.js"></script>
<script src="/static/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<!-- Bootstrap Switch JS -->
<script src="/static/assets/plugins/bootstrap-switch/dist/js/bootstrap-switch.min.js"></script>
<!-- numberInput -->
<script src="/static/assets/plugins/jQueryNumber/js/numberInput.js"></script>
<!-- datetimepicker JS -->
<script src="/static/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="/static/assets/plugins/easyui/jquery.easyui.min.js"></script>
<script src="/static/assets/plugins/easyui/openWindow.js"></script>
<script>
   // bootstrap-fileinput 初始化
   $(function () {
       App.initFileInput('#uploadfile', '/upload/upload');
   });


     // Bootstrap Switch 初始化
    $("[name='istwo-face']").bootstrapSwitch('state', false, true); //第二个参数默认false,即不双面打印
    $("[name='iscolor-printing']").bootstrapSwitch('state', false, true); //第二个参数默认false,即不彩印
    $("[name='ispick-now']").bootstrapSwitch('state', false, true); //第二个参数默认true,即不立取

   //所有事件都是命名空间，因此.bootstrapSwitch在附加处理程序时始终附加。您可以按如下方式注册发出的事件
   $('input[name="ispick-now"]').on('switchChange.bootstrapSwitch', function(event, state) {
       // 				console.log(this); // DOM element
       // 				console.log(event); // jQuery event
       // 				console.log(state); // true | false
       // 若不立即取货,则显示取货时间,否则显示立即取货
       if (state == true) {
           $(".pick-time").css("display", "none");
       }
       if (state == false) {
           $(".pick-time").css("display", "");
       }
   });

   // numInput 计数器初始化
   App.initNumberInput();
   // 时间初始化
   App.initDateTimePicker();

   <!--检验份数是否正确-->
   function number_focus() {
       var num = $("#num-input").val();
       if (num <= 0) {
           alert("当前数值不能小于或者等于0!");
           $("#num-input").val("1");
       }
   };


</script>
</body>
</html>