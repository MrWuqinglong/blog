package com.system;

import com.model.*;
import com.service.*;
import com.system.config.spring.RootConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;

/**
 * Created by 吴庆龙
 * 2017/4/4 11:28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RootConfig.class)
public class InitDB {

    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private LinkService linkService;
    @Autowired
    private MessageService messageService;

    @Test
    public void generateTable(){}

    @Test
    public void initData() {

        User user = new User();
        user.setName("Tom");
        user.setPassword("tom");
        user.setSex("男");
        user.setMobile("12345678910");
        user.setBirthDay(new Timestamp(System.currentTimeMillis()));
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        user.setAbout("我的个人简介还没有填写内容呢......");
        user.setCurrentTown("山东济南");
        userService.save(user);

        Category category1 = new Category();
        category1.setName("Java");
        Category category2 = new Category();
        category2.setName("MySQL");
        Category category3 = new Category();
        category3.setName("Spring");
        Category category4 = new Category();
        category4.setName("Hibernate");
        categoryService.save(category1);
        categoryService.save(category2);
        categoryService.save(category3);
        categoryService.save(category4);

        Link link1 = new Link();
        link1.setTitle("微信小程序支付简单小结与梳理");
        link1.setTarget("http://www.cnblogs.com/catcher1994/p/6664404.html");
        Link link2 = new Link();
        link2.setTitle("我的数据库设计实践（一）");
        link2.setTarget("http://www.cnblogs.com/rinson/p/6660313.html");
        Link link3 = new Link();
        link3.setTitle("小球的问题 - 长时间的周期运动发生误差");
        link3.setTarget("http://www.cnblogs.com/qianniaoyu/p/6666804.html");
        Link link4 = new Link();
        link4.setTitle("C++实现动态顺序表");
        link4.setTarget("http://www.cnblogs.com/33debug/p/6664281.html");
        Link link5 = new Link();
        link5.setTitle("Git基本操作");
        link5.setTarget("http://www.cnblogs.com/xiaohuochai/p/6654374.html");
        linkService.save(link1);
        linkService.save(link2);
        linkService.save(link3);
        linkService.save(link4);
        linkService.save(link5);

        Message message1 = new Message();
        message1.setName("张三");
        message1.setEmail("zhangsan@qq.com");
        message1.setContent("张三的留言内容");
        Message message2 = new Message();
        message2.setName("李四");
        message2.setEmail("lisi@qq.com");
        message2.setContent("李四的留言内容");
        Message message3 = new Message();
        message3.setName("王五");
        message3.setEmail("wangwu@qq.com");
        message3.setContent("王五的留言内容");
        Message message4 = new Message();
        message4.setName("赵六");
        message4.setEmail("zhaoliu@qq.com");
        message4.setContent("赵六的留言内容");
        Message message5 = new Message();
        message5.setName("老四");
        message5.setEmail("laosi@qq.com");
        message5.setContent("老四的留言内容");
        messageService.save(message1);
        messageService.save(message2);
        messageService.save(message3);
        messageService.save(message4);
        messageService.save(message5);

        Blog blog1= new Blog();
        blog1.setTitle("毕业论文111");
        blog1.setContent("毕业论文内容111");
        blog1.setCategory(category1);
        blog1.setUser(user);
        blog1.setCreateTime(new Timestamp(System.currentTimeMillis()));
        Blog blog2= new Blog();
        blog2.setTitle("毕业论文222");
        blog2.setContent("毕业论文内容222");
        blog2.setCategory(category1);
        blog2.setUser(user);
        blog2.setCreateTime(new Timestamp(System.currentTimeMillis()));
        blogService.save(blog1);
        blogService.save(blog2);

        Comment comment1 = new Comment();
        comment1.setBlog(blog1);
        comment1.setContent("博文内容评论");
        comment1.setCreateTime(new Timestamp(System.currentTimeMillis()));
        comment1.setUser(user);
        Comment comment2 = new Comment();
        comment2.setBlog(blog1);
        comment2.setContent("博文内容评论");
        comment2.setCreateTime(new Timestamp(System.currentTimeMillis()));
        comment2.setUser(user);
        Comment comment3= new Comment();
        comment3.setBlog(blog2);
        comment3.setContent("博文内容评论");
        comment3.setCreateTime(new Timestamp(System.currentTimeMillis()));
        comment3.setUser(user);
        commentService.save(comment1);
        commentService.save(comment2);
        commentService.save(comment3);


    }


}
