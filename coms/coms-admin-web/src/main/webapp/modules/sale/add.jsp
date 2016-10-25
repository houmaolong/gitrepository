<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<jsp:include page="/root.jsp"></jsp:include>

</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a
				href="${ctxPath}/pages/index.jsp" target="top">首页</a></li>
			<li><a href="${ctxPath}/modules/sale/list.jsp">订单管理</a></li>
			<li class="active">新增订单</li>
		</ul>
	</div>
	<div class="page-content">
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
		
		<div class="table-header">
     		订单信息
        </div>
       
		<form class="form-horizontal" role="form" id="form">
 			<div class="product-info">
			<div class="space-4"></div>
			<div class="group-item col-sm-6">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 客户名称 </label>

				<div class="col-sm-9">
					<input type="text" id="customerName" placeholder="客户名称"
						disabled="disabled" class="col-xs-10 col-sm-10">
				</div>
			</div>					
			<div class="group-item col-sm-6">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 交货日期 </label>

				<div class="col-sm-9">
					<input type="text" id="deliveryDate" placeholder="交货日期"
						name="deliveryDate" class="col-xs-10 col-sm-10">
				</div>
			</div>
			<div class="group-item col-sm-6">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 联系人员 </label>

				<div class="col-sm-9">
					<input type="text" id="linkName" placeholder="联系人员" name="linkName"
						class="col-xs-10 col-sm-10">
				</div>
			</div>				
			<div class="group-item col-sm-6">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 送货地址 </label>

				<div class="col-sm-9">
					<select class="col-xs-10 col-sm-10" id="diliverAddress"
						name="diliverAddress">
					</select>
				</div>
			</div>	
			<div class="group-item col-sm-6" style="clear:left">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 联系电话 </label>

				<div class="col-sm-9">
					<input type="text" id="linkMobile" placeholder="联系电话 "
						name="linkMobile" class="col-xs-10 col-sm-10">
				</div>
			</div>		
			<div class="group-item col-sm-6">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-2"> 备注 </label>
				<div class="col-sm-9">
					<textarea class="form-control" id="memo" name="memo"
						placeholder="说点什么。。。" style="width:100%;max-width:100%;height: 69px;"></textarea>
				</div>
			</div>
		</div>
	<div class="table-header">
     		产品列表
     		<button type="button" class="btn btn-sm btn-inverse" id="add_btn" style="float:right;padding: 2px 7px;margin: 4px 10px;">
						<i class="icon-plus"></i>新增
			</button>
    </div>
			<div class="table-responsive">
				<table id="sample-table-1"
					class="table table-striped table-bordered table-hover product-table">
					<thead>
						<tr>
							<th width="12%">产品名称</th>
							<th width="12%">产品规格</th>
							<th width="8%">产品数量</th>
							<th width="12%">计量单位</th>
							<th width="12%">交期</th>
							<th width="12%">图片</th>
							<th width="12%">备注</th>
							<th width="5%">删除</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr id="tr0">
							<td><input type="text" id="productName" placeholder="产品名称"
								name="details[0].productName"></td>
							<td><input type="text" id="spec" placeholder="产品规格 "
								name="details[0].spec"></td>
							<td><input type="text" id="productQty" placeholder="产品数量"
								name="details[0].productQty"></td>
							<td><select id="unit" name="details[0].unit" class="unit"></select></td>
							<td><input type="text" id="deliverDate" placeholder="交期"
								name="details[0].deliverDate" class="deliverDate"></td>
							<td>
