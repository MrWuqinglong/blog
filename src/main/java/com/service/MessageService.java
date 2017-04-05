package com.service;

import com.dao.BaseDAO;
import com.dao.MessageDAO;
import com.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MessageService extends BaseService<Message> {

    @Autowired
    private MessageDAO messageDAO;

    @Resource(name = "messageDAO")
    @Override
    public void setDao(BaseDAO<Message> dao) {
        super.setDao(dao);
    }
}
