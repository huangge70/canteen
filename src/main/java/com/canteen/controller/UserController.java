package com.canteen.controller;

import com.canteen.pojo.User;
import com.canteen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register(HttpServletRequest request, @RequestParam("file") MultipartFile file, @Valid User user, BindingResult bindingResult, Model model){

        if(bindingResult.hasErrors()){//参数校验错误
            String errormsg=bindingResult.getFieldError().getDefaultMessage();
            model.addAttribute("message",errormsg);
            return "index";
        }else{//参数校验通过
            String filename=file.getOriginalFilename();
            String classpath=request.getServletContext().getRealPath("/");
            System.out.println(classpath+"static/images/"+filename);
            File destFile = new File(classpath+"WEB-INF\\images\\"+filename);
            try {
                file.transferTo(destFile);
            } catch (IOException e) {//图片上传失败
                model.addAttribute("message","上传头像失败！");
                return "index";
            }
            user.setAvatar(filename);//设置用户头像图片名
            user.setRole(1);//设置用户角色为普通用户
            user.setStatus(0);//设置用户状态为不可用
            int result=userService.insertUser(user);
            if(result==1){
                model.addAttribute("message","注册成功，请等待管理员审核！");
                return "index";
            } else{//向数据库中插入用户失败
                model.addAttribute("message","注册失败！");
                return "index";
            }
        }
    }

    @RequestMapping("/login")
    public String login(User user,Model model,HttpServletRequest request){
        if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword())){//如果用户名或者密码为空，返回错误信息
            model.addAttribute("message","请正确输入用户名密码！");
            return "index";
        }
        User selUser=userService.selectByParam(user);
       if(selUser==null){//没有在数据库中查询到用户
           model.addAttribute("message","用户名或密码错误，请稍后重试！");
           return "index";
       }
       if(user.getRole()==0){//正在登录的用户类型为管理员的情况
            request.getSession().setAttribute("admin",selUser);
            return "admin/index";
       }else{//正在登录的用户类型为普通用户的情况
            if(selUser.getStatus()==0){//用户还未审核通过
                model.addAttribute("message","您没有登录权限！");
                return "index";
            }else{
                request.getSession().setAttribute("user",selUser);
                return "user/index";
            }
       }
    }

    @RequestMapping("adminLogout")
    public String adminLogout(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "index";
    }

    @RequestMapping("userLogout")
    public String userLogout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "index";
    }

    public static void main(String[] args){
        System.out.println(StringUtils.isEmpty(""));
    }
}
