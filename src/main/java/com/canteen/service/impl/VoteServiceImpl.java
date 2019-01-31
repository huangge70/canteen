package com.canteen.service.impl;

import com.canteen.dao.DishMapper;
import com.canteen.dao.VoteMapper;
import com.canteen.pojo.Dish;
import com.canteen.pojo.Result;
import com.canteen.pojo.Vote;
import com.canteen.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class VoteServiceImpl implements VoteService {
    @Autowired
    private DishMapper dishMapper;
    @Autowired
    private VoteMapper voteMapper;

    @Override
    public List<Dish> selectActive() {
        return dishMapper.selectActive();
    }

    @Override
    public Vote selectByDidAndDate(Integer did, Date date) {
        return null;
    }

    @Override
    public int insert(Vote vote) {
        return voteMapper.insert(vote);
    }

    @Override
    public int update(Vote vote) {
        return voteMapper.updateByPrimaryKeySelective(vote);
    }

    @Override
    public List<Result> selectResult() {
        return voteMapper.selectResult();
    }
}
