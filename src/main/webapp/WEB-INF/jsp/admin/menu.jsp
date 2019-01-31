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
                    <a class="active" href="/menu/selectAll">
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
                    <a href="javascript:;" >
                        <i class="fa fa-cogs"></i>
                        <span>Components</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="calendar.html">Calendar</a></li>
                        <li><a  href="gallery.html">Gallery</a></li>
                        <li><a  href="todo_list.html">Todo List</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-book"></i>
                        <span>Extra Pages</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="blank.html">Blank Page</a></li>
                        <li><a  href="login.html">Login</a></li>
                        <li><a  href="lock_screen.html">Lock Screen</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-tasks"></i>
                        <span>Forms</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="form_component.html">Form Components</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-th"></i>
                        <span>Data Tables</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="menumanagement.jsp">Basic Table</a></li>
                        <li><a  href="responsive_table.html">Responsive Table</a></li>
                    </ul>
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