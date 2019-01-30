package com.canteen.dao;

import com.canteen.pojo.Booking;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Booking record);

    int insertSelective(Booking record);

    Booking selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Booking record);

    int updateByPrimaryKey(Booking record);
}