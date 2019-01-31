package com.canteen.service;

import com.canteen.pojo.Dish;
import com.canteen.pojo.Result;
import com.canteen.pojo.Vote;

import java.util.Date;
import java.util.List;

public interface VoteService {
    List<Dish> selectActive();

    Vote selectByDidAndDate(Integer did, Date date);

    int insert(Vote vote);

    int update(Vote vote);

    List<Result> selectResult();
}
