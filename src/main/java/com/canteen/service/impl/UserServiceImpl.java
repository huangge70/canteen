package com.canteen.service.impl;

import com.canteen.dao.OrderMapper;
import com.canteen.dao.UserMapper;
import com.canteen.pojo.Dish;
import com.canteen.pojo.User;
import com.canteen.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int insertUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User selectByParam(User user) {
        return userMapper.selectByParam(user);
    }

    @Override
    public PageInfo<User> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<User> list = userMapper.selectAll();
        //用PageInfo对结果进行包装
        PageInfo<User> page = new PageInfo<User>(list);
        return page;
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public User selectById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Integer> selectUserOrder(User user) {
        return orderMapper.selectUserOrder(user);
    }
}
