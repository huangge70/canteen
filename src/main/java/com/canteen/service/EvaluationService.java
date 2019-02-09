package com.canteen.service;

import com.canteen.pojo.Evaluation;
import com.github.pagehelper.PageInfo;

public interface EvaluationService {
    int insert(Evaluation evaluation);

    PageInfo<Evaluation> selectAll(int pageNo,int pageSize);
}
