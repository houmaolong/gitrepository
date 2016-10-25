<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/root.jsp"></jsp:include>
</head>
<body>
	<form class="form-horizontal" enctype="multipart/form-data" role="form"
		id="form">
		<div class="table-responsive">
			<table id="sample-table-1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>产品名称</th>
						<th>产品规格</th>
						<th>产品数量</th>
						<th>计量单位</th>
						<th>交期</th>
						<th>图片</th>
						<th>备注</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="productName" placeholder="产品名称"
							name="details[0].productName"></td>
						<td><input type="text" id="spec" placeholder="产品规格 "
							name="details[0].spec"></td>
						<td><input type="text" id="productQty" placeholder="产品数量"
							name="details[0].productQty"></td>
						<td><select id="unit" name="unit" class="unit"></select></td>
						<td><input type="text" id="deliverDate" placeholder="交期"
							name="details[0].deliverDate" class="deliverDate"></td>
						<td><input type="file" name="details[0].pic" id="pic" /></td>
						<td><textarea id="memo" name="details[0].memo"
								placeholder="说点什么。。。"></textarea></td>
						<td><a href="javascript:;" class="btn btn-grey btn-sm"> <i class="icon-trash icon-only"></i></a></td>
					</tr>

				</tbody>
			</table>
		</div>
	</form>
	<a href="javascript:;" class="btn  btn-primary btn-sm" id="add_btn"> <i class="icon-edit"></i> 添加  </a>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
	function init(){
	    $('.deliverDate').datepicker({
          startDate: new Date(),
          format: 'yyyy-mm-dd',
          autoclose: true,
          todayBtn: 'linked',
          language: 'zh-CN'

     	 });
     	 $(".unit").selectInit({
          url: 'sale/unitList.ajax',
          value: 'sName',
          key: "sName"
     	 });
	}
        $(function()
        {
            init();
        });
        $("#submit_btn").click(function()
        {
            $("#form").ajaxSubmit({
                type: "post", // 提交方式 get/post
                url: "${ctxPath}/sale/addWithDetails.ajax", // 需要提交的 url
                success: function(data)
                {
                    alert("成功");
                },
                error: function(data)
                {
                    alert("失败");
                }
            });
        });
        window.index = 1;
        $("#add_btn").click(function()
        {
            var html = '<tr>' + '<td><input type="text" id="productName" placeholder="产品名称"'+
    								'name="details['+window.index+'].productName"></td>' + '<td><input type="text" id="spec" placeholder="产品规格 "'+
    								'name="details['+window.index+'].spec"></td>' + '<td><input type="text" id="productQty" placeholder="产品数量"'+
    								'name="details['+window.index+'].productQty"></td>' + '<td><select id="unit" name="unit" class="unit"></select></td>' + '<td><input type="text" id="deliverDate" placeholder="交期"'+
    								'name="details['+window.index+'].deliverDate" class="deliverDate"></td>' + '<td><input type="file" name="details['+index+'].pic" id="pic" /></td>' + '<td><textarea id="memo" name="details['+index+'].memo" placeholder="说点什么。。。"></textarea></td>' + '<td><a href="javascript:;" class="btn btn-grey btn-sm"> <i class="icon-trash icon-only"></i></a></td></tr>';
            $(html).appendTo("tbody");
            window.index= window.index+1;
            init();
        });
    </script>
</body>
</html>