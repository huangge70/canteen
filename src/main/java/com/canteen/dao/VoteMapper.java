package com.canteen.dao;

import com.canteen.pojo.Result;
import com.canteen.pojo.Vote;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface VoteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Vote record);

    int insertSelective(Vote record);

    Vote selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Vote record);

    int updateByPrimaryKey(Vote record);

    Vote selectByDidAndDate(@Param("did") Integer did,@Param("date") Date date);

    List<Result> selectResult();
}