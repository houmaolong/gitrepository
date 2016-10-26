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
			<li class="active">用户管理</li>
		</ul>
	</div>
	<div class="page-content">
		<div class="page-header">
			<form class="form-inline" id="search-form">
				<label class="inline"> 用户编号： <input type="text"
					name="params['serialNumber']" class="input-big"
					placeholder="用户编号">
				</label> <label class="inline"> 用户名称： <input type="text"
					name="params['name']" class="input-big" placeholder="用户名称">
				</label> <label class="inline"> 所属客户： 
				<select class="input-big" id="customerId"
						name="params['customerId']">
				</select></label>
				<button type="button" class="btn btn-sm btn-info" id="reset-btn">
					<i class="icon-retweet icon-on-left bigger-110"></i>重置
				</button>
				<button type="button" class="btn btn-sm btn-purple" id="search-btn">
					<i class="icon-search icon-on-left bigger-110"></i>查询
				</button>
			</form>
		</div>
		<!-- /.page-header -->
		<a id="add-btn" href="javascript:;" class="btn btn-sm btn-primary"><i class="icon-plus"></i>新增</a>
		<a id="edit-btn" href="javascript:;" class="btn btn-sm btn-success"><i class="icon-edit"></i>编辑</a>
		<a id="del-btn" href="javascript:;" class="btn btn-sm btn-danger"><i class="icon-trash"></i>删除</a>
		<table id="grid-table"></table>

		<div id="grid-pager"></div>

	</div>
	<jsp:include page="/foot.jsp"></jsp:include>
	<script type="text/javascript">
        $(function()
        {
            $("#customerId").selectInit({url:'customer/list.ajax',value:'uguid1',key:"sname"});
            $("#search-btn").click(function()
            {
                $(grid_selector).jqGrid('setGridParam', {
                    postData: $("#search-form").serializeJson(),
                    page: 1
                }).trigger('reloadGrid');
            });
            $("#reset-btn").click(function()
            {
                $("#search-form")[0].reset();
                $(grid_selector).jqGrid('setGridParam', {
                    postData: $("#search-form").serializeJson(),
                    page: 1
                }).trigger('reloadGrid');
            });
            $("#add-btn").click(function()
            {
                window.location.href = window.ctxPath + "/modules/user/add.jsp";
            });
            $("#edit-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length==0){
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                      })
                    return ;
                }
                if(ids.length>1){
                    layer.alert('修改只能选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                      })
                    return ;
                }
                var id = $(grid_selector).jqGrid("getGridParam", "selrow");
                window.location.href = window.ctxPath + "/modules/user/edit.jsp?id="+id;
            });
            $("#del-btn").click(function()
            {
                var ids = $(grid_selector).jqGrid("getGridParam", "selarrrow");
                if(ids.length==0){
                    layer.alert('至少选择一条记录!', {
                        icon: 7,
                        skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                      })
                    return ;
                }
                layer.confirm('确定要删除？', {
                    btn: ['确定', '取消']
                }, function()
                {
                    $.ajax({
                        url: 'user/del.ajax',
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
                url: window.ctxPath + '/user/list.ajax',
                mtype: 'POST',
                datatype: "json",
                height: 321,
                postData: $("#search-form").serializeJson(),
                caption: '用户列表',
                colNames: ['用户编号', '用户名称', '所属客户', '是否停用', '是否管理员账号'],
                colModel: [{
                    name: 'serialNumber',
                    width: 100,
                    sortable: false
                }, {
                    name: 'name',
                    width: 150,
                    sortable: false
                }, {
                    name: 'customerName',
                    width: 150,
                    sortable: false
                }, {
                    name: 'isDisableStr',
                    width: 90 ,
                    sortable: false
                }, {
                    name: 'isAdminStr',
                    width: 90 ,
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
                autowidth: true

            });

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
