package com.canteen.service;

import com.canteen.pojo.Takeaway;

public interface TakeawayService {
    int insert(Takeaway takeaway);

    int updateTakeawayStatus(Integer id);
}
