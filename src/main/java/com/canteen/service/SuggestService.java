package com.canteen.service;

import com.canteen.pojo.Suggest;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface SuggestService {
    List<Suggest> selectTop3();

    int insert(Suggest suggest);

    PageInfo<Suggest> selectAll(int pageNo,int pageSize);
}
