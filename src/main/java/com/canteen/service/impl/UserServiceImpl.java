package com.canteen.service.impl;

import com.canteen.dao.UserMapper;
import com.canteen.pojo.User;
import com.canteen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int insertUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User selectByParam(User user) {
        return userMapper.selectByParam(user);
    }
}
