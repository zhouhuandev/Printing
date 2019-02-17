package com.yiying.printing.web.admin.service.impl;

import com.yiying.printing.commons.dto.BaseResult;
import com.yiying.printing.commons.dto.PageInfo;
import com.yiying.printing.commons.validator.BeanValidator;
import com.yiying.printing.domain.TbOrder;
import com.yiying.printing.domain.TbUser;
import com.yiying.printing.web.admin.dao.TbOrderDao;
import com.yiying.printing.web.admin.service.TbOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:51
 */
@Service
@Transactional(readOnly = true)
public class TbOrderServiceImpl implements TbOrderService {

    @Autowired
    private TbOrderDao tbOrderDao;

    /**
     * 保存信息
     *
     * @param tbOrder
     * @return
     */
    @Override
    @Transactional(readOnly = false)
    public BaseResult save(TbOrder tbOrder) {
        String validator = BeanValidator.validator(tbOrder);
        //验证不通过
        if (validator != null) {
            return BaseResult.fail(validator);
        }

        //验证通过
        else {
            tbOrder.setUpdated(new Date());

            //新增
            if (tbOrder.getId() == null) {

                tbOrder.setCreated(new Date());
                tbOrderDao.insert(tbOrder);
            }
            //编辑
            else {

                tbOrder.setCreated(new Date());
                update(tbOrder);
            }

            return BaseResult.success("保存信息成功！");
        }
    }


    /**
     * 查询全部信息
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<TbOrder> selectAll() {
        return tbOrderDao.selectAll();
    }

    /**
     * 删除
     *
     * @param id
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(Long id) {
        tbOrderDao.delete(id);
    }

    /**
     * 通过id查找
     *
     * @param id
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public TbOrder getById(Long id) {
        return tbOrderDao.getById(id);
    }

    /**
     * 更新信息
     *
     * @param tbOrder
     */
    @Override
    @Transactional(readOnly = false)
    public void update(TbOrder tbOrder) {
        tbOrderDao.update(tbOrder);
    }

    /**
     * 批量删除
     *
     * @param idArray
     */
    @Override
    @Transactional(readOnly = false)
    public void deleteMulti(String[] idArray) {
        tbOrderDao.deleteMulti(idArray);
    }

    /**
     * 查询总笔数
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public int count(TbOrder tbOrder) {
        return tbOrderDao.count(tbOrder);
    }


    /**
     * 分页查询
     *
     * @param start
     * @param length
     * @param draw
     * @param tbOrder
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public PageInfo<TbOrder> page(int start, int length, int draw, TbOrder tbOrder) {
        int count = count(tbOrder);

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("length", length);
        //封装分页参数
        map.put("pageParams", tbOrder);

        PageInfo<TbOrder> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(tbOrderDao.page(map));

        return pageInfo;
    }

}