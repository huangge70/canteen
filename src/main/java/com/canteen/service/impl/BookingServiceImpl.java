package com.canteen.service.impl;

import com.canteen.dao.BookingMapper;
import com.canteen.pojo.Booking;
import com.canteen.service.BookingService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingMapper bookingMapper;

    @Override
    public int insert(Booking booking) {
        return bookingMapper.insert(booking);
    }

    @Override
    public PageInfo<Booking> selectAll(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Booking> list=bookingMapper.selectAll();
        PageInfo<Booking> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int updateBookingStatus(Integer id) {
        return bookingMapper.updateBookingStatus(id);
    }

    @Override
    public PageInfo<Booking> selectMyBooking(Integer uid, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Booking> list=bookingMapper.selectMyBooking(uid);
        PageInfo<Booking> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int delete(Integer id) {
        return bookingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageInfo<Booking> selectTakeaway(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Booking> list=bookingMapper.selectTakeaway();
        PageInfo<Booking> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<Booking> selectMyOrder(int uid) {
        return bookingMapper.selectMyOrder(uid);
    }

    @Override
    public Booking selectByPrimarykey(int id) {
        return bookingMapper.selectByPrimaryKey(id);
    }


}
