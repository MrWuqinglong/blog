package com.dao;

import com.model.Blog;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BlogDAO extends BaseDAO<Blog> {
    public List<Blog> listTopTenOrderByComment() {
        String sql = "SELECT b.* FROM " +
                "(SELECT blog_id FROM comment GROUP BY blog_id ORDER BY COUNT(blog_id) LIMIT 10) t " +
                "LEFT JOIN blog b ON b.id = t.blog_id";
        NativeQuery<Blog> nativeQuery = getSession().createNativeQuery(sql, Blog.class);
        return nativeQuery.list();
    }
}
