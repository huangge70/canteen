package com.canteen.dao;

import com.canteen.pojo.Apartment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApartmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Apartment record);

    int insertSelective(Apartment record);

    Apartment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Apartment record);

    int updateByPrimaryKey(Apartment record);
}