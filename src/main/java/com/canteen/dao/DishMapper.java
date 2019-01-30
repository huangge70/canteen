package com.canteen.dao;

import com.canteen.pojo.Dish;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DishMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);
}