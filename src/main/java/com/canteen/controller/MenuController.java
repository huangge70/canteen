package com.canteen.controller;

import com.canteen.pojo.Dish;
import com.canteen.pojo.User;
import com.canteen.service.MenuService;
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

@RequestMapping("/menu")
@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;

   @RequestMapping("/selectAll")
   public String selectMenu(Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<Dish> page = menuService.selectAll(pageNo,pageSize);
        model.addAttribute("pageInfo",page);
        return "admin/menumanagement";
   }

   @RequestMapping("/add")
   public String add(HttpServletRequest request, @RequestParam("file") MultipartFile file, @Valid Dish dish, BindingResult bindingResult, Model model){
       if(bindingResult.hasErrors()){//参数校验错误
           String errormsg=bindingResult.getFieldError().getDefaultMessage();
           model.addAttribute("message",errormsg);
           return "admin/menumanagement";
       }else{//参数校验通过
           String filename=file.getOriginalFilename();
           File destFile = new File("G:\\idea_workspace\\canteen\\src\\main\\resources\\static\\images\\"+filename);
           try {
               file.transferTo(destFile);
           } catch (IOException e) {//图片上传失败
               model.addAttribute("message","上传图片失败！");
               return "admin/menumanagement";
           }
           dish.setPicture(filename);//设置菜品图片名称
           dish.setStatus(1);//设置菜品状态
           int result=menuService.insert(dish);
           if(result==1){
               model.addAttribute("message","新增成功！");
               return "forward:/menu/selectAll";
           } else{//向数据库中插入用户失败
               model.addAttribute("message","新增失败！");
               return "admin/menumanagement";
           }
       }
   }

   @RequestMapping("/delete")
   public String delete(Model model,HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        int result=menuService.delete(id);
        if(result==1){//删除成功的情况
            model.addAttribute("message","删除成功！");
            return "forward:/menu/selectAll";
        }else{//删除失败的情况
            model.addAttribute("message","删除失败！");
            return "admin/menumanagement";
        }
   }

   @RequestMapping("/selectById")
   public String selectById(Model model,HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        Dish dish=menuService.selectById(id);
        model.addAttribute("dish",dish);
        return "admin/updatedish";
   }

   @RequestMapping("/update")
   public String update(Model model,Dish dish){
        System.out.println(dish);
        int result=menuService.update(dish);
        if(result==1){//修改成功
            model.addAttribute("message","修改成功！");
            return "forward:/menu/selectAll";
        }else{
            model.addAttribute("message","修改失败！");
            return "admin/menumanagement";
        }
   }
}
