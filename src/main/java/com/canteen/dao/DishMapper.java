package com.canteen.dao;

import com.canteen.pojo.Dish;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DishMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);

    List<Dish> selectAll();

    List<Dish> selectActive();

    List<String> selectDishNameByOrderId(@Param("orderId") List<Integer> orderId);
}