package com.canteen.service.impl;

import com.canteen.dao.BookingMapper;
import com.canteen.pojo.Booking;
import com.canteen.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingMapper bookingMapper;

    @Override
    public int insert(Booking booking) {
        return bookingMapper.insert(booking);
    }
}
