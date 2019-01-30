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
	                  	  	  <h4><i class="fa fa-angle-right"></i> 菜单管理</h4>
                              <a href="#" data-toggle="modal" data-target="#add" type="button" class="btn btn-round btn-warning">新增</a>

	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> ID</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> 菜品名称</th>
                                  <th><i class="fa fa-bookmark"></i> 菜品类别</th>
                                  <th><i class="fa fa-edit"></i> 菜品价格</th>
                                  <th><i class="fa fa-bullhorn"></i> 图片</th>
                                  <th><i class="fa fa-bookmark"></i> 菜品描述</th>
                                  <th>操作</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${menu}" var="dish">
                                  <tr>
                                      <td>${dish.id}</td>
                                      <td class="hidden-phone">${dish.name}</td>
                                      <td>${dish.type} </td>
                                      <td>${dish.price} </td>
                                      <td><img src="/static/images/${dish.picture}" alt="${dish.name}" width="50px" height="50px"> </td>
                                      <td>${dish.description} </td>
                                      <td>
                                          <a class="btn btn-primary btn-xs" href="/menu/selectById?id=${dish.id}"><i class="fa fa-pencil"></i></a>
                                          <a class="btn btn-danger btn-xs" href="/menu/delete?id=${dish.id}"><i class="fa fa-trash-o "></i></a>
                                      </td>
                                  </tr>
                              </c:forEach>
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->

              <!-- 新增 -->
              <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="modal-label"
                   aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"><span
                                      aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                              <h4 class="modal-title" id="modal-label" align="center">新增菜品</h4>
                          </div>
                          <div class="modal-body">
                              <form class="form-horizontal" role="form" method="post" action="/menu/add" enctype="multipart/form-data">
                                  <div class="form-group">
                                      <label for="name" class="col-sm-2 control-label">菜品名称</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="name" name="name"
                                                 placeholder="请输入菜名">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="type" class="col-sm-2 control-label">菜品类别</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="type" name="type"
                                                 placeholder="请输入类别">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="price" class="col-sm-2 control-label">价格</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="price" name="price"
                                                 placeholder="请输入价格">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="file" class="col-sm-2 control-label">上传图片</label>
                                      <div class="col-sm-10">
                                          <input type="file" name="file" id="file" accept="image/*">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="description" class="col-sm-2 control-label">描述</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="description" name="description"
                                                 placeholder="请输入描述信息">
                                      </div>
                                  </div>

                                  <div class="form-group">
                                      <div class="col-sm-offset-2 col-sm-10">
                                          <button type="submit" class="btn btn-success" >提交</button>
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
