package com.controller;

import com.model.Comment;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService  commentService;

    @PostMapping(value = "/addComment.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addComment(Comment comment) {

        return "";
    }

}
