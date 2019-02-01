package com.canteen.dao;

import com.canteen.pojo.Suggest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SuggestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Suggest record);

    int insertSelective(Suggest record);

    Suggest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Suggest record);

    int updateByPrimaryKey(Suggest record);

    List<Suggest> selectTop3();

    List<Suggest> selectAll();
}