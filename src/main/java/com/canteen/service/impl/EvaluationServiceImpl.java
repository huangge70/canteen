package com.canteen.service.impl;

import com.canteen.dao.EvaluationMapper;
import com.canteen.pojo.Evaluation;
import com.canteen.service.EvaluationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired
    private EvaluationMapper evaluationMapper;
    @Override
    public int insert(Evaluation evaluation) {
        return evaluationMapper.insertSelective(evaluation);
    }

    @Override
    public PageInfo<Evaluation> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Evaluation> list=evaluationMapper.selectAll();
        PageInfo<Evaluation> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<Evaluation> selectNew5() {
        return evaluationMapper.selectNew5();
    }
}
