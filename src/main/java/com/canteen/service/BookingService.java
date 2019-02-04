package com.canteen.service;

import com.canteen.pojo.Booking;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface BookingService {
    int insert(Booking booking);

    PageInfo<Booking> selectAll(int pageNo,int pageSize);

    int updateBookingStatus(Integer id);

    PageInfo<Booking> selectMyBooking(Integer uid,int pageNo,int pageSize);

    int delete(Integer id);

    PageInfo<Booking> selectTakeaway(int pageNo,int pageSize);
}
