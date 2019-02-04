<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
  </head>

  <body>

  <c:if test="${message!=null}">
      <script>
          alert("${message}");
      </script>
  </c:if>
  <section id="container" >
      <jsp:include page="top.jsp" flush="true"/>
      
      <jsp:include page="menu.jsp" flush="true"/>
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> 预定订单</h4>

	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> ID</th>
                                  <th><i class="fa fa-question-circle"></i> 订餐人</th>
                                  <th><i class="fa fa-bookmark"></i> 取餐时间</th>
                                  <th><i class="fa fa-edit"></i> 订单金额</th>
                                  <th><i class="fa fa-bullhorn"></i> 订单详情</th>
                                  <th>操作</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${bookings}" var="booking">
                                  <tr>
                                      <td>${booking.id}</td>
                                      <td>${booking.uname}</td>
                                      <td><fmt:formatDate value="${booking.time}" pattern="HH:mm:ss"/> </td>
                                      <td>${booking.price}</td>
                                      <td>
                                          <c:forEach items="${booking.details}" var="detail">
                                              ${detail.dish}:${detail.count}份;
                                          </c:forEach>
                                      </td>
                                      <td>
                                          <a class="btn btn-success btn-xs" href="/order/finishbooking?id=${booking.id}"><i class="fa fa-check"></i></a>
                                      </td>
                                  </tr>
                              </c:forEach>
                              </tbody>
                          </table>

                          <div class="showback">
                              <div class="btn-group">
                                  <a type="button" class="btn btn-default" href="/order/showbooking">首页</a>
                                  <a type="button" class="btn btn-default" href="/order/showbooking?pageNo=${pageInfo.prePage}">上一页</a>
                                  <c:forEach var="pageNo" begin="1" end="${pageInfo.pages}">
                                    <a type="button" class="btn btn-default" href="/order/showbooking?pageNo=${pageNo}">${pageNo}</a>
                                  </c:forEach>
                                  <a type="button" class="btn btn-default" href="/order/showbooking?pageNo=${pageInfo.nextPage}">下一页</a>
                                  <a type="button" class="btn btn-default" href="/order/showbooking?pageNo=${pageInfo.pages}">尾页</a>
                              </div>
                          </div><!-- /showback -->

                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->


		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->


  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/static/admin_assets/js/jquery.js"></script>
    <script src="/static/admin_assets/js/bootstrap.min.js"></script>
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
