package com.canteen.service;

import com.canteen.pojo.Dish;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface MenuService {
    PageInfo<Dish> selectAll(int pageNo, int pageSize);

    int insert(Dish dish);

    int delete(Integer id);

    Dish selectById(Integer id);

    int update(Dish dish);

    List<Dish> selectActive();
}
