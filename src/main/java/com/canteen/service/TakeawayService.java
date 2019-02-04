package com.canteen.service;

import com.canteen.pojo.Takeaway;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TakeawayService {
    int insert(Takeaway takeaway);

    int updateTakeawayStatus(Integer id);

    Takeaway selectById(Integer id);

    PageInfo<Takeaway> selectByParam(String address, int pageNo, int pageSize);

    int update(Takeaway takeaway);
}
