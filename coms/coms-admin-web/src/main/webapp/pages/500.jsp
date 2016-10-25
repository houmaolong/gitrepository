<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		 <jsp:include page="/root.jsp"></jsp:include>
	</head>

	<body class="no-skin">
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					
					<!-- /section:settings.box -->
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- #section:pages/error -->
							<div class="error-container">
								<div class="well">
									<h1 class="grey lighter smaller">
										<span class="blue bigger-125">
											<i class="ace-icon fa fa-random"></i>
											500
										</span>
										系统傲娇了
									</h1>

									<hr />
									<h3 class="lighter smaller">
										攻城狮们正在努力的修复中
										<i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
									</h3>

									<div class="space"></div>

									<div>
										<h4 class="lighter smaller">同时，你可以试着:</h4>

										<ul class="list-unstyled spaced inline bigger-110 margin-15">
											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												稍候再试
											</li>

											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												将出错信息提供给系统管理员
											</li>
										</ul>
									</div>
									<div style="display:none">
										<!--#include virtual="/pages/500_error.jsp"  -->
									</div>
									<hr />
									<div class="space"></div>

									<div class="center">
										<a href="javascript:history.back()" class="btn btn-grey">
											<i class="ace-icon fa fa-arrow-left"></i>
											返回
										</a>
									</div>
								</div>
							</div>

							<!-- /section:pages/error -->

							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
	</body>
</html>