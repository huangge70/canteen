package com.canteen.service.impl;

import com.canteen.dao.DetailMapper;
import com.canteen.pojo.Detail;
import com.canteen.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailServiceImpl implements DetailService {
    @Autowired
    private DetailMapper detailMapper;
    @Override
    public int insert(Detail detail) {
        return detailMapper.insert(detail);
    }
}
