package com.huayin.coms.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.huayin.coms.model.User;

public class UserUtils
{
public static User getSessionUser(){
	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	User user=(User)request.getSession().getAttribute(Constant.SESSION_USER);
	return user;
}
public static void removeSessionUser(){
	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	request.getSession().removeAttribute(Constant.SESSION_USER);
}
public static void addSessionUser(User user){
	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	request.getSession().setAttribute(Constant.SESSION_USER,user);
}
}
