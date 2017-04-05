package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

    @Autowired
    private MessageService messageService;

    @PostMapping(value = "/addMessage.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addMessage(Message message) {
        messageService.save(message);
        response.setCode(1);
        response.setMessage("留言成功");
        return JSON.toJSONString(response);
    }

    @GetMapping("/message.action")
    public String message() {
        return "/leave_msg.jsp";
    }

    @RequestMapping("/list.action")
    public String list(ModelMap modelMap) {
        List<Message> messages = messageService.listAll();
        modelMap.addAttribute("message", messages);
        return "/manager_message.jsp";
    }

    @RequestMapping(value = "/delete.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String delete(Message message){
        message = messageService.get(message.getId());
        messageService.delete(message);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }

}
