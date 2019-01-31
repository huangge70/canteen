<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Forms - Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="/static/user_assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="/static/user_assets/css/ready.css">
	<link rel="stylesheet" href="/static/user_assets/css/demo.css">
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
			<div class="main-panel" align="center" >
				<div class="content" >
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-title">个人中心</div>
							</div>
							<form action="/user/update" method="post">
								<input type="hidden" name="id" value="${user.id}">
							<div class="card-body">
								<div class="form-group">
									<label>用户名</label>
									<input type="text" class="form-control form-control" name="username" value="${user.username}" readonly="readonly">
								</div>
								<div class="form-group">
									<label>密码</label>
									<input type="password" class="form-control form-control" name="username" value="${user.username}">
								</div>
								<div class="form-group">
									<label>真实姓名</label>
									<input type="text" class="form-control form-control" name="realname" value="${user.realname}">
								</div>
								<div class="form-group">
									<label>手机号</label>
									<input type="text" class="form-control form-control" name="phone" value="${user.phone}">
								</div>
								<div class="form-group">
									<label>地址</label>
									<input type="text" class="form-control form-control" name="address" value="${user.address}">
								</div>
								<div class="form-group">
									<label>余额</label>
									<input type="text" class="form-control form-control" name="balance" value="${user.balance}" readonly="readonly">
								</div>
							</div>
								<div class="card-action">
									<button type="submit" class="btn btn-success">提交</button>
									<button type="reset" class="btn btn-danger">重置</button>
								</div>
							</form>

						</div>
					</div>
					</div>
				<jsp:include page="footer.jsp" flush="true"/>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
</html>