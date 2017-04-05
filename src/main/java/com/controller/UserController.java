package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Blog;
import com.model.Link;
import com.model.User;
import com.service.BlogService;
import com.service.LinkService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes(names = {"user", "links"})
public class UserController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private LinkService linkService;

    @GetMapping("/login.action")
    public String toLogin() {
        return "/login.jsp";
    }

    @PostMapping(value = "/doLogin.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String doLogin(User user, ModelMap modelMap) {
        try {
            userService.validateLogin(user);
            user = userService.getByName(user);
            modelMap.addAttribute("user", user);
            response.setCode(1);
        } catch (RuntimeException e) {
            response.setMessage(e.getMessage());
        }
        return JSON.toJSONString(response);
    }

    @GetMapping("/register.action")
    public String register() {
        return "/register.jsp";
    }

    @GetMapping("/logout.action")
    public String logout(SessionStatus sessionStatus, HttpSession session) {
        sessionStatus.setComplete();
        session.invalidate();
        return "/login.jsp";
    }

    @PostMapping(value = "/doRegister.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String doRegister(User user, String confirmPassword) {
        if (!user.getPassword().equals(confirmPassword)) {
            response.setMessage("两次密码不正确");
            return JSON.toJSONString(response);
        }
        // 检查用户名是否被占用
        if (userService.validateName(user)) {
            response.setMessage("用户名被占用");
            return JSON.toJSONString(response);
        }
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        userService.save(user);
        response.setCode(1);
        response.setMessage("注册成功");
        return JSON.toJSONString(response);
    }

    @GetMapping(value = "/userIndex.action")
    public String userIndex(ModelMap modelMap) {
        // 查询所有的博客
        List<Blog> blogs = blogService.listAll();
        modelMap.addAttribute("blogs", blogs);

        // 查询超链接
        List<Link> links = linkService.listAll();
        modelMap.addAttribute("links", links);

        // 按评论数量倒序查询博客（top10）
        List<Blog> commentsBlog = blogService.listTopTenOrderByComment();
        modelMap.addAttribute("commentsBlog", commentsBlog);

        return "/user_index.jsp";
    }


    @GetMapping("/back.action")
    public String back() {
        return "/back.jsp";
    }

    @RequestMapping("/profile.action")
    public String profile() {
        return "/profile.jsp";
    }

    @GetMapping("/aboutMe.action")
    public String aboutMe() {
        return "/about.jsp";
    }

    @RequestMapping("/managerAbout.action")
    public String managerAbout(){
        return "/manager_about.jsp";
    }

    @RequestMapping(value = "/updateAbout.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String updateAbout(User user, ModelMap modelMap) {
        User user1 = userService.get(user.getId());
        user1.setAbout(user.getAbout());
        userService.update(user1);
        response.setMessage("更新成功");
        modelMap.addAttribute("user", user1);
        return JSON.toJSONString(response);
    }

}
