<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
    <body>
    <!-- **********************************************************************************************************************************************************
  MAIN SIDEBAR MENU
  *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href="profile.html"><img src="/static/admin_assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">Admin</h5>

                <li class="mt">
                    <a href="/menu/selectAll">
                        <i class="fa fa-dashboard"></i>
                        <span>菜单管理</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/user/selectAll" >
                        <i class="fa fa-desktop"></i>
                        <span>用户管理</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/result">
                        <i class="fa fa-dashboard"></i>
                        <span>查看投票结果</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/article/selectAll">
                        <i class="fa fa-cogs"></i>
                        <span>文章管理</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/suggest/selectAll">
                        <i class="fa fa-book"></i>
                        <span>查看反馈意见</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/order/showbooking" >
                        <i class="fa fa-tasks"></i>
                        <span>查看预定</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/order/showtakeaway" >
                        <i class="fa fa-book"></i>
                        <span>查看外卖订单</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/evaluation/showevaluation" >
                        <i class="fa fa-tasks"></i>
                        <span>查看评价</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/dishcount" >
                        <i class="fa fa-th"></i>
                        <span>菜品销售量统计</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/salestatistics" >
                        <i class="fa fa-bar-chart-o"></i>
                        <span>销售额统计</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Charts</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="morris.html">Morris</a></li>
                        <li><a  href="chartjs.html">Chartjs</a></li>
                    </ul>
                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>

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