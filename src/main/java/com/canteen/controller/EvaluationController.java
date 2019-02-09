package com.canteen.controller;

import com.canteen.pojo.Evaluation;
import com.canteen.service.EvaluationService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/evaluation")
@Controller
public class EvaluationController {
    @Autowired
    private EvaluationService evaluationService;

    @RequestMapping("/showevaluation")
    public String showevaluation(Model model, @RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Evaluation> pageInfo=evaluationService.selectAll(pageNo,pageSize);
        if(pageInfo.getList()==null||pageInfo.getList().size()==0){
            model.addAttribute("message","当前没有评价！");
            return "admin/showevaluation";
        }else {
            model.addAttribute("pageInfo",pageInfo);
            return "admin/showevaluation";
        }
    }
}
