package com.canteen.dao;

import com.canteen.pojo.Order;
import com.canteen.pojo.User;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Integer> selectUserOrder(User user);
}