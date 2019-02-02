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
						<h4 class="page-title">已点菜品</h4>
						<div class="row">
							<c:forEach items="${details}" var="detail">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											菜品：${detail.dish}&nbsp;&nbsp;&nbsp;&nbsp;
											价格：${detail.price}&nbsp;&nbsp;&nbsp;&nbsp;
											数量：${detail.count}&nbsp;&nbsp;&nbsp;&nbsp;
											<a class="btn btn-danger" href="/order/deletecart?did=${detail.did}&count=${detail.count}">删除</a>
										</h4>
									</div>
								</div>
							</div>
							</c:forEach>
							<button class="btn btn-primary" data-toggle="modal" data-target="#booking">预定结算</button>
							<button class="btn btn-success" data-toggle="modal" data-target="#takeaway">外卖结算</button>
						</div>
					</div>
				</div>
				<jsp:include page="footer.jsp" flush="true"/>
			</div>
		</div>
	</div>
	<!-- 预定 -->
	<div class="modal fade" id="booking" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> 完善预定信息</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/order/booking" method="post">
				<div class="modal-body text-center">									
					请输入预计取餐时间:<input type="text" name="time">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">提交</button>
					<button type="reset" class="btn btn-warning">重置</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 外卖 -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Under Development</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<p>Currently the pro version of the <b>Ready Dashboard</b> Bootstrap is in progress development</p>
					<p>
						<b>We'll let you know when it's done</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
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