package com.service;

import com.dao.BaseDAO;
import com.dao.UserDAO;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService extends BaseService<User> {

    @Autowired
    private UserDAO userDAO;

    @Resource(name = "userDAO")
    @Override
    public void setDao(BaseDAO<User> dao) {
        super.setDao(dao);
    }

    public boolean validateName(User user) {
        User dbUser = userDAO.validateName(user);
        return dbUser != null;
    }

    public void validateLogin(User user) {
        User dbUser = userDAO.validateName(user);
        if (dbUser == null)
            throw new RuntimeException("用户不存在");
        if (!dbUser.getPassword().equals(user.getPassword()))
            throw new RuntimeException("密码不正确");
    }

    public User getByName(User user) {
        return userDAO.validateName(user);
    }
}
