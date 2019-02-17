package com.yiying.printing.web.admin.service;

import com.yiying.printing.commons.dto.BaseResult;
import com.yiying.printing.commons.dto.PageInfo;
import com.yiying.printing.domain.TbOrder;

import java.util.List;

/**
 * Service 业务逻辑层
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:49
 */
public interface TbOrderService {


    /**
     * 查询信息
     *
     * @return
     */
    List<TbOrder> selectAll();

    /**
     * 通过id查找
     *
     * @param id
     * @return
     */
    TbOrder getById(Long id);

    /**
     * 新增
     *
     * @param tbOrder
     */
    BaseResult save(TbOrder tbOrder);

    /**
     * 更新信息
     *
     * @param tbOrder
     */
    void update(TbOrder tbOrder);

    /**
     * 删除
     *
     * @param id
     */
    void delete(Long id);

    /**
     * 批量删除
     *
     * @param idArray
     */
    void deleteMulti(String[] idArray);

    /**
     * 分页查询
     *
     * @param start
     * @param length
     * @return
     */
    PageInfo<TbOrder> page(int start, int length, int draw, TbOrder tbOrder);

    /**
     * 查询总笔数
     *
     * @return
     */
    int count(TbOrder tbOrder);
}
