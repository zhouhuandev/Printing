package com.yiying.printing.web.admin.web.controller;

import com.yiying.printing.domain.TbStore;
import com.yiying.printing.web.admin.service.TbStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 店铺控制器
 * @Title:StoreController
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/2/23 14:17
 */
@Controller
@RequestMapping(value = "store")
public class StoreController {

    @Autowired
    private TbStoreService tbStoreService;

    @ModelAttribute
    public TbStore getTbStore(Long id) {
        TbStore tbStore = null;

        //id不为空，则从数据库中获取
        if (id != null) {
            tbStore = tbStoreService.getById(id);
        }
        //否则创建新的对象,绑定到页面
        else {
            tbStore = new TbStore();
        }
        return tbStore;
    }
    /**
     * 打开 莫泰对话框 里面装载 store.jsp
     *
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String store(Model model) {
        List<TbStore> tbStores = tbStoreService.selectAll();
        model.addAttribute("tbStores",tbStores);
        return "printing/print_store";
    }

    /**
     * 显示店铺详情信息
     *
     * @return
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {
        return "printing/print_store_detail";
    }
}
