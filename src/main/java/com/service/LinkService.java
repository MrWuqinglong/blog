package com.service;

import com.dao.BaseDAO;
import com.dao.LinkDAO;
import com.model.Link;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LinkService extends BaseService<Link> {

    @Autowired
    private LinkDAO linkDAO;

    @Resource(name = "linkDAO")
    @Override
    public void setDao(BaseDAO<Link> dao) {
        super.setDao(dao);
    }
}
