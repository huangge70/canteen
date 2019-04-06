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
        
    <!-- Custom styles for this template -->
    <link href="/static/admin_assets/css/style.css" rel="stylesheet">
    <link href="/static/admin_assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <script src="/static/js/echarts.min.js"></script>
      <script src="/static/js/jquery.js"></script>
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
          <section class="wrapper site-min-height">

              <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
              <div id="main" style="width: 600px;height:400px;position:absolute;top:50%;left: 50%;margin-top: -200px;margin-left: -300px;"></div>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts实例
                  var myChart = echarts.init(document.getElementById('main'));//main是<div id="main" style="width: 600px;height:400px;"></div>的id

                  // 指定图表的配置项和数据
                  var option = {
                      title: {
                          text: '菜品销售量统计'
                      },
                      tooltip: {},
                      legend: {
                          data:['菜品名称']
                      },

                      xAxis: {
                          data: []
                      },
                      yAxis: {},
                      series: [{
                          name: '销量',
                          type: 'bar',
                          data: []
                      }]
                  };
                  // 异步加载数据
                  $.get('/statistics/dishcount').done(function (data) {
                      // 填入数据
                      myChart.setOption({
                          xAxis: {
                              data: data.categories
                          },
                          series: [{
                              // 根据名字对应到相应的系列
                              name: '销量',
                              data: data.data
                          }]
                      });
                  });
                  // 使用刚指定的配置项和数据显示图表。
                  myChart.setOption(option);
              </script>

		  </section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <jsp:include page="footer.jsp" flush="true"/>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/static/admin_assets/js/jquery.js"></script>
    <script src="/static/admin_assets/js/bootstrap.min.js"></script>
    <script src="/static/admin_assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="/static/admin_assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="/static/admin_assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="/static/admin_assets/js/jquery.scrollTo.min.js"></script>
    <script src="/static/admin_assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="/static/admin_assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
