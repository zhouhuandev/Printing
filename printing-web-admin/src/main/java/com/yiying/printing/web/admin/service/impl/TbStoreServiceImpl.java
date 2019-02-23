package com.yiying.printing.web.admin.service.impl;

import com.yiying.printing.domain.TbStore;
import com.yiying.printing.web.admin.dao.TbStoreDao;
import com.yiying.printing.web.admin.service.TbStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(readOnly = true)
public class TbStoreServiceImpl implements TbStoreService {
    @Autowired
    private TbStoreDao tbStoreDao;

    @Override
    public List<TbStore> selectAll() {
        return tbStoreDao.selectAll();
    }

    @Override
    public TbStore getById(Long id) {
        return tbStoreDao.getById(id);
    }
}
