package com.canteen.service.impl;

import com.canteen.dao.TakeawayMapper;
import com.canteen.pojo.Takeaway;
import com.canteen.service.TakeawayService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TakeawayServiceImpl implements TakeawayService {
    @Autowired
    private TakeawayMapper takeawayMapper;

    @Override
    public int insert(Takeaway takeaway) {
        return takeawayMapper.insertSelective(takeaway);
    }

    @Override
    public int updateTakeawayStatus(Integer id) {
        return takeawayMapper.updateTakeawayStatus(id);
    }

    @Override
    public Takeaway selectById(Integer id) {
        return takeawayMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Takeaway> selectByParam(String address,int pageNo,int pageSize,String ophone) {
        PageHelper.startPage(pageNo,pageSize);
        List<Takeaway> list= takeawayMapper.selectByParam(address,ophone);
        PageInfo<Takeaway> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int update(Takeaway takeaway) {
        return takeawayMapper.updateByPrimaryKeySelective(takeaway);
    }

    @Override
    public List<Takeaway> selectByDelivery(int uid) {
        return takeawayMapper.selectByDelivery(uid);
    }

    @Override
    public int delete(Integer id) {
        return takeawayMapper.deleteByPrimaryKey(id);
    }
}
