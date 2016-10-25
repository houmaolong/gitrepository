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
			<li class="active">订单管理</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">
			<form class="form-inline" id="search-form">
				<label class="inline"> 制单日期： <input type="text"
					name="params['startTime']" class="input-big"
					placeholder="制单开始日期">-<input type="text"
					name="params['endTime']" class="input-big"
					placeholder="制单结束日期">
				<label class="inline"> 销售订单号： <input type="text"
					name="params['serialNumber']" class="input-big"
					placeholder="销售订单号">
				</label> <label class="inline"> 客户名称： <input type="text"
					name="params['customerName']" class="input-big"
					placeholder="客户名称">
				</label>
				<button type="button" class="btn btn-sm btn-info" id="reset-btn">
					<i class="icon-retweet icon-on-left bigger-110"></i>重置
				</button>
				<button type="button" class="btn btn-sm btn-purple" id="search-btn">
					<i class="icon-search icon-on-left bigger-110"></i>查询
				</button>
			</form>
		</div>
		<!-- /.page-header -->
		<button type="button" class="btn btn-sm btn-primary" id="add-btn">
			<i class="icon-plus"></i>新增
		</button>
		<button type="button" class="btn btn-sm btn-warning" id="edit-btn">
			<i class="icon-search"></i>编辑
		</button>
		<button type="button" class="btn btn-sm btn-success" id="detail-btn">
			<i class="icon-search"></i>查看
		</button>
		<button type="button" class="btn btn-sm btn-inverse" id="audit-btn">
			<i class="icon-ok"></i>审核
		</button>
		<button type="button" class="btn btn-sm btn-grey" id="audit-cancel-btn">
			<i class="icon-remove"></i>消审
		</button>
        <button type="button" class="btn btn-sm btn-danger" id="del-btn">
			<i class="icon-trash"></i>删除
		</button>
		<table id="grid-table"></table>

		<div id="grid-pager"></div>

	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(function()
        {
            //搜索
            $("#search-btn").click(function()
            {
                $(grid_selector).jqGrid('setGridParam', {
                    postData: $("#search-form").serializeJson(),
                    page: 1
                }).trigger('reloadGrid');
            });
            //重置搜索
            $("#reset-btn").click(function()
            {
                $("#search-form")[0].reset();
                $(grid_selector).jqGrid('setGridParam', {
                    postData: $("#search-form").serializeJson(),
                    page: 1
                }).trigger('reloadGrid');
            });
            //添加订单
            $("#add-btn").click(function()
            {
                window.location.href = "${ctxPath}/modules/sale/add.jsp";
            });
            //查看订单
            $("#detail-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length == 0) {
                    layer.alert('请选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                if(ids.length > 1) {
                    layer.alert('查看只能选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                var id = $(grid_selector).jqGrid("getGridParam", "selrow");
                var rowData = $(grid_selector).jqGrid("getRowData", id);
                window.location.href = "${ctxPath}/modules/sale/detail.jsp?id=" + id ;
            });
            //编辑订单
            $("#edit-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length == 0) {
                    layer.alert('请选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                if(ids.length > 1) {
                    layer.alert('编辑只能选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                var id = $(grid_selector).jqGrid("getGridParam", "selrow");
                var rowData = $(grid_selector).jqGrid("getRowData", id);
                if(rowData.status != "未审核") {
                    layer.alert('编辑只能选择未审核记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                window.location.href = "${ctxPath}/modules/sale/edit.jsp?id=" + id ;
            });
            //删除订单
            $("#del-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length == 0) {
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                for(var i = 0; i < ids.length; i++) {
                    var rowData = $(grid_selector).jqGrid("getRowData", ids[i]);
                    //console.log(rowData)
                    if(rowData.status != "未审核") {
                        layer.msg('请确认选中订单都为未审核状态!', {
                            time: 2000,
                            icon: 5
                        });
                       return;
                    }
                }
                layer.confirm('确定要删除？', {
                    btn: ['确定', '取消']
                }, function()
                {
                    $.ajax({
                        url: 'sale/del.ajax',
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
            //审核
            $("#audit-btn").click(function()
            {
                var flag = true;
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length == 0) {
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                for(var i = 0; i < ids.length; i++) {
                    var rowData = $(grid_selector).jqGrid("getRowData", ids[i]);
                    //console.log(rowData)
                    if(rowData.status != "未审核") {
                        flag = false;
                        break;
                    }
                }
                if(flag == false) {
                    layer.msg('请确认选中订单都为未审核状态!', {
                        time: 2000,
                        icon: 5
                    });
                    return;
                }

                layer.confirm('确定审核选中订单？', {
                    btn: ['确定', '取消']
                }, function()
                {
                    $.ajax({
                        url: 'sale/updateToAudited.ajax',
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
                                layer.msg(data.msg, {
                                    icon: 7
                                });
                            }
                        }
                    });
                });

            });
            //消审
            $("#audit-cancel-btn").click(function()
            {
                var flag = true;
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length == 0) {
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon'
                    })
                    return;
                }
                for(var i = 0; i < ids.length; i++) {
                    var rowData = $(grid_selector).jqGrid("getRowData", ids[i]);
                    console.log(rowData)
                    if(rowData.status != "已审核") {
                        flag = false;
                        break;
                    }
                }
                if(flag == false) {
                    layer.msg('请确认选中订单都为已审核状态!', {
                        time: 2000,
                        icon: 5
                    });
                    return;
                }

                layer.confirm('确定消审选中订单？', {
                    btn: ['确定', '取消']
                }, function()
                {
                    $.ajax({
                        url: 'sale/updateToUnaudit.ajax',
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
                                layer.msg(data.msg, {
                                    icon: 7
                                });
                            }
                        }
                    });
                });

            });
        });
    </script>
	<script type="text/javascript">
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        jQuery(function($)
        {
            jQuery(grid_selector).jqGrid({
                url: 'sale/list.ajax',
                mtype: 'POST',
                datatype: "json",
                height: 321,
                postData: $("#search-form").serializeJson(),
                caption: '订单列表',
                colNames: ['销售订单号', '客户名称', '联系人员', '联系电话', '送货地址', '交货日期', '制单人','制单日期', '审核状态', '审核时间', '备注'],
                colModel: [{
                    name: 'serialNumber',
                    width: 150,
                    sortable: false
                }, {
                    name: 'customerName',
                    width: 200,
                    sortable: false
                }, {
                    name: 'linkName',
                    width: 100,
                    sortable: false
                }, {
                    name: 'linkMobile',
                    width: 120,
                    sortable: false
                }, {
                    name: 'deliverAddress',
                    width: 230,
                    sortable: false
                }, {
                    name: 'deliveryDate',
                    width: 120,
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
                    name: 'name',
                    width: 100,
                    sortable: false
                }, {
                    name: 'createTime',
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
                    name: 'status',
                    width: 100,
                    sortable: false,
                    formatter: function(cellvalue, options, rowObject)
                    {
                        var statu = "未审核";
                        if(cellvalue == "audited") {
                            statu = "已审核";
                        }else if(cellvalue == "unaudit") {
                            statu = "未审核"
                        }else if(cellvalue == "completed") {
                            statu = "已受理"
                        }
                        return statu;
                    }
                }, {
                    name: 'auditTime',
                    width: 190,
                    sortable: false,
                    formatter: function(cellvalue, options, rowObject)
                    {
                        if(cellvalue != null && cellvalue != "undefined") {
                            return new Date(cellvalue).format("yyyy-MM-dd hh:mm:ss");
                        }else {
                            return "-";
                        }
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
                multiselect: true,
                loadComplete: function()
                {
                    var table = this;
                    setTimeout(function()
                    {
                        updatePagerIcons(table);
                        enableTooltips(table);
                    }, 0);
                },
                ondblClickRow:function(id){
                    window.location.href = "${ctxPath}/modules/sale/detail.jsp?id=" + id ;
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
