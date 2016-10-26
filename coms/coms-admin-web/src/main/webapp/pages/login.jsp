<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h3>
								<i class="icon-desktop green"></i> <span class="red">上海振创客户订单系统</span>
							</h3>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 登录
										</h4>

										<div class="space-6"></div>

										<form id="loginForm">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" id="username" name="username"
														class="form-control" placeholder="用户名" required="true" />
														<i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" id="_password" name="_password"
														class="form-control" placeholder="密码" required="true" />
														<i class="icon-lock"></i>
														<input type="hidden" id="password" name="password" />
												</span>
												</label> <label style="display: none" id="errorTip">用户名或密码错误！</label>
												<label class="space error" id="msg"></label>
												<div class="clearfix">
													<label class="inline"> <input id="remenberMe"
														type="checkbox" class="ace" /> <span class="lbl">
															记住我</span>
													</label>
													<button id="btn_login" type="submit"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> 登录
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<!-- 											<div> -->
										<!-- 												<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"> -->
										<!-- 													<i class="icon-arrow-left"></i> -->
										<!-- 													忘记密码 -->
										<!-- 												</a> -->
										<!-- 											</div> -->

										<div>
											<!-- 												<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link"> -->
											<!-- 													新用户注册 -->
											<!-- 													<i class="icon-arrow-right"></i> -->
											<!-- 												</a> -->
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
		//判断是否为iframe 是则重新加载页面
		if (window != top){
				top.location.href = window.ctxPath + "/pages/login.jsp"; 
		}
        $(function()
        {
            //layer.msg('用户名或密码错误', {icon: 1});
            $("#loginForm").validate({
                messages: {
                    username: {
                        required: "请填写用户名"
                    },
                    _password: {
                        required: "请填写密码"
                    }
                },
                submitHandler: function()
                {
                    var password= $("#_password").val();
                    $("#password").val($.md5(password));
                    $.ajax({
                        url: 'sys/login.ajax',
                        type: 'POST',
                        dataType: 'json',
                        data: $("#loginForm").serialize(),
                        success: function(data)
                        {
                            if(data.success) {
                                window.location.href = window.ctxPath + "/pages/index.jsp";
                            }else {
								$("#msg").html(data.msg).removeClass("space").show();
                            }
                        }
                    });
                }
            });
        })
    </script>

</body>
</html>
=======
﻿<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h3>
								<i class="icon-desktop green"></i> <span class="red">上海振创客户订单系统</span>
							</h3>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 登录BBB
										</h4>

										<div class="space-6"></div>

										<form id="loginForm">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" id="username" name="username"
														class="form-control" placeholder="用户名" required="true" />
														<i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" id="_password" name="_password"
														class="form-control" placeholder="密码" required="true" />
														<i class="icon-lock"></i>
														<input type="hidden" id="password" name="password" />
												</span>
												</label> <label style="display: none" id="errorTip">用户名或密码错误！</label>
												<label class="space error" id="msg"></label>
												<div class="clearfix">
													<label class="inline"> <input id="remenberMe"
														type="checkbox" class="ace" /> <span class="lbl">
															记住我</span>
													</label>
													<button id="btn_login" type="submit"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> 登录
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<!-- 											<div> -->
										<!-- 												<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"> -->
										<!-- 													<i class="icon-arrow-left"></i> -->
										<!-- 													忘记密码 -->
										<!-- 												</a> -->
										<!-- 											</div> -->

										<div>
											<!-- 												<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link"> -->
											<!-- 													新用户注册 -->
											<!-- 													<i class="icon-arrow-right"></i> -->
											<!-- 												</a> -->
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
		//判断是否为iframe 是则重新加载页面
		if (window != top){
				top.location.href = window.ctxPath + "/pages/login.jsp"; 
		}
        $(function()
        {
            //layer.msg('用户名或密码错误', {icon: 1});
            $("#loginForm").validate({
                messages: {
                    username: {
                        required: "请填写用户名"
                    },
                    _password: {
                        required: "请填写密码"
                    }
                },
                submitHandler: function()
                {
                    var password= $("#_password").val();
                    $("#password").val($.md5(password));
                    $.ajax({
                        url: 'sys/login.ajax',
                        type: 'POST',
                        dataType: 'json',
                        data: $("#loginForm").serialize(),
                        success: function(data)
                        {
                            if(data.success) {
                                window.location.href = window.ctxPath + "/pages/index.jsp";
                            }else {
								$("#msg").html(data.msg).removeClass("space").show();
                            }
                        }
                    });
                }
            });
        })
    </script>

</body>
</html>
