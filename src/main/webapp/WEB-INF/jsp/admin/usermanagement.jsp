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

    <title>DASHGUM - Bootstrap Admin Template</title>

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
	                  	  	  <h4><i class="fa fa-angle-right"></i> 用户管理</h4>
                              <a href="#" data-toggle="modal" data-target="#add" type="button" class="btn btn-round btn-warning">新增</a>

	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> ID</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> 用户名</th>
                                  <th><i class="fa fa-bookmark"></i> 真实姓名</th>
                                  <th><i class="fa fa-edit"></i> 手机号</th>
                                  <th><i class="fa fa-bullhorn"></i> 地址</th>
                                  <th>操作</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${pageInfo.list}" var="user">
                                  <tr>
                                      <td>${user.id}</td>
                                      <td>${user.username}</td>
                                      <td>${user.realname} </td>
                                      <td>${user.phone} </td>
                                      <td>${user.address} </td>
                                      <td>
                                          <c:if test="${user.status==1}">
                                              <a type="button" class="btn btn-round btn-danger" href="/user/disableuser?id=${user.id}">禁用</a>
                                          </c:if>
                                          <c:if test="${user.status==0}">
                                              <a type="submit" class="btn btn-round btn-success" href="/user/enableuser?id=${user.id}">启用</a>
                                          </c:if>
                                      </td>
                                  </tr>
                              </c:forEach>
                              </tbody>
                          </table>

                          <div class="showback">
                              <div class="btn-group">
                                  <a type="button" class="btn btn-default" href="/user/selectAll">首页</a>
                                  <a type="button" class="btn btn-default" href="/user/selectAll?pageNo=${pageInfo.prePage}">上一页</a>
                                  <c:forEach var="pageNo" begin="1" end="${pageInfo.pages}">
                                    <a type="button" class="btn btn-default" href="/user/selectAll?pageNo=${pageNo}">${pageNo}</a>
                                  </c:forEach>
                                  <a type="button" class="btn btn-default" href="/user/selectAll?pageNo=${pageInfo.nextPage}">下一页</a>
                                  <a type="button" class="btn btn-default" href="/user/selectAll?pageNo=${pageInfo.pages}">尾页</a>
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
