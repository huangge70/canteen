package com.canteen.dao;

import com.canteen.pojo.Evaluation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EvaluationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Evaluation record);

    int insertSelective(Evaluation record);

    Evaluation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Evaluation record);

    int updateByPrimaryKey(Evaluation record);
}