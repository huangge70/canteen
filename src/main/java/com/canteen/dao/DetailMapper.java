package com.canteen.dao;

import com.canteen.pojo.Detail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);

    List<Detail> selectBookingDetails(Integer oid);

    int deleteBookingDetails(Integer oid);

    List<Detail> dishcount();
}