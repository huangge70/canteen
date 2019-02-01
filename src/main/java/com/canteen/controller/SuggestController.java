package com.canteen.controller;

import com.canteen.pojo.Suggest;
import com.canteen.pojo.User;
import com.canteen.service.SuggestService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/suggest")
@Controller
public class SuggestController {
    @Autowired
    private SuggestService suggestService;

    @RequestMapping("/addpage")
    public String addpage(Model model){
        List<Suggest> list=suggestService.selectTop3();
        model.addAttribute("suggests",list);
        return "user/addsuggest";
    }

    @RequestMapping("/add")
    public String add(Suggest suggest, Model model, HttpServletRequest request) throws ParseException {
        User user= (User) request.getSession().getAttribute("user");
        suggest.setUid(user.getId());
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        suggest.setTime(sdf.parse(sdf.format(date)));
        int result=suggestService.insert(suggest);
        if(result==1){//新增成功
            model.addAttribute("message","提交成功！");
            return "forward:/suggest/addpage";
        }else{
            model.addAttribute("message","提交失败！");
            return "forward:/suggest/addpage";
        }
    }

    @RequestMapping("/selectAll")
    public String selectAll(Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Suggest> pageInfo=suggestService.selectAll(pageNo,pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/suggestlist";
    }
}
