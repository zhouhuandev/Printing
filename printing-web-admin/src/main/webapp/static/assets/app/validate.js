/**
 * 函数对象
 * 闭包
 * 增强了js的安全性
 * 一个方法只做一件事
 */
var Validata = function () {


    /**
     * 初始化jQuery Validate
     * 私有方法函数
     */
    var handleerInitValidate = function () {
        //初始化inputForm表单的验证
        $(function () {
            $("#inputForm").validate({
                errorElement: 'span',//错误追加span标签
                errorClass: 'help-block',//错误追加help-block类

                //错误执行的方法
                errorPlacement: function (error, element) {
                    element.parent().parent().attr("class", "form-group has-error");
                    error.insertAfter(element);
                }
            });
        });

    };
    /**
     * 增加自定义验证规则
     */
    var handlerInitCustomValidate = function () {
        /**
         * 验证手机号
         */
        $.validator.addMethod("mobile", function (value, element) {
            var length = value.length;
            var mobile = /^(13|15|18|17|14|16|19)\d{9}/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误!");

        /**
         * 验证姓名，可以是中文或英文
         */
        $.validator.addMethod("username", function (value, element) {
            var name = /(^[\u2E80-\u9FFF]+$)|(^\w+[\w\s]+\w+$)/;
            return this.optional(element) || (name.test(value));
        }, "请输入中文名或英文名，不包含数字和特殊字符！");


    };

    /**
     * 公共方法函数
     */
    return {
        /**
         * 初始化
         */
        init: function () {
            handlerInitCustomValidate();
            handleerInitValidate();
        }
    }
}();

//初始化验证表单功能
$(document).ready(function () {
    Validata.init();
});