package com.canteen.controller;

import com.canteen.pojo.Dish;
import com.canteen.pojo.User;
import com.canteen.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClients;
import org.apache.http.message.BasicNameValuePair;
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
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    //测试工具类中自带的md5加密算法
    public static void main(String[] args) {
        String password="123456";
        String encodePass= DigestUtils.md5Hex(password);
        System.out.print(encodePass);
    }

    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        return "注册成功！";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request, @RequestParam("file") MultipartFile file, @Valid User user, BindingResult bindingResult, Model model){

        if(bindingResult.hasErrors()){//参数校验错误
            String errormsg=bindingResult.getFieldError().getDefaultMessage();
            model.addAttribute("message",errormsg);
            return "index";
        }else{//参数校验通过
            String filename=file.getOriginalFilename();
            //todo:注意修改头像上传的地址
            File destFile = new File("E:\\idea_workspace\\canteen\\src\\main\\resources\\static\\images\\"+filename);
            try {
                file.transferTo(destFile);
            } catch (IOException e) {//图片上传失败
                model.addAttribute("message","上传头像失败！");
                return "index";
            }
            user.setPassword(DigestUtils.md5Hex(user.getPassword()));
            user.setAvatar(filename);//设置用户头像图片名
            user.setRole(1);//设置用户角色为普通用户
            user.setStatus(0);//设置用户状态为不可用
            user.setBalance(0d);//设置用户初始余额为0
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
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        User selUser=userService.selectByParam(user);
        //System.out.println(selUser.toString());
       if(selUser==null){//没有在数据库中查询到用户
           model.addAttribute("message","用户名或密码错误，请稍后重试！");
           return "index";
       }
       if(user.getRole()==0){//正在登录的用户类型为管理员的情况
            request.getSession().setAttribute("admin",selUser);
            //return "admin/index";
            return "forward:/admin";
       }else{//正在登录的用户类型为普通用户的情况
            if(selUser.getStatus()==0){//用户还未审核通过
                model.addAttribute("message","您没有登录权限！");
                return "index";
            }else{
                request.getSession().setAttribute("user",selUser);
                //return "user/index";
                return "forward:/user";
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

    @RequestMapping("/selectAll")
    public String selectAll(Model model,@RequestParam(value="pageNo",defaultValue="1")int pageNo, @RequestParam(value="pageSize",defaultValue="5")int pageSize){
        PageInfo<User> page = userService.selectAll(pageNo,pageSize);
        model.addAttribute("pageInfo",page);
        return "admin/usermanagement";
    }

    @RequestMapping("/disableuser")
    public String disableuser(Integer id,Model model){
        User user=new User();
        user.setId(id);
        user.setStatus(0);
        int result=userService.updateUser(user);
        if(result==1){//修改成功
            model.addAttribute("message","修改成功！");
            return "forward:/user/selectAll";
        }else{//修改失败
            model.addAttribute("message","修改失败！");
            return "admin/usermanagement";
        }
    }

    //短信服务请求的url地址
    public static String requestUrl="http://api.feige.ee/SmsService/Send";

    @RequestMapping("/enableuser")
    public String enableuser(Integer id,Model model){
        User user=new User();
        user.setId(id);
        user.setStatus(1);
        int result=userService.updateUser(user);
        //查询出来id对应的用户
        User currentUser=userService.selectById(id);
        if(result==1){//修改成功

            //调用第三方提供的短信服务
            try {
                List<NameValuePair> formparams = new ArrayList<NameValuePair>();
                formparams.add(new BasicNameValuePair("Account","17801093123"));
                formparams.add(new BasicNameValuePair("Pwd","96ffa3720515a770dca8b2c97"));
                formparams.add(new BasicNameValuePair("Content","您提交的个人信息已经被管理员审核通过，您已经被授予登录系统的权限。"));
                formparams.add(new BasicNameValuePair("Mobile",currentUser.getPhone()));
                formparams.add(new BasicNameValuePair("SignId","97250"));
                Post(formparams);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            model.addAttribute("message","修改成功！");
            return "forward:/user/selectAll";
        }else{//修改失败
            model.addAttribute("message","修改失败！");
            return "admin/usermanagement";
        }
    }

    //向提供短信服务的url发送post请求
    public static void Post( List<NameValuePair> formparams) throws Exception {
        CloseableHttpAsyncClient httpClient = HttpAsyncClients.createDefault();

        httpClient.start();

        HttpPost requestPost=new HttpPost(requestUrl);

        requestPost.setEntity(new UrlEncodedFormEntity(formparams,"utf-8"));

        httpClient.execute(requestPost, new FutureCallback<HttpResponse>() {

            public void failed(Exception arg0) {

                System.out.println("Exception: " + arg0.getMessage());
            }

            public void completed(HttpResponse arg0) {
                System.out.println("Response: " + arg0.getStatusLine());
                try {

                    InputStream stram= arg0.getEntity().getContent();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(stram));
                    System.out.println(	reader.readLine());

                } catch (UnsupportedOperationException e) {

                    e.printStackTrace();
                } catch (IOException e) {

                    e.printStackTrace();
                }

            }

            public void cancelled() {
                // TODO Auto-generated method stub
            }
        }).get();
        System.out.println("Done");
    }

    @RequestMapping("/selectById")
    public String selectById(){
        return "user/personal";
    }

    @RequestMapping("/update")
    public String update(User user,Model model,HttpServletRequest request){
        user.setUsername(user.getUsername().split(",")[0]);
        System.out.println(user.getUsername());
        int result=userService.updateUser(user);
        if(result==1){//修改成功
            User sessionUser= (User) request.getSession().getAttribute("user");
            sessionUser.setPassword(user.getPassword());
            sessionUser.setRealname(user.getRealname());
            sessionUser.setPhone(user.getPhone());
            sessionUser.setAddress(user.getAddress());
            model.addAttribute("message","修改成功！");
            return "user/personal";
        }else{//修改失败
            model.addAttribute("message","修改失败！");
            return "user/personal";
        }
    }

    @RequestMapping("/recharge")
    public String recharge(Model model,HttpServletRequest request){
        try {
            double balance=Double.parseDouble(request.getParameter("balance"));
            User user= (User) request.getSession().getAttribute("user");
            double oldBalance=user.getBalance();
            user.setBalance(user.getBalance()+balance);
            int result=userService.updateUser(user);
            if(result==1){//充值成功
                model.addAttribute("message","充值成功！");
                return "user/personal";
            }else{//充值失败
                user.setBalance(oldBalance);
                model.addAttribute("message","充值失败！");
                return "user/personal";
            }
        }catch (Exception e){//当类型转换出现异常的情况，也就是用户充值时输入的金额类型不正确
            model.addAttribute("message","请正确输入金额！");
            return "user/personal";
        }

    }


}
