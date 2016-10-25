<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li class=""><a href="${ctxPath}/modules/sale/list.jsp">订单管理</a></li>
			<li class=""><a
				href="${ctxPath}/modules/sale/detail.jsp?id=${param.id}">订单详情</a></li>
			<li class="active">新增产品</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">新增产品</div>
		<!-- /.page-header -->
		<div class="alert alert-success" style="display: none;">
			<button type="button" class="close" data-dismiss="alert">
				<i class="icon-remove"></i>
			</button>
			<strong> <i class="icon-ok"></i> 提交成功!
			</strong>
		</div>
		<div class="alert alert-danger" style="display: none;">
			<button type="button" class="close" data-dismiss="alert">
				<i class="icon-remove"></i>
			</button>
			<strong> <i class="icon-remove"></i> 处理失败!
			</strong>
		</div>
		<form class="form-horizontal" enctype="multipart/form-data"
			role="form" id="form">
			<input type="hidden" id="masterId" name="masterId"
				value="${param.id}" />
			<div class="space-4"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 产品名称</label>

				<div class="col-sm-9">
					<input type="text" id="productName" placeholder="产品名称"
						name="productName" class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 产品规格 </label>

				<div class="col-sm-9">
					<input type="text" id="spec" placeholder="产品规格 " name="spec"
						class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 产品数量 </label>

				<div class="col-sm-9">
					<input type="text" id="productQty" placeholder="产品数量"
						name="productQty" class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 计量单位 </label>

				<div class="col-sm-9">
					<select id="unit" name="unit" class="col-xs-10 col-sm-5"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 交期 </label>

				<div class="col-sm-9">
					<input type="text" id="deliverDate" placeholder="交期"
						name="deliverDate" class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 图片 </label> <label class="col-sm-9"> <input
					type="file" name="pic" id="pic" />
				</label>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 备注 </label>

				<div class="col-sm-9">
					<textarea class="form-control" id="memo" name="memo"
						placeholder="说点什么。。。" style="width: 347px; height: 69px;"></textarea>
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
			<div class="space-4"></div>
		</form>

	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(function()
        {
            $('#deliverDate').datepicker({
                startDate: new Date(),
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayBtn: 'linked',
                language: 'zh-CN'

            });

            //             jQuery.validator.addMethod("isPhone", function(value,element) {
            //                 var length = value.length;
            //                 var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+d{8})$/;
            //                 var tel = /^d{3,4}-?d{7,9}$/;
            //                 return this.optional(element) || (tel.test(value) || mobile.test(value));
            //                 }, "请正确填写您的联系电话");
            $("#form").validate({
                rules: {
                    productName: {
                        required: true,
                        minlength: 2
                    },
                    spec: {
                        required: true,
                        minlength: 2,
                    },
                    productQty: {
                        required: true
                    },
                    unit: {
                        required: true
                    },
                    deliverDate: {
                        required: true
                    }
                },
                messages: {
                    productName: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入产品名称! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 产品名称长度不能小于 2个字符! </div>"
                    },
                    spec: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入规格! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 规格长度不能小于 2个字符! </div>"
                    },
                    productQty: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入产品数量! </div>",
                    },
                    unit: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请选择计量单位! </div>",
                    },
                    deliverDate: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请选择交期! </div>",
                    }
                },
                submitHandler: function()
                {
                    //alert($("#form").serialize());
                    $(form).ajaxSubmit({
                        type: "post", // 提交方式 get/post
                        url: "${ctxPath}/sale/addProduct.ajax", // 需要提交的 url
                        success: function(data)
                        {
                            window.location.href = "${ctxPath}/modules/sale/detail.jsp?id=${param.id}";
                        },
                        error: function(data)
                        {
                            $("#msg").empty().append(data.msg);
                            $(".alert-danger").show();
                        }
                    });

                    /*   $.ajax({
                          url: 'sale/addProduct.ajax',
                          type: 'POST',
                          dataType: 'json',
                          data: $("#form").serialize(),
                          success: function(data)
                          {
                              if(data.success==true) {
                                  window.location.href="modules/sale/detail.jsp?id=${param.id}";
                              }else {
                                  $(".alert-danger").append(data.msg);
                                  $(".alert-danger").show();
                              }
                          }
                      }); */
                }
            });
            $("#productQty").on("input propertychange", function()
            {
                this.value = this.value.replace(/[^\d]/g, '')
            })
            $("#deliverDate").val('${param.deliverDate}')
            $("#unit").selectInit({
                url: 'sale/unitList.ajax',
                value: 'sName',
                key: "sName"
            });
            $("#submit_btn").click(function()
            {
                $("#form").submit();
            });
        });
    </script>
</body>
</html>
