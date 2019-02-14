package com.yiying.printing.web.admin.dao;

import com.yiying.printing.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 用户数据 dao 层控制中心
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:44
 */
@Repository
public interface TbUserDao {
    /**
     * 根据邮箱查询用户信息
     *
     * @param eamil
     * @return
     */
    TbUser getByEmail(String eamil);

    /**
     * 查询全部信息
     *
     * @return
     */
    List<TbUser> selectAll();

    /**
     * 添加
     *
     * @param tbUser
     */
    void insert(TbUser tbUser);


    /**
     * 更新信息
     *
     * @param tbUser
     */
    void update(TbUser tbUser);

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
    TbUser getById(Long id);

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
    List<TbUser> page(Map<String, Object> params);

    /**
     * 查询总笔数
     *
     * @return
     */
    int count(TbUser tbUser);
}
