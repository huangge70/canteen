package com.canteen.controller;

import com.canteen.dto.BookingDto;
import com.canteen.pojo.*;
import com.canteen.service.*;
import com.github.pagehelper.PageInfo;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private DetailService detailService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private TakeawayService takeawayService;

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
        if(list==null||list.size()==0){//购物车没有商品
            model.addAttribute("message","您的购物车里没有商品需要结算！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        double totleprice=0;
        for(Detail detail:list){
            totleprice=totleprice+detail.getPrice()*detail.getCount();
        }
        if(totleprice>user.getBalance()){//用户余额不足
            model.addAttribute("message","您的余额不足，请尽快充值！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Booking booking=new Booking();
        booking.setUid(user.getId());
        booking.setCreatetime(sdf.parse(sdf.format(date)));
        booking.setPrice(totleprice);
        booking.setStatus("待处理");
        booking.setUname(user.getUsername());
        booking.setTime(sdf2.parse(sdf.format(date).split(" ")[0]+" "+time));
        int result=bookingService.insert(booking);
        if(result==0){//新增预定订单失败
            model.addAttribute("message","结算失败！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        for(Detail detail:list){
            detail.setOid(booking.getId());
            detail.setType(0);//0表示是预定订单的详情
            detailService.insert(detail);
        }
        user.setBalance(user.getBalance()-totleprice);//修改用户的余额
        userService.updateUser(user);
        request.getSession().removeAttribute("cart");//删除缓存中购物车信息
        model.addAttribute("message","结算成功！");
        return "user/cart";
    }

    @RequestMapping("/takeaway")
    @Transactional
    public String takeaway(String address,double reward,Model model,HttpServletRequest request) throws ParseException {
        User user= (User) request.getSession().getAttribute("user");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
        if(list==null||list.size()==0){//购物车没有商品
            model.addAttribute("message","您的购物车里没有商品需要结算！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        double totleprice=0;
        for(Detail detail:list){
            totleprice=totleprice+detail.getPrice()*detail.getCount();
        }
        if(totleprice>user.getBalance()){//用户余额不足
            model.addAttribute("message","您的余额不足，请尽快充值！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Booking booking=new Booking();
        booking.setUid(user.getId());
        booking.setCreatetime(sdf.parse(sdf.format(date)));
        booking.setPrice(totleprice);
        booking.setStatus("外卖");
        booking.setUname(user.getUsername());
        //booking.setTime(sdf2.parse(sdf.format(date).split(" ")[0]+" "+time));
        int result=bookingService.insert(booking);
        if(result==0){//新增预定订单失败
            model.addAttribute("message","结算失败！");
            model.addAttribute("details",list);
            return "user/cart";
        }
        for(Detail detail:list){
            detail.setOid(booking.getId());
            detail.setType(1);//1表示是外卖订单的详情
            detailService.insert(detail);
        }
        Takeaway takeaway=new Takeaway();
        takeaway.setId(booking.getId());
        if(address==null||address.trim().equals("")){//用户没有输入配送地址，使用默认地址
            takeaway.setAddress(user.getAddress());
        }else{
            takeaway.setAddress(address);
        }
        takeaway.setReward(reward);
        takeaway.setOphone(user.getPhone());
        takeaway.setStatus("待处理");
        takeawayService.insert(takeaway);
        user.setBalance(user.getBalance()-totleprice);//修改用户的余额
        userService.updateUser(user);
        request.getSession().removeAttribute("cart");//删除缓存中购物车信息
        model.addAttribute("message","结算成功！");
        return "user/cart";
    }

//    @RequestMapping("/takeaway")
//    public String takeaway(Model model, HttpServletRequest request, String address,double reward) throws ParseException {
//        System.out.println(address);
//        Order order=new Order();
//        User user= (User) request.getSession().getAttribute("user");
//        order.setOrderer(user.getId());
//        Date date=new Date();
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        order.setCreatetime(sdf.parse(sdf.format(date)));
//        order.setUpdatetime(sdf.parse(sdf.format(date)));
//        double totleprice=0;
//        List<Detail> list= (List<Detail>) request.getSession().getAttribute("cart");
//        if(list==null||list.size()==0){//购物车没有商品
//            model.addAttribute("message","您的购物车里没有商品需要结算！");
//            model.addAttribute("details",list);
//            return "user/cart";
//        }
//        for(Detail detail:list){
//            totleprice=totleprice+detail.getCount()*detail.getPrice();
//        }
//        if(totleprice>user.getBalance()){//用户余额不足
//            model.addAttribute("message","您的余额不足，请尽快充值！");
//            model.addAttribute("details",list);
//            return "user/cart";
//        }
//        order.setPrice(totleprice);
//        order.setStatus("待处理");
//        if(address==null||address.trim().equals("")){//用户没有填写地址，使用默认地址
//            order.setAddress(user.getAddress());
//        }else{
//            order.setAddress(address);
//        }
//        order.setReward(reward);
//        order.setOphone(user.getPhone());
//        System.out.println(order);
//        int result=orderService.insert(order);
//        if(result==0){//新增订单失败
//            model.addAttribute("message","结算失败！");
//            model.addAttribute("details",list);
//            return "user/cart";
//        }
//
//        for(Detail detail:list){
//            detail.setOid(order.getId());
//            detail.setType(1);//0表示是预定订单的详情
//            detailService.insert(detail);
//        }
//        user.setBalance(user.getBalance()-totleprice);//修改用户的余额
//        userService.updateUser(user);
//        request.getSession().removeAttribute("cart");//删除缓存中购物车信息
//        model.addAttribute("message","结算成功！");
//        return "user/cart";
//    }

    @RequestMapping("/showbooking")
    public String showbooking(Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Booking> pageInfo=bookingService.selectAll(pageNo,pageSize);
        List<Booking> list=pageInfo.getList();
        List<BookingDto> resultlist=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Booking booking=list.get(i);

            BookingDto bookingDto=new BookingDto();
            //复制对象的属性到另外一个对象中
            BeanUtils.copyProperties(booking,bookingDto);
            List<Detail> details=detailService.selectBookingDetails(booking.getId());
            bookingDto.setDetails(details);
            resultlist.add(bookingDto);
        }
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("bookings",resultlist);
        return "admin/showbooking";
    }

    @RequestMapping("/showtakeaway")
    public String showtakeaway(Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Booking> pageInfo=bookingService.selectTakeaway(pageNo,pageSize);
        List<Booking> list=pageInfo.getList();
        List<BookingDto> resultlist=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Booking booking=list.get(i);
            Takeaway takeaway=takeawayService.selectById(booking.getId());
            if(takeaway.getStatus().equals("已完成")){
                continue;
            }
            BookingDto bookingDto=new BookingDto();
            //复制对象的属性到另外一个对象中
            BeanUtils.copyProperties(booking,bookingDto);
            List<Detail> details=detailService.selectBookingDetails(booking.getId());
            bookingDto.setDetails(details);
            resultlist.add(bookingDto);
        }
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("bookings",resultlist);
        return "admin/showtakeaway";
    }

    @RequestMapping("/finishbooking")
    public String finishbooking(Model model,Integer id){
        int result=bookingService.updateBookingStatus(id);
        if(result==1){//修改成功
            model.addAttribute("message","修改成功!");
            return "forward:/order/showbooking";
        }else{
            model.addAttribute("message","修改失败!");
            return "forward:/order/showbooking";
        }
    }

    @RequestMapping("/finishtakeaway")
    public String finishtakeaway(Model model,Integer id){
        int result=takeawayService.updateTakeawayStatus(id);
        if(result==1){//修改成功
            model.addAttribute("message","修改成功!");
            return "forward:/order/showtakeaway";
        }else{
            model.addAttribute("message","修改失败!");
            return "forward:/order/showtakeaway";
        }
    }

    @RequestMapping("/showmybooking")
    public String showmybooking(HttpServletRequest request,Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        User user= (User) request.getSession().getAttribute("user");
        int uid=user.getId();
        PageInfo<Booking> pageInfo=bookingService.selectMyBooking(uid,pageNo,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "user/showmybooking";
    }

    @RequestMapping("/deletebooking")
    @Transactional
    public String deletebooking(Model model,Integer id){
        try {
            bookingService.delete(id);
            detailService.deleteBookingDetails(id);
            model.addAttribute("message","取消成功！");
            return "forward:/order/showmybooking";
        }catch (Exception e){
            model.addAttribute("message","取消失败！");
            return "forward:/order/showmybooking";
        }

    }

    @RequestMapping("/showorder")
    public String showorder(Model model,HttpServletRequest request,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        User user= (User) request.getSession().getAttribute("user");
        String address=user.getAddress().split(",")[0]+"%";
        PageInfo<Takeaway> pageInfo=takeawayService.selectByParam(address,pageNo,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "user/showorder";
    }

    @RequestMapping("/receiveorder")
    public String receiveorder(Integer id,Model model,HttpServletRequest request){
        User user= (User) request.getSession().getAttribute("user");
        Takeaway takeaway=takeawayService.selectById(id);
        takeaway.setDelivery(user.getId());
        takeaway.setDphone(user.getPhone());
        takeaway.setStatus("已接单");
        int result=takeawayService.update(takeaway);
        if(result==1){//修改成功
            model.addAttribute("message","接单成功！");
            return "forward:/order/showorder";
        }else{
            model.addAttribute("message","接单失败！");
            return "forward:/order/showorder";
        }
    }
}
