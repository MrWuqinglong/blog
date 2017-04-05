package com.service;

import com.dao.BaseDAO;
import com.dao.CommentDAO;
import com.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CommentService extends BaseService<Comment> {

    @Autowired
    private CommentDAO commentDAO;

    @Resource(name = "commentDAO")
    @Override
    public void setDao(BaseDAO<Comment> dao) {
        super.setDao(dao);
    }
}
