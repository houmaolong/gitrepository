<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
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
											<i class="ace-icon fa fa-sitemap"></i>
											404
										</span>
										抱歉，您访问的页面不存在！
									</h1>

									<hr />
									<h3 class="lighter smaller">Not Found</h3>

									<div>
										
										<div class="space"></div>
										<h4 class="smaller">您可以试着:</h4>

										<ul class="list-unstyled spaced inline bigger-110 margin-15">
											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												请检查访问的请求地址是否正确
											</li>

											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												页面可能已经被删除
											</li>

											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												通知系统管理员
											</li>
										</ul>
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
				<script>
				var ifmAutoHeight =  function(){
					if (window.parent && window.parent.frames["mainFrame"]) {
						window.parent.frames["mainFrame"].height = document.body.scrollHeight;
					}
				}
				ifmAutoHeight();
			</script>
	</body>
</html>