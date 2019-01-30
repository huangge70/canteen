<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  
<base href="<%=basePath%>">
    
    <title>校园食堂一体化服务系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
	body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
	 /* 轮播广告 */

        .carousel {
            height: 900px;
            margin-bottom: 60px;
        }

        .carousel .item {
            height: 900px;
            background-color: #000;
        }
         .carousel .item img {
            width: 100%;
        }
         .carousel-caption {
            z-index: 10;
        }
         .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }
        
          /* 简介 */

        .summary {
            padding-right: 15px;
            padding-left: 15px;
        }

        .summary .col-md-4 {
            margin-bottom: 20px;
            text-align: center;
        }
          /* 特性 */

        .feature-divider {
            margin: 40px 0;
        }

        .feature {
            padding: 30px 0;
        }

        .feature-heading {
            font-size: 50px;
            color: #2a6496;
        }

        .feature-heading .text-muted {
            font-size: 28px;
        }
	</style>
  </head>
  
  <body>
	<c:if test="${message!=null}">
		<script>
            alert("${message}");
		</script>
	</c:if>
    <!-- 顶部导航 -->
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">校园食堂一体化服务系统</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#ad-carousel">首页</a></li>
               
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
               <!--  <li> <a href="#" data-toggle="modal" data-target="#login">登录</a></li> -->
                <ul class="nav navbar-nav navbar-right">
                   <li><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                 </ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal" data-target="#register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
				</ul>
            </ul>
           
        </div>
    </div>
</div>
		
		<!-- 广告轮播 -->
		<div id="ad-carousel" class="carousel slide" data-ride="carousel">
		    <ol class="carousel-indicators">
		        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
		        <li data-target="#ad-carousel" data-slide-to="1"></li>
		        <li data-target="#ad-carousel" data-slide-to="2"></li>
		        <li data-target="#ad-carousel" data-slide-to="3"></li>
		        <li data-target="#ad-carousel" data-slide-to="4"></li>
		    </ol>
		    <div class="carousel-inner">
		        <div class="item active">
		            <img src="/static/images/bg1.jpg" alt="1 slide">
		
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>宫保鸡丁</h1>
		
		                    <p>宫保鸡丁选用鸡肉为主料，佐以花生米、黄瓜、辣椒等辅料烹制而成。 红而不辣、辣而不猛、香辣味浓、肉质滑脆。由于其入口鲜辣，鸡肉的鲜嫩配合花生的香脆。</p>
		
		                    <p><a class="btn btn-lg btn-primary" href="http://www.google.cn/intl/zh-CN/chrome/browser/"
		                          role="button" target="_blank">立即点餐</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="/static/images/bg2.jpg" alt="2 slide">
		
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>鱼香肉丝</h1>
		
		                    <p>鱼香肉丝就其材料非常简单，所以是家居生活中不可缺的菜色之一，而且其味酸甜鲜辣，适合大部分人的口味！</p>
		
		                    <p><a class="btn btn-lg btn-primary" href="http://www.firefox.com.cn/download/" target="_blank"
		                          role="button">立即点餐</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="/static/images/bg3.jpg" alt="3 slide">
		
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>红烧肉</h1>
		
		                    <p>红烧肉的烹饪技巧，锅具以砂锅为主，做出来的肉肥瘦相间，香甜松软，入口即化。红烧肉在我国各地流传甚广，具有一定的营养价值。</p>
		
		                    <p><a class="btn btn-lg btn-primary" href="http://www.apple.com/cn/safari/" target="_blank"
		                          role="button">立即点餐</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="/static/images/bg4.jpg" alt="4 slide">
		
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>水煮鱼</h1>
		
		                    <p>水煮鱼通常由新鲜草鱼、豆芽、辣椒等食材制作而成。“油而不腻、辣而不燥、麻而不苦、肉质滑嫩”是其特色。</p>
		
		                    <p><a class="btn btn-lg btn-primary" href="http://www.opera.com/zh-cn" target="_blank"
		                          role="button">立即点餐</a></p>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <img src="/static/images/bg5.jpg" alt="5 slide">
		
		            <div class="container">
		                <div class="carousel-caption">
		                    <h1>毛血旺</h1>
		
		                    <p>毛血旺以鸭血为制作主料，烹饪技巧以煮菜为主，口味属于麻辣味。起源于重庆，流行于重庆和西南地区，是一道著名的传统菜式。这道菜是将生血旺现烫现吃，且毛肚杂碎为主料，遂得名。</p>
		
		                    <p><a class="btn btn-lg btn-primary" href="http://ie.microsoft.com/" target="_blank"
		                          role="button">立即点餐</a></p>
		                </div>
		            </div>
		        </div>
		    </div>
		    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
		            class="glyphicon glyphicon-chevron-left"></span></a>
		    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
		            class="glyphicon glyphicon-chevron-right"></span></a>
		</div>

<!-- 主要内容 -->
<div class="container summary">
    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <p>食堂外卖一体化数字平台为普通用户提供了各式各样的便捷服务，同时也为管理员提供了很多功能支持，用户可以使用自己的账号和密码登录系统使用系统提供的功能。</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
                </div>
            </div>
        </div>
    </div>
    
     <!-- 登录 -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label" align="center">用户登录</h4>
                </div>
                <div class="modal-body">
                   <form class="form-horizontal" role="form" method="post" action="/user/login">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="firstname" name="username"
										   placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="lastname" name="password"
										   placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">选择角色</label>
								<div class="col-sm-10">
								<select class="form-control" name="role">
									<option value="1">普通用户</option>
									<option value="0">管理员</option>
								</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success" >登录</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-warning">重置</button>
								</div>
							</div>
					</form>
                </div>
              
            </div>
        </div>
    </div>

	<!-- 注册 -->
	<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="modal-label"
		 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span
							aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
					<h4 class="modal-title" id="modal-label" align="center">用户注册</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post" action="/user/register" enctype="multipart/form-data">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username" name="username"
									   placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password"
									   placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="realname" class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="realname" name="realname"
									   placeholder="请输入真实姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phone" name="phone"
									   placeholder="请输入手机号">
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="address" name="address"
									   placeholder="格式为公寓号,楼层,宿舍号">
							</div>
						</div>
						<div class="form-group">
							<label for="file" class="col-sm-2 control-label">上传头像</label>
							<div class="col-sm-10">
								<input type="file" name="file" id="file" accept="image/*">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success" >注册</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-warning">重置</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2019 北京信息科技大学 </p>
    </footer>

</div>
<script>
    $(function () {
        $('#ad-carousel').carousel();
        $('#menu-nav .navbar-collapse a').click(function (e) {
            var href = $(this).attr('href');
            var tabId = $(this).attr('data-tab');
            if ('#' !== href) {
                e.preventDefault();
                $(document).scrollTop($(href).offset().top - 70);
                if (tabId) {
                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
                }
            }
        });
    });
</script>
  </body>
</html>
