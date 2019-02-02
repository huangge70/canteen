package com.canteen.service.impl;

import com.canteen.dao.DishMapper;
import com.canteen.pojo.Dish;
import com.canteen.service.MenuService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private DishMapper dishMapper;

    @Override
    public PageInfo<Dish> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Dish> list = dishMapper.selectAll();
        //用PageInfo对结果进行包装
        PageInfo<Dish> page = new PageInfo<Dish>(list);
        return page;
    }

    @Override
    public int insert(Dish dish) {
        return dishMapper.insert(dish);
    }

    @Override
    public int delete(Integer id) {
        return dishMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Dish selectById(Integer id) {
        return dishMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Dish dish) {
        return dishMapper.updateByPrimaryKeySelective(dish);
    }

    @Override
    public List<Dish> selectActive() {
        return dishMapper.selectActive();
    }
}
