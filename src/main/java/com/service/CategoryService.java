package com.service;

import com.dao.BaseDAO;
import com.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CategoryService extends BaseService<Category> {

    @Autowired
    private CategoryService categoryDAO;

    @Resource(name = "categoryDAO")
    @Override
    public void setDao(BaseDAO<Category> dao) {
        super.setDao(dao);
    }
}
