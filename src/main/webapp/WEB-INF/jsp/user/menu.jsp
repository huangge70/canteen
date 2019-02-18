<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
    <body>
    <div class="sidebar">
        <div class="scrollbar-inner sidebar-wrapper">
            <div class="user">
                <div class="photo">

                    <img src="/static/images/keai.jpg">

                </div>
                <div class="info">
                    <a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									${user.username}
									<span class="user-level">User</span>
									<span class="caret"></span>
								</span>
                    </a>
                    <div class="clearfix"></div>
                </div>
            </div>
            <ul class="nav">
                <li class="nav-item">
                    <a href="/vote/selectDish">
                        <i class="la la-dashboard"></i>
                        <p>菜品投票</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/article/selectAll_user">
                        <i class="la la-table"></i>
                        <p>查看推送文章</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/suggest/addpage">
                        <i class="la la-keyboard-o"></i>
                        <p>意见反馈</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/menu/showmenu">
                        <i class="la la-th"></i>
                        <p>点餐</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/order/cart">
                        <i class="la la-bell"></i>
                        <p>我的购物车</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/order/showmybooking">
                        <i class="la la-font"></i>
                        <p>我的预定</p>
                        <span class="badge badge-danger">${mybookingcount}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/order/showorder">
                        <i class="la la-fonticons"></i>
                        <p>接单</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/order/recievedorder">
                        <i class="la la-chrome"></i>
                        <p>已接订单</p>
                        <span class="badge badge-danger">${myrecivedordercount}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/order/myorder">
                        <i class="la la-send"></i>
                        <p>我的订单</p>
                        <span class="badge badge-danger">${myordercount}</span>
                    </a>
                </li>
                <li class="nav-item update-pro">
                    <button  data-toggle="modal" data-target="#modalUpdate">
                        <i class="la la-hand-pointer-o"></i>
                        <p>Update To Pro</p>
                    </button>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        $(function() {
            $("a").click(function() {
                // 第一种方法
                // $("li").removeClass("active");//删除指定的 class 属性
                // $(this).addClass("active");//向被选元素添加一个或多个类
                // $(this).toggleClass("active");//该函数会对被选元素进行添加/删除类的切换操作
                //或者使用第二种方法
                $(this).addClass("active").siblings().removeClass("active");
            });
        })
    </script>
    </body>
</html>