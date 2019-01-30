package com.canteen.service;

import com.canteen.pojo.User;

public interface UserService {
    int insertUser(User user);
    User selectByParam(User user);
}
