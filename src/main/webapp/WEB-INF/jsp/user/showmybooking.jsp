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
								<th scope="col">订单金额</th>
								<th scope="col">创建时间</th>
								<th scope="col">操作</th>
							</tr>
							</thead>
							<c:forEach items="${pageInfo.list}" var="booking">
							<tbody>
							<tr>
								<td>${booking.id}</td>
								<td>${booking.price}</td>
								<td><fmt:formatDate value="${booking.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td>
									<c:if test="${booking.status=='待处理'}">
										<a class="btn btn-danger" href="/order/deletebooking?id=${booking.id}">取消订单</a>
									</c:if>
									<c:if test="${booking.status=='已完成'}">
										<button class="btn btn-success" data-toggle="modal" data-target="#evaluate" onclick="assignment(${booking.id})">评价</button>
									</c:if>
									<c:if test="${booking.status=='已评价'}">
										<span><font color="green">已评价</font> </span>
									</c:if>
								</td>
							</tr>
							</tbody>
							</c:forEach>
						</table>

						<div class="card-body">
							<p class="demo">
							<ul class="pagination pg-primary">
								<li class="page-item">
									<a class="page-link" aria-label="Previous" href="/order/showmybooking?pageNo=${pageInfo.prePage}">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<c:forEach var="pageNo" begin="1" end="${pageInfo.pages}">
								<li class="page-item"><a class="page-link" href="/order/showmybooking?pageNo=${pageNo}">${pageNo}</a></li>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="/order/showmybooking?pageNo=${pageInfo.nextPage}" aria-label="Next">
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
	<!-- 评价 -->
	<div class="modal fade" id="evaluate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> 填写评价信息</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/order/evaluatebooking" method="post">
					<input type="hidden" id="id" name="oid">
					<div class="modal-body text-center">
						请输入评价内容:<textarea name="content" style="width:200px;height:200px;visibility:hidden;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">提交</button>
						<button type="reset" class="btn btn-warning">重置</button>
					</div>
				</form>
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
<!--向模态框中传值-->
<script type="text/javascript">
    function assignment(id){
        $('#evaluate').modal('show');

        $('#id').attr('value',id);

    }
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