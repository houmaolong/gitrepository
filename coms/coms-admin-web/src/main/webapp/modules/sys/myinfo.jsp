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
			<li class="active">个人资料</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">个人资料</div>
		<!-- /.page-header -->
	 
		<form class="form-horizontal" role="form" id="form">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 用户编码 </label>

				<label class="col-sm-9">
				<span id="serialNumber"></span>
				</label>
			</div>

			<div class="space-4"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 用户名称 </label>

				<label class="col-sm-9">
					<span id="name"></span>
				</label>
			</div>

			<div class="space-4"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 所属客户 </label>

				<label class="col-sm-9">
					<span id="customerName"></span>
				</label>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 是否停用 </label>

				<label class="col-sm-9">
					<span id="isDisableStr"></span>
				</label>
			</div>

			<div class="space-4"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 是否管理账号 </label>
				<label class="col-sm-9">
					<span id="isAdminStr"></span>
				</label>
			</div>

			<div class="space-4"></div>
		</form>

	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(function()
        {
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
