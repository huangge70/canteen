package com.canteen.service.impl;

import com.canteen.dao.TakeawayMapper;
import com.canteen.pojo.Takeaway;
import com.canteen.service.TakeawayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TakeawayServiceImpl implements TakeawayService {
    @Autowired
    private TakeawayMapper takeawayMapper;

    @Override
    public int insert(Takeaway takeaway) {
        return takeawayMapper.insertSelective(takeaway);
    }
}
