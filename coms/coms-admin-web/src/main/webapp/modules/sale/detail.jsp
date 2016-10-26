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
			<li class=""><a href="${ctxPath}/modules/sale/list.jsp">订单管理</a></li>
			<li class="active">订单详情</li>
		</ul>		
	</div>	
	<div class="page-content" >
		<div class="table-header">
     		订单信息
     		<button type="button" class="btn btn-sm btn-inverse" id="edit-btn" style="float:right;padding: 2px 9px;">
						<i class="icon-edit"></i>编辑
			</button>
        </div>
		<div class="product-info form-horizontal">	
			<div class="space-4"></div>
			<div class="group-item">		
				<div class="col-sm-4">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2">销售订单号</label>
					<div class="col-sm-9">
						<input type="text" id="serialNumber" placeholder=""
							disabled="disabled" class="col-xs-12 col-sm-12">
					</div>
				</div>	
				<div class="col-sm-3">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-2"> 联系人员 </label>

					<div class="col-sm-8">
						<input type="text" id="linkName" placeholder=""
							name="linkName" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>			
				<div class="col-sm-5">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2"> 交货日期 </label>
					<div class="col-sm-9">
						<input type="text" id="deliverDate" placeholder=""
							name="deliverDate" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>
			</div>
			<div class="group-item">
				<div class="col-sm-4">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2"> 客户名称 </label>
					<div class="col-sm-9">
						<input type="text" id="customerName" placeholder=""
							disabled="disabled" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>	
				<div class="col-sm-3">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-2"> 联系电话 </label>

					<div class="col-sm-8">
						<input type="text" id="linkMobile" placeholder=" "
							name="linkMobile" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>	
				<div class="col-sm-5">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2"> 送货地址 </label>
					<div class="col-sm-9">
						<input type="text" id="deliverAddress" placeholder=""
							name="deliverAddress" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>												
			</div>
			<div class="group-item">
				<div class="col-sm-4">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2">制单人</label>
					<div class="col-sm-9">
						<input type="text" id="name" placeholder=""
							name="name" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>
				<div class="col-sm-3">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-2">审核状态</label>
					<div class="col-sm-8">
						<input type="text" id="status" placeholder=""
							name="status" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>
				<div class="col-sm-5">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2">审核时间</label>
					<div class="col-sm-9">
						<input type="text" id="auditTime" placeholder=""
							name="auditTime" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>							
			</div>		
			<div class="group-item">	
				<div class="col-sm-4">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2">制单时间</label>
					<div class="col-sm-9">
						<input type="text" id="createTime" placeholder=""
							name="createTime" class="col-xs-12 col-sm-12" disabled="disabled">
					</div>
				</div>				
				<div class="col-sm-8">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-2" class="col-xs-1 col-sm-1" style="width:11.8%"> 备注 </label>
					<div class="col-sm-11" style="width:88.2%">
						<input type="text" id="memo" placeholder=""
							name="memo" class="col-xs-12 col-sm-12"  disabled="disabled" >
					</div>
				</div>
			</div>
		</div>
		
		<div>
