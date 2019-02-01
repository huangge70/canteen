package com.canteen.service.impl;

import com.canteen.dao.SuggestMapper;
import com.canteen.pojo.Suggest;
import com.canteen.service.SuggestService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SuggestServiceImpl implements SuggestService {
    @Autowired
    private SuggestMapper suggestMapper;

    @Override
    public List<Suggest> selectTop3() {
        return suggestMapper.selectTop3();
    }

    @Override
    public int insert(Suggest suggest) {
        return suggestMapper.insert(suggest);
    }

    @Override
    public PageInfo<Suggest> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Suggest> list=suggestMapper.selectAll();
        PageInfo<Suggest> page=new PageInfo<>(list);
        return page;
    }
}
