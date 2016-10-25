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
			<li><a href="${ctxPath}/modules/user/list.jsp">用户管理</a></li>
			<li class="active">新增</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">新增用户信息</div>
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
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 用户名称 </label>

				<div class="col-sm-9">
					<input type="text" id="form-field-1" placeholder="用户名称" name="name"
						class="col-xs-10 col-sm-5">
				</div>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 用户密码 </label>

				<div class="col-sm-9">
					<input type="password" id="_password" name="_password" placeholder="用户密码" class="col-xs-10 col-sm-5" value="123456">
					<input type="hidden" id="password" name="password" >
					<label class="col-sm-2 control-label "
					for="form-field-1"> 默认123456</label>
				</div>
			</div>

			<div class="space-4"></div>

			<!-- <div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 确认用户密码 </label>

				<div class="col-sm-9">
					<input type="text" id="form-field-2" placeholder="确认用户密码"  name="confirm_password" id="confirm_password"
						class="col-xs-10 col-sm-5">
				</div>
			</div>

			<div class="space-4"></div> -->

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 所属客户 </label>

				<div class="col-sm-9">
					<select class="col-xs-10 col-sm-5" id="customerId" name="customerId">
					</select>
				</div>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 是否停用 </label>

				<div class="col-sm-9">
					<label> <input name="isDisable" type="radio" value="0" class="ace"/>
						<span class="lbl"> 是</span>
					</label> <label> <input name="isDisable" type="radio" value="1" class="ace" checked="checked"/>
						<span class="lbl"> 否</span>
					</label>

				</div>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 是否管理账号 </label>

				<div class="col-sm-9">
					<label> <input name="isAdmin" type="radio" value="1" class="ace"/> <span
						class="lbl"> 是</span>
					</label> <label> <input name="isAdmin" type="radio" value="0" class="ace" checked="checked"/> <span
						class="lbl"> 否</span>
					</label>
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
                    name: {
                        required: true,
                        minlength: 2
                    },
                    _password: {
                        required: true,
                        minlength: 5
                    },
                    customerId: {
                        required: true
                    }
                /* ,
                	          confirm_password: {
                	            required: true,
                	            minlength: 5,
                	            equalTo: "#password"
                	          } */
                },
                messages: {
                    name: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入用户名! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 用户名长度不能小于2个字符! </div>"
                    },
                    _password: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入密码! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 密码长度不能小于 5 个字符! </div>"
                    },
                    customerId: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请选择所属客户! </div>"
                    }
                /* ,
                	          confirm_password: {
                	            required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入密码! </div>",
                	            minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 密码长度不能小于 5 个字符! </div>",
                	            equalTo: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 两次密码输入不一致! </div>"
                	          } */
                },
                submitHandler: function()
                {	//密码加密MD5
                    var password= $("#_password").val();
                    $("#password").val($.md5(password));
                    $.ajax({
                        url: 'user/add.ajax',
                        type: 'POST',
                        dataType: 'json',
                        data: $("#form").serialize(),
                        success: function(data)
                        {
                            if(data.success==true) {
                                window.location.href=window.ctxPath + "/modules/user/list.jsp";
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
            $("#customerId").selectInit({url:'customer/list.ajax',value:'uguid1',key:"sname"});
          
        });
    </script>
</body>
</html>
