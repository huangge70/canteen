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
	<title>校园食堂一体化服务系统-用户</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="/static/user_assets//css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="/static/user_assets//css/ready.css">
	<link rel="stylesheet" href="/static/user_assets//css/demo.css">
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
						<h4 class="page-title">菜品列表</h4>
						<div class="row">
							<c:forEach items="${dishes}" var="dish">
							<div class="col-md-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">${dish.name}</h4>
										<p class="card-category">价格：${dish.price}元</p>
									</div>
									<div class="card-body">
										<img src="/static/images/${dish.picture}" alt="${dish.name}" width="200px" height="200px">
									</div>
									<div class="card-footer">
										<form action="/order/addcart" method="post">
											<input type="hidden" name="did" value="${dish.id}">
											<input type="hidden" name="dish" value="${dish.name}">
											<input type="hidden" name="price" value="${dish.price}">
											<div class="legend">
												请输入数量:<input type="text" name="count" size="5"/>
												<button class="btn btn-info">订餐</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<jsp:include page="footer.jsp" flush="true"/>
			</div>
		</div>
	</div>
</body>
<script src="/static/user_assets//js/core/jquery.3.2.1.min.js"></script>
<script src="/static/user_assets//js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/static/user_assets//js/core/popper.min.js"></script>
<script src="/static/user_assets//js/core/bootstrap.min.js"></script>
<script src="/static/user_assets//js/plugin/chartist/chartist.min.js"></script>
<script src="/static/user_assets//js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="/static/user_assets//js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="/static/user_assets//js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="/static/user_assets//js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="/static/user_assets//js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="/static/user_assets//js/plugin/chart-circle/circles.min.js"></script>
<script src="/static/user_assets//js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="/static/user_assets//js/ready.min.js"></script>
<script src="/static/user_assets//js/demo.js"></script>
</html>