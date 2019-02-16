package com.yiying.printing.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 打印控制器
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/26 23:11
 */
@Controller
@RequestMapping(value = "printing")
public class PrintingController {

    /**
     * 跳转打印记录管理
     *
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "printing/print_list";
    }
    /**
     * 跳转打印表单页
     *
     * @return
     */
    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form() {
        return "printing/print_form";
    }

    /**
     * 打开 莫泰对话框 里面装载 store.jsp
     *
     * @return
     */
    @RequestMapping(value = "store", method = RequestMethod.GET)
    public String store() {
        return "printing/store";
    }
}
