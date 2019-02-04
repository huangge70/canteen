package com.canteen.dao;

import com.canteen.pojo.Takeaway;

public interface TakeawayMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Takeaway record);

    int insertSelective(Takeaway record);

    Takeaway selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Takeaway record);

    int updateByPrimaryKey(Takeaway record);
}