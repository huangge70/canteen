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
    <div class="sidebar">
        <div class="scrollbar-inner sidebar-wrapper">
            <div class="user">
                <div class="photo">

                    <img src="/static/images/kobe.jpg">

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
                <li class="nav-item active">
                    <a href="index.jsp">
                        <i class="la la-dashboard"></i>
                        <p>Dashboard</p>
                        <span class="badge badge-count">5</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="components.html">
                        <i class="la la-table"></i>
                        <p>Components</p>
                        <span class="badge badge-count">14</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="forms.html">
                        <i class="la la-keyboard-o"></i>
                        <p>Forms</p>
                        <span class="badge badge-count">50</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="tables.html">
                        <i class="la la-th"></i>
                        <p>Tables</p>
                        <span class="badge badge-count">6</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="notifications.html">
                        <i class="la la-bell"></i>
                        <p>Notifications</p>
                        <span class="badge badge-success">3</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="typography.html">
                        <i class="la la-font"></i>
                        <p>Typography</p>
                        <span class="badge badge-danger">25</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="icons.html">
                        <i class="la la-fonticons"></i>
                        <p>Icons</p>
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
    </body>
</html>