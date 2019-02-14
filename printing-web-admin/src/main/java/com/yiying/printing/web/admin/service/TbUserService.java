package com.yiying.printing.web.admin.service;

import com.yiying.printing.commons.dto.BaseResult;
import com.yiying.printing.commons.dto.PageInfo;
import com.yiying.printing.domain.TbUser;

import java.util.List;

/**
 * Service 业务逻辑层
 *
 * @Description: //TODO
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 12:49
 */
public interface TbUserService {
    /**
     * 用户登录
     *
     * @param email
     * @param password
     * @return
     */
    TbUser login(String email, String password);

    /**
     * 查询信息
     *
     * @return
     */
    List<TbUser> selectAll();

    /**
     * 通过id查找
     *
     * @param id
     * @return
     */
    TbUser getById(Long id);

    /**
     * 新增用户
     *
     * @param tbUser
     */
    BaseResult save(TbUser tbUser);

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
    PageInfo<TbUser> page(int start, int length, int draw, TbUser tbUser);

    /**
     * 查询总笔数
     *
     * @return
     */
    int count(TbUser tbUser);
}
