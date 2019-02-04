package com.canteen.dao;

import com.canteen.pojo.Takeaway;

import java.util.List;

public interface TakeawayMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Takeaway record);

    int insertSelective(Takeaway record);

    Takeaway selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Takeaway record);

    int updateByPrimaryKey(Takeaway record);

    int updateTakeawayStatus(Integer id);

    List<Takeaway> selectByParam(String address);
}