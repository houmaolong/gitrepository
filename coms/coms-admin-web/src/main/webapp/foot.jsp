<%@page import="org.apache.logging.log4j.core.script.Script"%>
<%@page contentType="java" pageEncoding="utf-8"%>

<%
	response.setCharacterEncoding("utf-8");
	out.println("<!-- basic scripts -->");

	out.println("<!--[if !IE]> -->");

	out.println("<script src=\"assets/js/jquery-1.10.2.min.js\"></script>");
	out.println("<script src=\"assets/js/jquery.colorbox-min.js\"></script>");
	out.println("<script src=\"assets/js/uploadPreview.js\"></script>");
	
	out.println("<!-- <![endif]-->");

	out.println("<!--[if IE]>");
	out.println("<script src=\"assets/js/jquery-1.10.2.min.js\"></script>");
	out.println("<![endif]-->");

	out.println("<!--[if !IE]> -->");

	out.println("<script type=\"text/javascript\">");
	out.println("window.jQuery || document.write(\"<script src='assets/js/jquery-2.0.3.min.js'>\" + \"<\"+\"/script>\");");
	out.println("</script>");

	out.println("<!-- <![endif]-->");

	out.println("<!--[if IE]>");
	out.println("<script type=\"text/javascript\">");
	out.println("window.jQuery || document.write(\"<script src='assets/js/jquery-1.10.2.min.js'>\"+\"<\"+\"/script>\");");
	out.println("</script>");
	out.println("<![endif]-->");
	out.println("<script type=\"text/javascript\">");
	out.println("if(\"ontouchend\" in document) document.write(\"<script src='assets/js/jquery.mobile.custom.min.js'>\" + \"<\"+\"/script>\");");
	out.println("</script>");
	out.println("<script src=\"assets/js/bootstrap.min.js\"></script>");
	out.println("<script src=\"assets/js/typeahead-bs2.min.js\"></script>");

	out.println("<!-- page specific plugin scripts -->");

	out.println("<script src=\"assets/js/date-time/bootstrap-datetimepicker.min.js\"></script>");
	out.println("<script src=\"assets/js/date-time/bootstrap-datetimepicker.zh-CN.js\"></script>");	
	out.println("<script src=\"assets/js/jqGrid/jquery.jqGrid.min.js\"></script>");
	out.println("<script src=\"assets/js/jqGrid/i18n/grid.locale-en.js\"></script>");

	out.println("<!-- ace scripts -->");

	out.println("<script src=\"assets/js/ace-elements.min.js\"></script>");
	out.println("<script src=\"assets/js/ace.min.js\"></script>");
	out.println("<script src=\"assets/js/jquery.validate.min.js\"></script>");
	out.println("<script src=\"layer-v2.4/layer/layer.js\"></script>");
	out.println("<script src=\"plug-js/jQuery.md5.js\"></script>");
	out.println("<script src=\"common/jquery.form.js\"></script>");
%>
<script type="text/javascript">
jQuery.extend(jQuery.jgrid.defaults,{pgtext : "第{0}页 共{1}页",loadtext : "加载中...",emptyrecords : "暂时没有数据...",recordtext: "{0}-{1} 共{2}条"});
$.ajaxSetup({
  async: false
});
$.fn.extend({
serializeJson : function() {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function() {
          if (o[this.name] !== undefined) {
              if (!o[this.name].push) {
                  o[this.name] = [o[this.name]];
              }
              o[this.name].push(this.value || '');
          } else {
              o[this.name] = this.value || '';
          }
      });
      return o;
  },
  selectInit:function (opt){
                var _THIS=this;
                $.ajax({
                    url: opt.url,
                    type: 'POST',
                    dataType: 'json',
                    success: function(data)
                    {
                        if(data.success==true) {
                        $(_THIS).empty();
                           var option="<option value=''>--请选择--</option>";
                           $.each(data.data,function (index,item){
                               option+="<option value='"+item[opt.value]+"'>"+item[opt.key]+(item.scode!=undefined?'('+item.scode+')':'')+"</option>";
                           });
                           $(_THIS).append(option);
                        }
                    }
                }); 
    }
});

 Date.prototype.format = function (fmt) { //author: meizz 
        var o = {
                        "M+": this.getMonth() + 1, //月份 
                        "d+": this.getDate(), //日 
                        "h+": this.getHours(), //小时 
                        "m+": this.getMinutes(), //分 
                        "s+": this.getSeconds(), //秒 
                        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
                        "S": this.getMilliseconds() //毫秒 
                    };
                    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                    for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                    return fmt;
                }
</script>