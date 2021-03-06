package com.canteen.service;

import com.canteen.pojo.Booking;
import com.canteen.pojo.Salestatistics;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface BookingService {
    int insert(Booking booking);

    PageInfo<Booking> selectAll(int pageNo,int pageSize);

    int updateBookingStatus(Integer id);

    PageInfo<Booking> selectMyBooking(Integer uid,int pageNo,int pageSize);

    List<Booking> selectmybooking(Integer uid);

    int delete(Integer id);

    PageInfo<Booking> selectTakeaway(int pageNo,int pageSize);

    List<Booking> selectMyOrder(int uid);

    Booking selectByPrimarykey(int id);

    int update(Booking booking);

    List<Salestatistics> salestatistics();

    List<Booking> selectUnresolve();

    List<Booking> selectAllTakeaway();
}
