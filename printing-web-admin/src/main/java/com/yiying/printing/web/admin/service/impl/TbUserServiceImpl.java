package com.yiying.printing.web.admin.service.impl;

import com.yiying.printing.commons.dto.BaseResult;
import com.yiying.printing.commons.dto.PageInfo;
import com.yiying.printing.commons.validator.BeanValidator;
import com.yiying.printing.domain.TbUser;
import com.yiying.printing.web.admin.dao.TbUserDao;
import com.yiying.printing.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

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
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserDao tbUserDao;

    /**
     * 保存用户信息
     *
     * @param tbUser
     * @return
     */
    @Override
    @Transactional(readOnly = false)
    public BaseResult save(TbUser tbUser) {
        String validator = BeanValidator.validator(tbUser);
        //验证不通过
        if (validator != null) {
            return BaseResult.fail(validator);
        }

        //验证通过
        else {
            tbUser.setUpdated(new Date());

            //新增用户
            if (tbUser.getId() == null) {
                //密码需要加密
                tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
                tbUser.setCreated(new Date());
                tbUserDao.insert(tbUser);
            }
            //编辑用户
            else {
                update(tbUser);
            }

            return BaseResult.success("保存用户信息成功！");
        }
    }

    /**
     * 登录
     *
     * @param email
     * @param password
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public TbUser login(String email, String password) {
        TbUser tbUser = tbUserDao.getByEmail(email);
        if (tbUser != null) {
            // 明文密码加密
            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());

            // 判断加密后的密码是否和数据库中的密码是否匹配，匹配则表示允许登录
            if (md5Password.equals(tbUser.getPassword())) {
                return tbUser;
            }
        }

        return null;
    }

    /**
     * 查询全部信息
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<TbUser> selectAll() {
        return tbUserDao.selectAll();
    }

    /**
     * 删除
     *
     * @param id
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(Long id) {
        tbUserDao.delete(id);
    }

    /**
     * 通过id查找
     *
     * @param id
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public TbUser getById(Long id) {
        return tbUserDao.getById(id);
    }

    /**
     * 更新信息
     *
     * @param tbUser
     */
    @Override
    @Transactional(readOnly = false)
    public void update(TbUser tbUser) {
        tbUserDao.update(tbUser);
    }

    /**
     * 批量删除
     *
     * @param idArray
     */
    @Override
    @Transactional(readOnly = false)
    public void deleteMulti(String[] idArray) {
        tbUserDao.deleteMulti(idArray);
    }

    /**
     * 查询总笔数
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public int count(TbUser tbUser) {
        return tbUserDao.count(tbUser);
    }


    /**
     * 分页查询
     *
     * @param start
     * @param length
     * @param draw
     * @param tbUser
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public PageInfo<TbUser> page(int start, int length, int draw, TbUser tbUser) {
        int count = count(tbUser);

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("length", length);
        //封装分页参数
        map.put("pageParams", tbUser);

        PageInfo<TbUser> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(tbUserDao.page(map));

        return pageInfo;
    }

}