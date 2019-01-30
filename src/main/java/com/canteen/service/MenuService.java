package com.canteen.service;

import com.canteen.pojo.Dish;

import java.util.List;

public interface MenuService {
    List<Dish> selectAll();

    int insert(Dish dish);

    int delete(Integer id);

    Dish selectById(Integer id);

    int update(Dish dish);
}