<!-- 								<input type="file" name="details[0].ImgPr" id="pic" /> -->
								<div><img id="ImgPr0" width="80" height="60" src="${ctxPath}/assets/images/upload_icon.jpg"/></div>
								<input type="file" name="details[0].pic" data-prid="0"/>
							</td>
							<td><textarea id="memo" name="details[0].memo"
									placeholder="说点什么。。。"></textarea></td>
							<td><a href="javascript:;"
								class="del_btn red bigger-150" > <i
									class="icon-trash icon-only"></i></a></td>
						</tr>
						
					</tbody>
				</table>
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
  		$("#tbody tr td input[name='details[0].pic']").uploadPreview({Img: 'ImgPr0', Width: 80, Height: 60 });
        function init(trid)
        {
            $("#"+trid).find('.deliverDate').datetimepicker({
                format: 'yyyy-mm-dd',
                startDate:new Date(),
                autoclose: true,
                todayBtn: 'linked',
                language: 'zh-CN',
				minView:2,
				maxView:2,
            }).val($("#deliveryDate").val());
            
            $("#"+trid).find(".unit").selectInit({
                url: 'sale/unitList.ajax',
                value: 'sName',
                key: "sName"
            });
        }
        $(function()
        {	$.ajax({
	            url: '${ctxPath}/sys/getCustomer.ajax',
	            dataType: 'json',
	            success: function(data)
	            {
	                if(data.success == true) {
	                    $("#customerName").val(data.data['sName']);
	                    $("#linkName").val(data.data['sContact']);
	                    $("#linkMobile").val(data.data['sMobile']);
	                    $("#diliverAddress").val(data.data['addressId']);
	                }
	            }
	        });
	        $('#deliveryDate').datetimepicker({
	            format: 'yyyy-mm-dd',
	            startDate:new Date(),
	            autoclose: true,
	            todayBtn: 'linked',
	            language: 'zh-CN',
			minView:2,
			maxView:2,
	        })
	        .val(new Date().format("yyyy-MM-dd"))
	        .on("changeDate",function(ev){
	            $('.deliverDate').val(ev.date.format("yyyy-MM-dd"));
	        });
            init("tr0");
            $(document).on("click",".del_btn",function (){
                if(window.index == 1) {
                    layer.msg("最后一个不能删除");
                    return;
                }
                window.index = window.index - 1;
                $(this).parent().parent().remove();
            });
           
            $("#diliverAddress").selectInit({
                url: 'sys/getAddress.ajax',
                value: 'addressId',
                key: "sAddress"
            });                       
            $("#form").validate({
                rules: {
                    linkName: {
                        required: true,
                        minlength: 2
                    },
                    linkMobile: {
                        required: true,
                        minlength: 11,
                    },
                    diliverAddress: {
                        required: true
                    },
                    deliveryDate: {
                        required: true,
                    },
                },
                messages: {
                    linkName: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入联系人名称! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 联系人名称长度不能小于 2个字符! </div>"
                    },
                    linkMobile: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入电话! </div>",
                        minlength: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 联系电话长度不能小于 11个字符! </div>",
                        isPhone: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入正确的联系方式! </div>"
                    },
                    diliverAddress: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请选择送货地址! </div>"
                    },
                    deliveryDate: {
                        required: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请选择送货日期! </div>",
                    //                         date: "<div class=\"help-block col-xs-12 col-sm-reset inline\" style=\"color: #d16e6c;\"> 请输入正确的日期格式!</div>"
                    }
                },
                submitHandler: function()
                {
                    $(form).ajaxSubmit({
                        url: '${ctxPath}/sale/addWithDetails.ajax',
                        type: 'POST',
                        dataType: 'json',
                        success: function(data)
                        {
                            if(data.success == true) {
                                window.location.href = "${ctxPath}/modules/sale/detail.jsp?id=" + data.data;
                            }else {
                                $(".alert-danger").append(data.msg);
                                $(".alert-danger").show();
                            }
                        }
                    });
                }
            });
            $("#tbody").on("input propertychange","tr td input[name$=productQty]",function(){
                this.value = this.value.replace(/[^\d]/g, '')
            })
            $("#submit_btn").click(function()
            {        
                var flag = true;
                $("#tbody tr td input[type=text]").each(function(){
                    console.log($(this).val())
                    if($(this).val()==""){
                        layer.msg('请填写完整信息!', {time: 2000, icon:7});
                        $(this).focus();
                        flag = false;
                        return flag;
                    }                   
                })
                if(flag==true){
	                 $("#tbody tr td select").each(function(){
	                        if($(this).val()==""){
	                            layer.msg('请填写完整信息!', {time: 2000, icon:7});
	                            $(this).focus();
	                            flag = false
	                            return flag;
	                        }
	                    })
                }
                if(flag==true){
                   $("#form").submit();
                }
               
            });            
            window.index = 1;
            $("#add_btn").click(function()
            {
                var html = '<tr id="tr'+window.index+'">' + '<td><input type="text" id="productName" placeholder="产品名称" name="details['+window.index+'].productName"></td>' 
                                    + '<td><input type="text" id="spec" placeholder="产品规格 " name="details['+window.index+'].spec"></td>' 
                                    + '<td><input type="text" id="productQty" placeholder="产品数量" name="details['+window.index+'].productQty"></td>' 
                                    + '<td><select id="unit" name="details['+window.index+'].unit" class="unit"></select></td>'
                                    + '<td><input type="text" id="deliverDate" placeholder="交期" name="details['+window.index+'].deliverDate" class="deliverDate"></td>' 
                                    + '<td><div><img id="ImgPr'+window.index+'" width="80" height="60" src="${ctxPath}/assets/images/upload_icon.jpg"/></div>'
                    				+'<input type="file" name="details['+window.index+'].pic" data-prid="'+window.index+'" /></td>' 
                                    + '<td><textarea id="memo" name="details['+index+'].memo" placeholder="说点什么。。。"></textarea></td>' 
                                    + '<td><a href="javascript:;" class="del_btn red bigger-150"> <i class="icon-trash icon-only"></i></a></td></tr>';
                $(html).appendTo("#tbody");
                $("#tbody tr td input[name='details["+window.index+"].pic']").uploadPreview({Img: 'ImgPr'+window.index, Width: 80, Height: 60 });
                init("tr"+window.index);
                window.index = window.index + 1;
            });
            
        });
    </script>
</body>
</html>
