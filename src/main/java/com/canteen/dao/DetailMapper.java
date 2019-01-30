package com.canteen.dao;

import com.canteen.pojo.Detail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);
}