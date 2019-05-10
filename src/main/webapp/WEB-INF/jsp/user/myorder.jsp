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
							<c:forEach items="${orders}" var="order">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<p class="card-category">订单创建时间:<fmt:formatDate value="${order.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
										<p class="card-category">订单金额:${order.price}</p>
										<p class="card-category">送餐人手机号:${order.dphone}</p>
										<p class="card-category">订单状态:
											<c:if test="${order.status=='待处理'}">
												<font color="red">待处理</font><br>
												<a class="btn-danger" href="/order/cancelorder?id=${order.id}">取消订单</a>
											</c:if>
											<c:if test="${order.status=='已完成'}">
												<font color="green">已完成</font>
											</c:if>
											<c:if test="${order.status=='已接单'}">
												<font color="green">已接单</font><br>
												<a class="btn-success" href="/order/confirmorder?id=${order.id}">确认订单</a>
											</c:if>
											<c:if test="${order.status=='已确认'}">
												<font color="green">已确认</font>
												<button class="btn-success" data-toggle="modal" data-target="#evaluate" onclick="assignment(${order.id})">评价</button>
											</c:if>
											<c:if test="${order.status=='已评价'}">
												<font color="green">已评价</font>
											</c:if>
										</p>
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
				<form action="/order/evaluate" method="post">
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
<script type="text/javascript">
    $(function() {
        //var user = "<%=session.getAttribute("user")%>";
        var avatar="<%=avatar%>";
        //alert(avatar);
        $('#avatar').attr('src',avatar);
        $('#avatar2').attr('src',avatar);
    });
</script>
<!--向模态框中传值-->
<script type="text/javascript">
    function assignment(id){
        $('#evaluate').modal('show');

        $('#id').attr('value',id);

    }
</script>
</html>