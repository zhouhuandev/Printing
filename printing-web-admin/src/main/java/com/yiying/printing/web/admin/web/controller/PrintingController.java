package com.yiying.printing.web.admin.web.controller;

import com.yiying.printing.commons.dto.BaseResult;
import com.yiying.printing.commons.dto.PageInfo;
import com.yiying.printing.domain.TbOrder;
import com.yiying.printing.web.admin.service.TbOrderService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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

    @Autowired
    private TbOrderService tbOrderService;


    /**
     * 表单里面使用的modelAttribute进行绑定数据
     * 自动获取用户信息，绑定到当前页面
     * 总在@RequestMapping标签前执行
     *
     * @param id
     * @return
     */
    @ModelAttribute
    public TbOrder getTbOrder(Long id) {
        TbOrder tbOrder = null;

        //id不为空，则从数据库中获取
        if (id != null) {
            tbOrder = tbOrderService.getById(id);
        }
        //否则创建新的对象,绑定到页面
        else {
            tbOrder = new TbOrder();
        }
        return tbOrder;
    }

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
     * 保存信息
     *
     * @param tbOrder
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(TbOrder tbOrder, Model model, RedirectAttributes redirectAttributes) {
        //若是前台的 checkbox 传来的数据为 "on",故采用此种方式
        tbOrder.setIsTwoFace(tbOrder.getIsTwoFace() == null ? false : tbOrder.getIsTwoFace());
        tbOrder.setIsColorPrinting(tbOrder.getIsColorPrinting() == null ? false : tbOrder.getIsColorPrinting());
        tbOrder.setIsPickNow(tbOrder.getIsPickNow() == null ? false : tbOrder.getIsPickNow());

        BaseResult baseResult = tbOrderService.save(tbOrder);

        //保存成功
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            //进行重定向，会清空所有的request的请求信息，故采用RedirectAttributes装载数据返回页面，前台使用el表达式取出
            return "redirect:/printing/list";
        }
        //保存失败
        else {
            model.addAttribute("baseResult", baseResult);
            return "printing/print_form";
        }

    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        BaseResult baseResult = null;
        if (StringUtils.isNotBlank(ids)) {
            String[] idArray = ids.split(",");
            tbOrderService.deleteMulti(idArray);
            baseResult = BaseResult.success("删除数据成功！");
        } else {
            baseResult = BaseResult.fail("删除数据失败！");
        }
        return baseResult;
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbOrder
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<TbOrder> page(HttpServletRequest request, TbOrder tbOrder) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        //封装Databases的数据结果
        PageInfo<TbOrder> pageInfo = tbOrderService.page(start, length, draw, tbOrder);
        return pageInfo;
    }

    /**
     * 显示用户详情信息
     *
     * @return
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {
        return "printing/print_detail";
    }

}
