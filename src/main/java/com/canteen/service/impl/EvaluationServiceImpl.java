package com.canteen.service.impl;

import com.canteen.dao.EvaluationMapper;
import com.canteen.pojo.Evaluation;
import com.canteen.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired
    private EvaluationMapper evaluationMapper;
    @Override
    public int insert(Evaluation evaluation) {
        return evaluationMapper.insertSelective(evaluation);
    }
}
