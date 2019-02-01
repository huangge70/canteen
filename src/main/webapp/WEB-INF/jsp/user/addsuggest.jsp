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
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Components - Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="/static/user_assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="/static/user_assets/css/ready.css">
	<link rel="stylesheet" href="/static/user_assets/css/demo.css">

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
	<div class="wrapper">
		<jsp:include page="top.jsp" flush="true"/>
		<jsp:include page="menu.jsp" flush="true"/>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<c:forEach items="${suggests}" var="suggest">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">评价人ID:${suggest.uid}</h4>
										<p class="card-category">提交评价时间:<fmt:formatDate value="${suggest.time}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
									</div>
									<div class="card-body">
										<p class="demo">
											${suggest.content}
										</p>
									</div>
								</div>
							</div>
							</c:forEach>
							<div class="col-md-12">
								<div class="card">
									<form action="/suggest/add" method="post">
									<div class="card-header">
										<textarea name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
									</div>
									<div class="card-body">
										<button type="submit" class="btn btn-success">提交</button>
										<button type="reset" class="btn btn-warning">重置</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="footer.jsp" flush="true"/>
			</div>

		</div>
	</div>
</body>
<script src="/static/user_assets/js/core/jquery.3.2.1.min.js"></script>
<script src="/static/user_assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/static/user_assets/js/core/popper.min.js"></script>
<script src="/static/user_assets/js/core/bootstrap.min.js"></script>
<script src="/static/user_assets/js/plugin/chartist/chartist.min.js"></script>
<script src="/static/user_assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="/static/user_assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="/static/user_assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="/static/user_assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="/static/user_assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="/static/user_assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="/static/user_assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="/static/user_assets/js/ready.min.js"></script>
<script>
	$( function() {
		$( "#slider" ).slider({
			range: "min",
			max: 100,
			value: 40,
		});
		$( "#slider-range" ).slider({
			range: true,
			min: 0,
			max: 500,
			values: [ 75, 300 ]
		});
	} );
</script>
</html>