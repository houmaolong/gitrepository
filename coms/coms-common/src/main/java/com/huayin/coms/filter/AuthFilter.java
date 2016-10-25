package com.huayin.coms.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.huayin.coms.model.User;
import com.huayin.coms.util.Constant;

public class AuthFilter implements Filter
{
	private Logger logger =LoggerFactory.getLogger(AuthFilter.class);
	public void init(FilterConfig filterConfig) throws ServletException
	{
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException
	{
		HttpServletRequest httpRequest=(HttpServletRequest)request;
		HttpServletResponse httpResponse=(HttpServletResponse)response;
		String url=httpRequest.getRequestURI();
		logger.debug("当前请求URL："+url);
		//系统请求不验证
		if(url.endsWith(".ajax")&&url.contains("/sys/")){
			chain.doFilter(request, response);
			return;
		}
		User user=(User)httpRequest.getSession().getAttribute(Constant.SESSION_USER);
		//未登录统状态跳转登录页面 (不包含登录页面)
		if(!url.contains("login.jsp")&&user==null){
			 //1:判断是否是ajax请求
            if (url.endsWith(".ajax")) {   
            	httpResponse.setCharacterEncoding("UTF-8");  
            	httpResponse.setContentType("application/json; charset=utf-8"); 
            	PrintWriter  out = response.getWriter();  
            	out.append("{success:false,msg:'用户未登录'}");  
                logger.debug("ajax request");
                return ;
            }
			httpResponse.sendRedirect(httpRequest.getContextPath().concat("/pages/login.jsp"));
			return;
		}
		//非系统管理不能访问用户管理
		if(url.contains("/user/")&&user.getIsAdmin()!=1){
			 if (url.endsWith(".ajax")) {   
	            	httpResponse.setCharacterEncoding("UTF-8");  
	            	httpResponse.setContentType("application/json; charset=utf-8"); 
	            	PrintWriter  out = response.getWriter();  
	            	out.append("{success:false,msg:'用户没有访问权限'}");  
	                logger.debug("ajax request");
	                return ;
	            }
			httpResponse.sendRedirect(httpRequest.getContextPath().concat("/pages/noAuthority.html"));
			return;
		}
		chain.doFilter(request, response);
	}

	public void destroy()
	{
	}

}
