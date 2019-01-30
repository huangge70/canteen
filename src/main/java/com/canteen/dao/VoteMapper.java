package com.canteen.dao;

import com.canteen.pojo.Vote;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VoteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Vote record);

    int insertSelective(Vote record);

    Vote selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Vote record);

    int updateByPrimaryKey(Vote record);
}