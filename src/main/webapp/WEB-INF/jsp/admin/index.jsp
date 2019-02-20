<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>校园食堂一体化服务系统-管理员</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/admin_assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/static/admin_assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/static/admin_assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="/static/admin_assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="/static/admin_assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="/static/admin_assets/css/style.css" rel="stylesheet">
    <link href="/static/admin_assets/css/style-responsive.css" rel="stylesheet">

    <script src="/static/admin_assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >

      <jsp:include page="top.jsp" flush="true"/>

      <jsp:include page="menu.jsp" flush="true"/>
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-9 main-chart">
                  	<div class="row mtbox">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<span class="li_heart"></span>
					  			<a href="/menu/selectAll"><h3>菜单管理</h3></a>
                  			</div>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_cloud"></span>
								<a href="/user/selectAll"><h3>用户管理</h3></a>
                  			</div>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_stack"></span>
					  			<a href="/result"><h3>投票结果</h3></a>
							</div>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_news"></span>
					  			<a href="/article/selectAll"><h3>文章管理</h3></a>
							</div>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_data"></span>
					  			<a href="/suggest/selectAll"><h3>反馈意见</h3></a>
							</div>
                  		</div>
                  	
                  	</div><!-- /row mt -->


					  <div class="row mtbox">
						  <div class="col-md-2 col-sm-2 col-md-offset-1 box0">
							  <div class="box1">
								  <span class="li_bulb"></span>
								  <a href="/order/showbooking"><h3>查看预定</h3></a>
							  </div>
						  </div>
						  <div class="col-md-2 col-sm-2 box0">
							  <div class="box1">
								  <span class="li_bubble"></span>
								  <a href="/order/showtakeaway"><h3>外卖订单</h3></a>
							  </div>
						  </div>
						  <div class="col-md-2 col-sm-2 box0">
							  <div class="box1">
								  <span class="li_camera"></span>
								  <a href="/evaluation/showevaluation"><h3>查看评价</h3></a>
							  </div>
						  </div>
						  <div class="col-md-2 col-sm-2 box0">
							  <div class="box1">
								  <span class="li_cup"></span>
								  <a href="/dishcount"><h3>销量统计</h3></a>
							  </div>
						  </div>
						  <div class="col-md-2 col-sm-2 box0">
							  <div class="box1">
								  <span class="li_display"></span>
								  <a href="/salestatistics"><h3>销额统计</h3></a>
							  </div>
						  </div>

					  </div><!-- /row mt -->
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->

              </div><! --/row -->
          </section>
      </section>

      <!--main content end-->

      <jsp:include page="footer.jsp" flush="true"/>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/static/admin_assets/js/jquery.js"></script>
    <script src="/static/admin_assets/js/jquery-1.8.3.min.js"></script>
    <script src="/static/admin_assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="/static/admin_assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="/static/admin_assets/js/jquery.scrollTo.min.js"></script>
    <script src="/static/admin_assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="/static/admin_assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="/static/admin_assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="/static/admin_assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="/static/admin_assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="/static/admin_assets/js/sparkline-chart.js"></script>    
	<script src="/static/admin_assets/js/zabuto_calendar.js"></script>	
	
	<script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Dashgum!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: '/static/admin_assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>
