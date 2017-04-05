package com.service;

import com.model.Blog;
import com.system.config.spring.RootConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by 吴庆龙
 * 2017/4/4 14:37
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RootConfig.class)
public class BlogServiceTest {

    @Autowired
    private BlogService blogService;

    @Test
    public void listTopTenOrderByComment() throws Exception {
        List<Blog> list = blogService.listTopTenOrderByComment();
        for (Blog blog : list)
            System.out.println(blog.getId());
    }

}