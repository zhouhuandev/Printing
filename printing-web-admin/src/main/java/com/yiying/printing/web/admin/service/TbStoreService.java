package com.yiying.printing.web.admin.service;

import com.yiying.printing.domain.TbStore;

import java.util.List;

/**
 * Service 业务逻辑层
 * @Title:TbStoreService
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/2/23 14:35
 */
public interface TbStoreService {
    /**
     * 查询全部信息
     *
     * @return
     */
    List<TbStore> selectAll();

    /**
     * 通过id获取店铺信息
     *
     * @param id
     * @return
     */
    TbStore getById(Long id);
}
