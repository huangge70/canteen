package com.canteen.controller;

import com.canteen.pojo.Dish;
import com.canteen.pojo.Result;
import com.canteen.pojo.Vote;
import com.canteen.service.MenuService;
import com.canteen.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/vote")
public class VoteController {
    @Autowired
    private VoteService voteService;
    @Autowired
    private MenuService menuService;

    @RequestMapping("/selectDish")
    public String selectDish(Model model){
        List<Dish> list=voteService.selectActive();
        model.addAttribute("dishes",list);
        return "user/vote";
    }

    @RequestMapping("/vote")
    public String vote(HttpServletRequest request,Model model) throws ParseException {
        String votes[]=request.getParameterValues("vote");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String now=sdf.format(date);
        int result=0;
        for(int i=0;i<votes.length;i++){
            //测试前端传过来的数据
            //System.out.println(votes[i]);
            int did=Integer.parseInt(votes[i]);
            Vote vote=voteService.selectByDidAndDate(did,sdf.parse(now));
            if(vote==null){//说明数据库中还没有该菜品的投票
                Vote newVote=new Vote();
                newVote.setDid(did);
                //根据id查询出对应菜品
                Dish dish=menuService.selectById(did);
                newVote.setDname(dish.getName());
                newVote.setCount(1);
                newVote.setDate(sdf.parse(now));
                result=result+voteService.insert(newVote);
            }else{//该菜品今日投票记录已经存在
                vote.setCount(vote.getCount()+1);
                result+=voteService.update(vote);
            }
        }
        if(result==votes.length){//投票成功
            model.addAttribute("message","投票成功！");
            return "forward:/vote/selectDish";
        }else{
            model.addAttribute("message","投票失败！");
            return "forward:/vote/selectDish";
        }

    }

    @RequestMapping("/selectResult")
    @ResponseBody
    public Map<String,List<Object>> selectResult(Model model){
        //System.out.println("执行了...");
        List<Result> list=voteService.selectResult();
        //System.out.println(list.get(0));
        Map<String,List<Object>> result=new HashMap<>() ;
        List<Object> catogory=new ArrayList<>();
        List<Object> data=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            catogory.add(list.get(i).getDname());
            data.add(list.get(i).getCount());
        }
        result.put("categories",catogory);
        result.put("data",data);
        return result;
    }

    public static void main(String[] args) throws ParseException {
        //测试获取当前系统年月日
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(sdf.format(date));
    }
}
