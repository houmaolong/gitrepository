<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="${ctxPath}/pages/index.jsp" target="top">首页</a></li>
			<li class="active">修改密码</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">修改密码</div>
		<!-- /.page-header -->
		<div class="alert alert-danger" style="display: none;">
			<button type="button" class="close" data-dismiss="alert">
				<i class="icon-remove"></i>
			</button>
			<strong> <i class="icon-remove"></i> 处理失败!
			</strong>
			<span id="msg"></span>
		</div>
		<form class="form-horizontal" role="form" id="form">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"> 用户编码 </label>
				<label class="col-sm-9">
					<span id="serialNumber"></span>
				</label>
			</div>

			<div class="space-4"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"> 用户名称 </label>
				<label class="col-sm-9">
					<span id="name"></span>
				</label>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 旧密码 </label>

				<div class="col-sm-9">
					<input type="password" id="_old_password" placeholder="旧密码" class="col-xs-10 col-sm-5">
					<input type="hidden" id="old_password" name="old_password" >
				</div>
			</div>

			<div class="space-4"></div>
			
 	        <div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 新密码 </label>

				<div class="col-sm-9">
					<input type="password" id="_password" placeholder="新密码" class="col-xs-10 col-sm-5">
						<input type="hidden" id="password" name="password" >
				</div>
			</div>

			<div class="space-4"></div>	<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 确认新密码 </label>

				<div class="col-sm-9">
					<input type="password" id="confirm_password" placeholder="确认新密码"
						name="confirm_password" class="col-xs-10 col-sm-5">
				</div>
			</div>

			<div class="space-4"></div>

			 
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="button" id="submit_btn">
						<i class="icon-ok bigger-110"></i> 提交
					</button>
					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="icon-undo bigger-110"></i> 重置
					</button>
				</div>
			</div>
		</form>

	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(function()
        {
            $("#form").validate({
                rules: {
                    _old_password: {
                        required: true,
                        minlength: 5
                    },
                    _password: {
                        required: true,
                        minlength: 5
                    },
          	        confirm_password: {
          	            required: true,
          	            minlength: 5,
          	            equalTo: "#_password"
                	 } 
                },
                messages: {
                    _old_password: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入旧密码! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 旧密码不能小于 5 个字符! </div>"
                    },
                    _password: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入新密码! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 新密码长度不能小于 5 个字符! </div>"
                    },
           	        confirm_password: {
           	            required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入确认新密码! </div>",
           	            minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 确认新密码长度不能小于 5 个字符! </div>",
           	            equalTo: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 两次密码输入不一致! </div>"
           	        }  
                },
                submitHandler: function()
                {
                    var password= $("#_old_password").val();
                    $("#old_password").val($.md5(password));
                    var password= $("#_password").val();
                    $("#password").val($.md5(password));
                    $.ajax({
                        url: 'sys/updatePassword.ajax',
                        type: 'POST',
                        dataType: 'json',
                        data: $("#form").serialize(),
                        success: function(data)
                        {
                            if(data.success) {
                                window.location.href=window.ctxPath + "/pages/login.jsp";
                            }else {
                                $("#msg").empty().append(data.msg);
                                $(".alert-danger").show();
                            }
                        }
                    });
                }
            });
            $("#submit_btn").click(function()
            {
                $("#form").submit();
            });
            $.ajax({
                url: 'sys/session.ajax',
                type: 'POST',
                dataType: 'json',
                success: function(data)
                {
                    if(data.success) {
                        $("span").each(function()
                        {
                            $(this).html(data.data[$(this).attr("id")]);
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>
