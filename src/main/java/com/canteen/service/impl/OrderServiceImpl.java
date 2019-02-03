package com.canteen.service.impl;

import com.canteen.dao.OrderMapper;
import com.canteen.pojo.Order;
import com.canteen.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public int insert(Order order) {
        System.out.println("impl层数据："+order);
        return orderMapper.insertSelective(order);
    }
}
