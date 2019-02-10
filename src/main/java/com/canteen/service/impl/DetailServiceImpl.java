package com.canteen.service.impl;

import com.canteen.dao.DetailMapper;
import com.canteen.pojo.Detail;
import com.canteen.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DetailServiceImpl implements DetailService {
    @Autowired
    private DetailMapper detailMapper;
    @Override
    public int insert(Detail detail) {
        return detailMapper.insert(detail);
    }

    @Override
    public List<Detail> selectBookingDetails(Integer oid) {
        return detailMapper.selectBookingDetails(oid);
    }

    @Override
    public int deleteBookingDetails(Integer oid) {
        return detailMapper.deleteBookingDetails(oid);
    }

    @Override
    public List<Detail> dishcount() {
        return detailMapper.dishcount();
    }
}
