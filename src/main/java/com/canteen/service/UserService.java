package com.canteen.service;

import com.canteen.pojo.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {
    int insertUser(User user);

    User selectByParam(User user);

    PageInfo<User> selectAll(int pageNo, int pageSize);

    int updateUser(User user);

    User selectById(Integer id);

    List<Integer> selectUserOrder(User user);
}
