package com.canteen.controller;

import com.canteen.pojo.Detail;
import com.canteen.pojo.Salestatistics;
import com.canteen.service.BookingService;
import com.canteen.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/statistics")
@Controller
public class StatisticsController {
    @Autowired
    private DetailService detailService;
    @Autowired
    private BookingService bookingService;

    @RequestMapping("/dishcount")
    @ResponseBody
    public Map<String, List<Object>> dishcount(){
        List<Detail> list=detailService.dishcount();
        //返回给前端的结果集合
        Map<String,List<Object>> result=new HashMap<>() ;
        List<Object> catogory=new ArrayList<>();
        List<Object> data=new ArrayList<>();
        for(Detail detail:list){
            catogory.add(detail.getDish());
            data.add(detail.getCount());
        }
        result.put("categories",catogory);
        result.put("data",data);
        return result;
    }

    @RequestMapping("/salestatistics")
    @ResponseBody
    public Map<String,List<Object>> salestatistics(){
        List<Salestatistics> list=bookingService.salestatistics();
        Map<String,List<Object>> result=new HashMap<>();
        List<Object> catogory=new ArrayList<>();
        List<Object> data=new ArrayList<>();
        for(Salestatistics salestatistics:list){
            catogory.add(salestatistics.getMonth());
            data.add(salestatistics.getSum());
        }
        result.put("categories",catogory);
        result.put("data",data);
        return result;
    }
}
