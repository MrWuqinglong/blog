package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Blog;
import com.model.Category;
import com.model.User;
import com.service.BlogService;
import com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/blog")
@SessionAttributes(names = {"user"})
public class BlogController extends BaseController {

    @Autowired
    private BlogService blogService;
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping("/blogDetail.action")
    public String blogDetail(Blog blog, ModelMap modelMap) {
        blog = blogService.get(blog);
        modelMap.addAttribute("blog", blog);
        return "/blog_detail.jsp";
    }

    @RequestMapping("/write.action")
    public String write(@RequestParam(name = "id", required = false) Integer id, ModelMap modelMap) {

        List<Category> categories = categoryService.listAll();
        modelMap.addAttribute("categories", categories);

        if (id == null) {
            return "/write_blog.jsp";
        } else {
            Blog blog = blogService.get(id);
            modelMap.addAttribute("blog", blog);
        }
        return "/write_blog.jsp";
    }

    @RequestMapping(value = "/saveOrUpdateBlog.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String saveOrUpdate(Blog blog, ModelMap modelMap) {
        if (blog.getId() == null){
            User user = (User) modelMap.get("user");
            blog.setCreateTime(new Timestamp(System.currentTimeMillis()));
            blog.setUser(user);
            blogService.save(blog);
            response.setMessage("保存成功");
        } else {

            Blog blog1 = blogService.get(blog.getId());
            blog1.setCategory(blog.getCategory());
            blog1.setContent(blog.getContent());
            blog1.setTitle(blog.getTitle());
            blogService.update(blog1);
            response.setMessage("更新成功");
        }
        response.setCode(1);
        return JSON.toJSONString(response);
    }

    @RequestMapping("/list.action")
    public String list(ModelMap modelMap) {
        List<Blog> blogList = blogService.listAll();
        modelMap.addAttribute("blogList", blogList);
        return "/manager_blog.jsp";
    }

    @RequestMapping(value = "/delete.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String delete(Blog blog) {
        blog = blogService.get(blog.getId());
        blogService.delete(blog);
        response.setCode(1);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }

}
