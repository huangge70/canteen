<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.canteen.pojo.User" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
	<div class="wrapper">
		<jsp:include page="top.jsp" flush="true"/>
		<jsp:include page="menu.jsp" flush="true"/>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<table class="table table-head-bg-success">
							<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">文章标题</th>
								<th scope="col">发布时间</th>
								<th scope="col">查看</th>
							</tr>
							</thead>
							<c:forEach items="${pageInfo.list}" var="article" varStatus="status">
							<tbody>
							<tr>
								<td>${status.count}</td>
								<td>${article.title}</td>
								<td><fmt:formatDate value="${article.time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td><a class="btn btn-success" href="/article/selectById?id=${article.id}">查看详情</a></td>
							</tr>
							</tbody>
							</c:forEach>
						</table>

						<div class="card-body">
							<p class="demo">
							<ul class="pagination pg-primary">
								<li class="page-item">
									<a class="page-link" aria-label="Previous" href="/article/selectAll_user?pageNo=${pageInfo.prePage}">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<c:forEach var="pageNo" begin="1" end="${pageInfo.pages}">
								<li class="page-item"><a class="page-link" href="/article/selectAll_user?pageNo=${pageNo}">${pageNo}</a></li>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="/article/selectAll_user?pageNo=${pageInfo.nextPage}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</ul>
							</p>
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
	$('#displayNotif').on('click', function(){
		var placementFrom = $('#notify_placement_from option:selected').val();
		var placementAlign = $('#notify_placement_align option:selected').val();
		var state = $('#notify_state option:selected').val();
		var style = $('#notify_style option:selected').val();
		var content = {};

		content.message = 'Turning standard Bootstrap alerts into "notify" like notifications';
		content.title = 'Bootstrap notify';
		if (style == "withicon") {
			content.icon = 'la la-bell';
		} else {
			content.icon = 'none';
		}
		content.url = 'index.html';
		content.target = '_blank';

		$.notify(content,{
			type: state,
			placement: {
				from: placementFrom,
				align: placementAlign
			},
			time: 1000,
		});
	});
</script>
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