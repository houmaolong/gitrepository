<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/pages/head.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<ul class="nav nav-list">
					<li class="active"><a href="modules/sale/list.jsp"
						target="mainFrame"> <i class="icon-inbox"></i> <span
							class="menu-text"> 销售订单 </span>
					</a></li>
					<li><a href="modules/sale/detail_list.jsp"
						target="mainFrame"> <i class="icon-book"></i> <span
							class="menu-text"> 订单明细 </span>
					</a></li>
					<c:if test="${LoginUser.isAdmin==1 }">
						<li><a href="modules/user/list.jsp" target="mainFrame"> <i
								class="icon-group"></i> <span class="menu-text"> 用户管理 </span>
						</a></li>
					</c:if>
					<li><a href="modules/sys/myinfo.jsp" target="mainFrame"> <i
							class="icon-user"></i> <span class="menu-text"> 个人资料 </span>
					</a></li>
					<li><a href="pages/updatePassword.jsp" target="mainFrame">
							<i class="icon-cog"></i> <span class="menu-text"> 修改密码 </span>
					</a></li>
				</ul>
			</div>
			<div class="main-content">
				<iframe id="mainFrame" name="mainFrame" src="modules/sale/list.jsp"
					frameborder="0"
					style="width: 100%; height: 100%; min-height: 680px; overflow-y: scroll; min-width: 864px;"></iframe>
			</div>
		</div>
	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(".nav-list li").click(function()
        {
            $(this).addClass("active").siblings().removeClass("active");
        })
    </script>
</body>
</html>