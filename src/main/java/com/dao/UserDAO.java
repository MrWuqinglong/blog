package com.dao;

import com.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO extends BaseDAO<User>{
    public User validateName(User user) {
        String hql = "FROM User WHERE name=?";
        return get(hql, user.getName());
    }
}
