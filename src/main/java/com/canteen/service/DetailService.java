package com.canteen.service;

import com.canteen.pojo.Detail;

import java.util.List;

public interface DetailService {
    int insert(Detail detail);

    List<Detail> selectBookingDetails(Integer oid);

    int deleteBookingDetails(Integer oid);
}