<!-- 			<button type="button" class="btn btn-sm btn-primary" id="add-btn"> -->
<!-- 						<i class="icon-plus"></i></i>新增 -->
<!-- 			</button> -->			
<!-- 			<button type="button" class="btn btn-sm btn-danger" id="del-btn"> -->
<!-- 						<i class="icon-trash"></i>删除 -->
<!-- 			</button> -->
		</div>
		<table id="grid-table"></table>

		<div id="grid-pager"></div>
	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	
	<script type="text/javascript">
        $(function()
        {
          //添加产品
            $("#add-btn").click(function()
            {
                window.location.href = "${ctxPath}/modules/sale/addDetail.jsp?id=${param.id}&deliverDate="+$("#deliverDate").text();
            });
           	//查看订单
            $("#detail-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length==0){
                    layer.alert('请选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' 
                      })
                    return ;
                }
                if(ids.length>1){
                    layer.alert('查看只能选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' 
                      })
                    return ;
                }
                var id = $(grid_selector).jqGrid("getGridParam", "selrow");
                window.location.href = "${ctxPath}/modules/sale/detail.jsp?id="+id;
            });
          	//编辑产品
            $("#edit-btn").click(function()
            {
//                 var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
//                 if(ids.length==0){
//                     layer.alert('请选择一条记录!', {
//                         icon: 7,
//                         skin: 'layer-ext-moon' 
//                       })
//                     return ;
//                 }
//                 if(ids.length>1){
//                     layer.alert('编辑只能选择一条记录!', {
//                         icon: 7,
//                         skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
//                       })
//                     return ;
//                 }
//                 var id = $(grid_selector).jqGrid("getGridParam", "selrow");
				if($("#status").val()=="已审核") {
				    layer.msg('已审核订单不可编辑!', {time: 2000, icon:7});
				    return;
				}
                window.location.href = "${ctxPath}/modules/sale/edit.jsp?id=${param.id}";
            });
            //删除
            $("#del-btn").click(function()
            {                
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length==0){
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' 
                      })
                    return ;
                }
                layer.confirm('确定要删除？', {
                    btn: ['确定', '取消']
                }, function()
                {
                    $.ajax({
                        url: 'sale/delDetail.ajax',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            ids: ids
                        },
                        success: function(data)
                        {
                            if(data.success == true) {
                                layer.msg(data.msg, {
                                    icon: 1
                                });
                                $(grid_selector).jqGrid('setGridParam', {
                                    postData: $("#search-form").serializeJson(),
                                    page: 1
                                }).trigger('reloadGrid');
                            }else {
                                alert(data.msg);
                            }
                        }
                    });
                });

            });
            
        });
    </script>
	<script type="text/javascript">
		$.ajax({
	      url: 'sale/get.ajax',
	      data : {id:'${param.id}'},
	      dataType: 'json',
	      success: function(data)
	      {	          
	          if(data.success == true) {
	              $("#serialNumber").val(data.data.serialNumber);
	              $("#customerName").val(data.data.customerName);
	              $("#linkName").val(data.data.linkName);
	              $("#linkMobile").val(data.data.linkMobile);
	              $("#deliverAddress").val(data.data.deliverAddress);
	              if(data.data.deliveryDate!=null&data.data.deliveryDate!=""){
		                $("#deliverDate").val(new Date(data.data.deliveryDate).format("yyyy-MM-dd"));
		              }
	              if(data.data.createTime!=null&data.data.createTime!=""){
		                $("#createTime").val(new Date(data.data.createTime).format("yyyy-MM-dd"));
		              }
	              $("#name").val(data.data.name);
	              $("#memo").val(data.data.memo);
	              if(data.data.status=="audited") {
	                  $("#status").val("已审核");
	              }else if(data.data.status=="audited"){
	                  $("#status").val("未审核");
	              }
	              if(data.data.auditTime!=null&data.data.auditTime!=""){
	                $("#auditTime").val(new Date(data.data.auditTime).format("yyyy-MM-dd"));
	              }	              
	          }
	      }
	  });
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        jQuery(function($)
        {
            jQuery(grid_selector).jqGrid({
                url: 'sale/detail.ajax',
                mtype: 'POST',
                datatype: "json",
                height: 250,
                postData: {"id":"${param.id}"},               
                caption: '产品列表',                
                colNames: ['产品名称', '产品规格', '产品数量', '计量单位', '交期', '图片','备注'],
                colModel: [{
                    name: 'productName',
                    width: 100,
                    sortable: false
                }, {
                    name: 'spec',
                    width: 150,
                    sortable: false
                }, {
                    name: 'productQty',
                    width: 100,
                    sortable: false
                }, {
                    name: 'unit',
                    width: 100,
                    sortable: false
                }, {
                    name: 'deliverDate',
                    width: 100,
                    sortable: false,
                    formatter: function(cellvalue, options, rowObject)
                    {
                        if(cellvalue != null && cellvalue != "undefined") {
                            return new Date(cellvalue).format("yyyy-MM-dd");
                        }else {
                            return "-";
                        }
                    }
                }, {
                    name: 'photo',
                    width: 100,
                    sortable: false,
                    formatter: function(cellvalue, options, rowObject)
                    {	
                        var a = "";
                        if(cellvalue != null && cellvalue != "undefined") {
                            a = '<ul class="ace-thumbnails"><li><a href="'+cellvalue+'" title="'+rowObject.productName+'" data-rel="colorbox">'+
                            '<img alt="150x150"  class="product-img" src="'+cellvalue+'" /></a></li></ul>';				
                    			
                        }
                        return a;
                    }
                }, {
                    name: 'memo',
                    width: 100,
                    sortable: false
                }],
                viewrecords: true,
                rowNum: 10,
                rowList: [10, 20, 30],
                pager: pager_selector,
                multiselect: false,
                loadComplete: function(data)
                {                    
                    var table = this;                   
                    setTimeout(function()
                    {
                        updatePagerIcons(table);
                        enableTooltips(table);
                    }, 0);
           			var colorbox_params = {
           				reposition:true,
           				scalePhotos:true,
           				scrolling:false,
           				previous:'<i class="icon-arrow-left"></i>',
           				next:'<i class="icon-arrow-right"></i>',
           				close:'&times;',
           				current:'{current} of {total}',
           				maxWidth:'100%',
           				maxHeight:'100%',
           				onOpen:function(){
           					document.body.style.overflow = 'hidden';
           				},
           				onClosed:function(){
           					document.body.style.overflow = 'auto';
           				},
           				onComplete:function(){
           					$.colorbox.resize();
           				}
           			};
           		
           			$('td .ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
           			$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");
                },
                autowidth: true

            });

            function beforeDeleteCallback(e)
            {
                var form = $(e[0]);
                if(form.data('styled')) return false;

                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_delete_form(form);

                form.data('styled', true);
            }

            function beforeEditCallback(e)
            {
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_edit_form(form);
            }

            //replace icons with FontAwesome icons like above
            function updatePagerIcons(table)
            {
                var replacement = {
                    'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
                    'ui-icon-seek-prev': 'icon-angle-left bigger-140',
                    'ui-icon-seek-next': 'icon-angle-right bigger-140',
                    'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
                };
                $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function()
                {
                    var icon = $(this);
                    var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

                    if($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
                })
            }

            function enableTooltips(table)
            {
                $('.navtable .ui-pg-button').tooltip({
                    container: 'body'
                });
                $(table).find('.ui-pg-div').tooltip({
                    container: 'body'
                });
            }

        });
    </script>
</body>
</html>
