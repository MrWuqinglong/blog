package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Link;
import com.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/link")
public class LinkController extends BaseController {

    @Autowired
    private LinkService linkService;

    @RequestMapping("/addLink.action")
    public String addLink(@RequestParam(name = "id", required = false) Integer id, ModelMap modelMap) {
        if (id == null) {
            return "/add_link.jsp";
        } else {
            Link link = linkService.get(id);
            modelMap.addAttribute("link", link);
        }
        return "/add_link.jsp";
    }

    @RequestMapping(value = "/saveOrUpdateLink.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String saveLink(Link link) {
        if (link.getId() == null) {
            linkService.save(link);
            response.setMessage("保存成功");
        } else {
            Link link1 = linkService.get(link.getId());
            link1.setTitle(link.getTitle());
            link1.setTarget(link.getTarget());
            linkService.update(link1);
            response.setMessage("更新成功");
        }
        response.setCode(1);
        return JSON.toJSONString(response);
    }

    @RequestMapping("/list.action")
    public String list(ModelMap modelMap) {
        List<Link> links = linkService.listAll();
        modelMap.addAttribute("links", links);
        return "/manager_link.jsp";
    }

    @RequestMapping(value = "/delete.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String delete(Link link) {
        link = linkService.get(link.getId());
        linkService.delete(link);
        response.setCode(1);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }

}
