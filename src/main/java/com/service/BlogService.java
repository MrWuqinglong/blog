package com.service;

import com.dao.BaseDAO;
import com.dao.BlogDAO;
import com.model.Blog;
import com.model.Comment;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BlogService extends BaseService<Blog> {

    @Autowired
    private BlogDAO blogDAO;

    @Resource(name = "blogDAO")
    @Override
    public void setDao(BaseDAO<Blog> dao) {
        super.setDao(dao);
    }

    public Blog get(Blog blog) {
        blog = blogDAO.get(blog.getId());
        Hibernate.initialize(blog.getUser());
        Hibernate.initialize(blog.getCategory());
        for (Comment comment : blog.getComments()) {
            Hibernate.initialize(comment);
            Hibernate.initialize(comment.getUser());
        }
        return blog;
    }

    @Override
    public List<Blog> listAll() {
        List<Blog> blogList = super.listAll();
        for (Blog blog : blogList)
            Hibernate.initialize(blog.getCategory());
        return blogList;
    }

    public List<Blog> listTopTenOrderByComment() {
        return blogDAO.listTopTenOrderByComment();
    }
}
