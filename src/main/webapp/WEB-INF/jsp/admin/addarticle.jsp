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
    <link rel="stylesheet" type="text/css" href="/static/admin_assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="/static/admin_assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="/static/admin_assets/css/style.css" rel="stylesheet">
    <link href="/static/admin_assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--kindeditor-->
      <link rel="stylesheet" href="/static/js/kindeditor/themes/default/default.css" />
      <script src="/static/js/kindeditor/kindeditor-all.js"></script>
      <script src="/static/js/kindeditor/lang/zh_CN.js"></script>

      <script type="text/javascript">
          KindEditor.ready(function(K) {
              var editor = K.create('textarea[name="content"]', {
                  uploadJson:'upload'
              });
          });
      </script>
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
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 发布文章</h4>
                      <form class="form-horizontal style-form" method="post" action="/article/add" enctype="multipart/form-data">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">文章标题</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">上传图片</label>
                              <div class="col-sm-10">
                                  <input type="file" class="form-control" name="file" id="file" accept="image/*">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">内容</label>
                              <div class="col-sm-10">
                                  <textarea name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-lg-10">
                                  <button type="submit" class="btn btn-success">提交</button>
                                  <button type="reset" class="btn btn-warning">重置</button>
                              </div>
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
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
    <script src="/static/admin_assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="/static/admin_assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="/static/admin_assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="/static/admin_assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="/static/admin_assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="/static/admin_assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="/static/admin_assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="/static/admin_assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
