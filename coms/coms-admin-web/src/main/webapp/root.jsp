<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setCharacterEncoding("utf-8");
out.println("<meta charset=\"utf-8\" />");
out.println("<title>上海振创客户订单系统</title>");
out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />");
//如果使用apache反向代理来分发请求从"X-FORWARDED-HOST"头取应用外网入口地址
String portalHost =  request.getHeader("X-FORWARDED-HOST");
if(portalHost == null || "".equals(portalHost.trim())){//使用其他方式
	portalHost = request.getHeader("HOST");
}else{
	portalHost = portalHost.split(",")[0];
} 
String accessAddr = request.getScheme() + "://" + portalHost +  request.getContextPath() + "/"; 
out.println("<base href= '" +  accessAddr + "' />"); 

out.println("<!-- basic styles -->");
out.println("<link href=\"assets/css/bootstrap.min.css\" rel=\"stylesheet\" />");
out.println("<link href=\"assets/css/bootstrap-datetimepicker.min.css\" rel=\"stylesheet\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/font-awesome.min.css\" />");

out.println("<!--[if IE 7]>");
out.println("<link rel=\"stylesheet\" href=\"assets/css/font-awesome-ie7.min.css\" />");
out.println("<![endif]-->");

out.println("<!-- page specific plugin styles -->");

out.println("<!-- fonts -->");
out.println("<link rel=\"stylesheet\" href=\"assets/css/jquery-ui-1.10.3.full.min.css\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/datepicker.css\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/ui.jqgrid.css\" />");

out.println("<link rel=\"stylesheet\" href=\"http://fonts.googleapis.com/css?family=Open+Sans:400,300\" />");

out.println("<!-- ace styles -->");

out.println("<link rel=\"stylesheet\" href=\"assets/css/colorbox.css\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/ace.min.css\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/ace-rtl.min.css\" />");
out.println("<link rel=\"stylesheet\" href=\"assets/css/ace-skins.min.css\" />");

out.println("<!--[if lte IE 8]>");
out.println("<link rel=\"stylesheet\" href=\"assets/css/ace-ie.min.css\" />");
out.println("<![endif]-->");

out.println("<!-- inline styles related to this page -->");

out.println("<!-- ace settings handler -->");

out.println("<script src=\"assets/js/ace-extra.min.js\"></script>");

out.println("<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->");

out.println("<!--[if lt IE 9]>");
out.println("<script src=\"assets/js/html5shiv.js\"></script>");
out.println("<script src=\"assets/js/respond.min.js\"></script>");
out.println("<![endif]-->");

String ctxPath = request.getContextPath();
request.setAttribute("ctxPath", ctxPath);
%>
<script>
	window.ctxPath = "<%= ctxPath%>";
</script>
