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
			<li class="active">订单明细</li>
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
        });
    </script>
	<script type="text/javascript">
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        jQuery(function($)
        {
            jQuery(grid_selector).jqGrid({
                url: 'sale/detail_list.ajax',
                mtype: 'POST',
                datatype: "json",
                height: 321,
                postData: $("#search-form").serializeJson(),
                caption: '订单明细列表',
                colNames: ['销售订单号', '客户名称', '产品名称', '产品规格', '产品数量', '计量单位', '交货日期', '图片', '审核状态','制单日期','审核时间', '备注'],
                colModel: [{
                    name: 'serialNumber',
                    width: 150,
                    sortable: false
                }, {
                    name: 'customerName',
                    width: 200,
                    sortable: false
                }, {
                    name: 'productName',
                    width: 100,
                    sortable: false
                }, {
                    name: 'spec',
                    width: 120,
                    sortable: false
                }, {
                    name: 'qty',
                    width: 120,
                    sortable: false
                },  {
                    name: 'unit',
                    width: 100,
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
                },{
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
                },{
                    name: 'auditTime',
                    width: 100,
                    sortable: false,
                    formatter: function(cellvalue, options, rowObject)
                    {
                        if(cellvalue != null && cellvalue != "undefined") {
                            return new Date(cellvalue).format("yyyy-MM-dd hh:mm:ss");
                        }else {
                            return "-";
                        }
                    }
                },{
                    name: 'memo',
                    width: 100
                }],
                viewrecords: true,
                rowNum: 10,
                rowList: [10, 20, 30],
                pager: pager_selector,
                multiselect: false,
                ondblClickRow:function (rowid, iRow, iCol, e){
                    window.location.href = "${ctxPath}/modules/sale/detail.jsp?id=" + rowid;
                },
                loadComplete: function()
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
