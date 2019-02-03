package com.canteen.dto;

import com.canteen.pojo.Booking;
import com.canteen.pojo.Detail;

import java.util.List;

public class BookingDto extends Booking {
    private List<Detail> details;

    public List<Detail> getDetails() {
        return details;
    }

    public void setDetails(List<Detail> details) {
        this.details = details;
    }
}
