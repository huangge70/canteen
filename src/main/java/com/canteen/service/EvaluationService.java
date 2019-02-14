package com.canteen.service;

import com.canteen.pojo.Evaluation;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface EvaluationService {
    int insert(Evaluation evaluation);

    PageInfo<Evaluation> selectAll(int pageNo,int pageSize);

    List<Evaluation> selectNew5();
}
