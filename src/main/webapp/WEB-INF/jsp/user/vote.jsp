<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.canteen.pojo.User" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String avatar="/static/images/"+((User)session.getAttribute("user")).getAvatar();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>校园食堂一体化服务系统-用户</title>
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
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<div class="card-title">菜品投票</div>
									</div>
									<div class="card-body">
										<form action="/vote/vote" method="post">
										<div class="form-group">
											<c:forEach items="${dishes}" var="dish">
											<div class="form-check">
												<label class="form-check-label">
													<input class="form-check-input" type="checkbox" name="vote" value="${dish.id}">
													<span class="form-check-sign">${dish.name}</span>
												</label>
											</div>
											</c:forEach>
										</div>
										<div class="card-action">
											<button type="submit" class="btn btn-success">提交</button>
											<button type="reset" class="btn btn-danger">取消</button>
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
<script type="text/javascript">
    $(function() {
        //var user = "<%=session.getAttribute("user")%>";
        var avatar="<%=avatar%>";
        //alert(avatar);
        $('#avatar').attr('src',avatar);
        $('#avatar2').attr('src',avatar);
    });
</script>
</html>