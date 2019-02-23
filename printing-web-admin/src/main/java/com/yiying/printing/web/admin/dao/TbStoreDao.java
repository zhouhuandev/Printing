package com.yiying.printing.web.admin.dao;

import com.yiying.printing.domain.TbStore;
import com.yiying.printing.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 店铺数据 dao 层控制中心
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:44
 */
@Repository
public interface TbStoreDao {

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
