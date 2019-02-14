package com.canteen.controller;

import com.canteen.pojo.Booking;
import com.canteen.pojo.Evaluation;
import com.canteen.pojo.Takeaway;
import com.canteen.pojo.User;
import com.canteen.service.BookingService;
import com.canteen.service.EvaluationService;
import com.canteen.service.TakeawayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PageController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private TakeawayService takeawayService;
    @Autowired
    private EvaluationService evaluationService;

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/admin")
    public String adminindex(HttpServletRequest request){
        //组织页面top部门显示的信息
        //查询未处理的订单(包括预定和外卖订单)
        List<Booking> unresolveList=bookingService.selectUnresolve();
        List<Booking> takeawayList=bookingService.selectAllTakeaway();
        //查询未处理的外卖订单
        for(Booking booking:takeawayList){
            Takeaway takeaway=takeawayService.selectById(booking.getId());
            if(takeaway.getStatus().equals("待处理")){
                unresolveList.add(booking);
            }
        }
        request.getSession().setAttribute("unresolveorder",unresolveList);
        //查询用户评价信息
        List<Evaluation> evaluations=evaluationService.selectNew5();
//        for(Evaluation evaluation:evaluations)
//            System.out.println(evaluation);
        request.getSession().setAttribute("evaluations",evaluations);
        return "admin/index";
    }

    @RequestMapping("/user")
    public String userindex(HttpServletRequest request){
        //设置top部分的信息
        User user= (User) request.getSession().getAttribute("user");
        List<Booking> bookings=bookingService.selectmybooking(user.getId());
        List<Booking> orders=bookingService.selectMyOrder(user.getId());
        for(Booking booking:bookings){
            orders.add(booking);
        }
        request.getSession().setAttribute("myorders",orders);
        return "user/index";
    }

    @RequestMapping("/result")
    public String result(){
        return "admin/result";
    }

    @RequestMapping("/dishcount")
    public String dishcount(){
        return "admin/dishcount";
    }

    @RequestMapping("/salestatistics")
    public String salestatistics(){
        return "admin/salestatistics";
    }

    @RequestMapping("/myerror")
    public String error(){
        return "error";
    }
}
