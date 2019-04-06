package com.canteen.controller;

import com.canteen.pojo.Article;
import com.canteen.pojo.User;
import com.canteen.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/selectAll")
    public String selectAll(Model model, @RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Article> page=articleService.selectAll(pageNo,pageSize);
        model.addAttribute("pageInfo",page);
        return "admin/articlemanagement";
    }

    @RequestMapping("/selectAll_user")
    public String selectAll_user(Model model, @RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Article> page=articleService.selectAll(pageNo,pageSize);
        model.addAttribute("pageInfo",page);
        return "user/articlelist";
    }

    @RequestMapping("/delete")
    public String delete(Model model,Integer id){
        int result=articleService.delete(id);
        if(result==1){//删除成功
            model.addAttribute("message","删除成功！");
            return "forward:/article/selectAll";
        }else {//删除失败
            model.addAttribute("message","删除失败！");
            return "forward:/article/selectAll";
        }
    }

    @RequestMapping("/addpage")
    public String addpage(){
        return "admin/addarticle";
    }

    @RequestMapping("/selectById")
    public String selectById(Integer id,Model model){
        Article article=articleService.selectById(id);
        model.addAttribute("article",article);
        return "user/articledetail";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, @RequestParam("file") MultipartFile file,Article article,Model model) throws ParseException {
        String filename=file.getOriginalFilename();
        File destFile = new File("E:\\idea_workspace\\canteen\\src\\main\\resources\\static\\images\\"+filename);
        try {
            file.transferTo(destFile);
        } catch (IOException e) {//图片上传失败
            model.addAttribute("message","上传图片失败！");
            return "admin/addarticle";
        }
        article.setStatus(1);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        article.setTime(sdf.parse(sdf.format(date)));
        article.setPicture(filename);
        int result=articleService.insert(article);
        if(result==1){//新增成功
            model.addAttribute("message","新增成功！");
            return "forward:/article/selectAll";
        }else{//新增失败
            model.addAttribute("message","新增失败！");
            return "admin/addarticle";
        }
    }
}
