package com.yiying.printing.web.admin.dao;

import com.yiying.printing.domain.TbOrder;
import com.yiying.printing.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 打印记录数据 dao 层控制中心
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:44
 */
@Repository
public interface TbOrderDao {


    /**
     * 查询全部信息
     *
     * @return
     */
    List<TbOrder> selectAll();

    /**
     * 添加
     *
     * @param tbOrder
     */
    void insert(TbOrder tbOrder);


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
     * 通过id获取用户信息
     *
     * @param id
     * @return
     */
    TbOrder getById(Long id);

    /**
     * 批量删除
     *
     * @param idArray
     */
    void deleteMulti(String[] idArray);

    /**
     * 分页查询
     *
     * @param params，需要两个参数，start/记录开始的位置，length/每页记录数
     * @return
     */
    List<TbOrder> page(Map<String, Object> params);

    /**
     * 查询总笔数
     *
     * @param tbOrder
     * @return
     */
    int count(TbOrder tbOrder);
}
