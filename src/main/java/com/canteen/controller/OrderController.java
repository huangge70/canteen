package com.canteen.controller;

import com.canteen.pojo.Booking;
import com.canteen.pojo.Detail;
import com.canteen.pojo.User;
import org.bouncycastle.math.raw.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {
    @RequestMapping("/addcart")
    public String addcart(HttpServletRequest request, Detail detail, Model model){
        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
        if(list==null){//当前还没有购物车
            list=new ArrayList<>();
            list.add(detail);
            request.getSession().setAttribute("cart",list);
            model.addAttribute("message","加入购物车成功！");
            return "forward:/menu/showmenu";
        }else{
            list.add(detail);
            model.addAttribute("message","加入购物车成功！");
            return "forward:/menu/showmenu";
        }
    }

    @RequestMapping("/cart")
    public String cart(Model model,HttpServletRequest request){
        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
        if(list==null||list.size()==0){//购物车为空
            model.addAttribute("message","您的购物车空空如也！");
            return "user/cart";
        }else{
            model.addAttribute("details",list);
            return "user/cart";
        }
    }

    @RequestMapping("/deletecart")
    public String deletecart(Model model,HttpServletRequest request){
        int did=Integer.parseInt(request.getParameter("did"));
        int count=Integer.parseInt(request.getParameter("count"));
        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
        for(int i=0;i<list.size();i++){
            Detail detail=list.get(i);
            if(did==detail.getDid()&&count==detail.getCount()){
                list.remove(i);
                break;
            }
        }
        model.addAttribute("message","删除成功！");
        return "forward:/order/cart";
    }

    @RequestMapping("/booking")
    @Transactional
    public String booking(String time,Model model,HttpServletRequest request) throws ParseException {
        User user= (User) request.getSession().getAttribute("user");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
        double totleprice=0;
        for(Detail detail:list){
            totleprice=totleprice+detail.getPrice()*detail.getCount();
        }
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm");
        Booking booking=new Booking();
        booking.setUid(user.getId());
        booking.setCreatetime(sdf.parse(sdf.format(date)));
        booking.setPrice(totleprice);
        booking.setStatus("待处理");
        booking.setUname(user.getUsername());
        booking.setTime(sdf2.parse(time));
    }
}
