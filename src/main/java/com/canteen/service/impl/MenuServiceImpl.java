package com.canteen.service.impl;

import com.canteen.dao.DishMapper;
import com.canteen.pojo.Dish;
import com.canteen.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private DishMapper dishMapper;

    @Override
    public List<Dish> selectAll() {
        return dishMapper.selectAll();
    }

    @Override
    public int insert(Dish dish) {
        return dishMapper.insert(dish);
    }

    @Override
    public int delete(Integer id) {
        return dishMapper.deleteByPrimaryKey(id);
    }
}
