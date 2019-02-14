<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
    <body>
    <!-- **********************************************************************************************************************************************************
  TOP BAR CONTENT & NOTIFICATIONS
  *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>管理员页面</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">${fn:length(unresolveorder)}</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have ${fn:length(unresolveorder)} new orders</p>
                        </li>
                        <c:forEach items="${unresolveorder}" var="booking">
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">订餐人:${booking.uname}</div>
                                    <div class="desc">订单创建时间:<fmt:formatDate value="${booking.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                                </div>
                            </a>
                        </li>
                        </c:forEach>
                        <li class="external">
                            <a href="#">See All Orders</a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">${fn:length(evaluations)}</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have ${fn:length(evaluations)} new evaluations</p>
                        </li>
                        <c:forEach items="${evaluations}" var="evaluation">
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">订单号:${evaluation.oid}</div>
                                    <div class="desc">评价时间:<fmt:formatDate value="${evaluation.time}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                                </div>
                            </a>
                        </li>
                        </c:forEach>
                        <li>
                            <a href="/evaluation/showevaluation">See all evaluations</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="/user/adminLogout">Logout</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->
    </body>
</html>