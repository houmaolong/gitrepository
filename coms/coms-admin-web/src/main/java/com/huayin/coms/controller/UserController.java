package com.huayin.coms.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.mapper.CommonMapper;
import com.huayin.coms.model.User;
import com.huayin.coms.service.IUserService;
import com.huayin.coms.util.UserUtils;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.UserVo;

@Controller
public class UserController extends BasicController
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	@Qualifier("userService")
	private IUserService userService;

	@Autowired
	@Qualifier("commonMapper")
	private CommonMapper commonMapper;

	@RequestMapping(value = "/user/get.ajax")
	@ResponseBody
	public Map<String, Object> get(Integer id)
	{
		try
		{
			User user = userService.get(id);
			return super.success(user);
		}
		catch (Exception e)
		{
			logger.error("查询详情出错", e);
			return super.fail("查询详情发生系统错误");
		}
	}

	@RequestMapping(value = "/user/add.ajax")
	@ResponseBody
	public Map<String, Object> add(User user)
	{
		try
		{
			userService.add(user);
			return super.success();
		}catch (ServiceException e)
		{
			return super.fail(e.getMessage());
		}
		catch (Exception e)
		{
			logger.error("新增用户出错", e);
			return super.fail("新增用户发生系统错误");
		}
	}

	@RequestMapping(value = "/user/update.ajax")
	@ResponseBody
	public Map<String, Object> update(User user)
	{
		try
		{
			userService.update(user);
			return super.success();
		}
		catch (ServiceException e)
		{
			return super.fail(e.getMessage());
		}catch (Exception e)
		{
			logger.error("修改用户出错", e);
			return super.fail("修改用户发生系统错误");
		}
	}
	
	@RequestMapping(value = "/sys/updatePassword.ajax")
	@ResponseBody
	public Map<String, Object> updatePassword(String old_password,String password)
	{
		try
		{
			userService.updatePassword(password,old_password);
			UserUtils.removeSessionUser();//清除session 退出
			return super.success();
		}
		catch (ServiceException e)
		{
			logger.error("修改密码出错");
			return super.fail(e.getMessage());
		}
	}

	@RequestMapping(value = "/user/del.ajax")
	@ResponseBody
	public Map<String, Object> add(@RequestParam("ids[]") Integer[] ids)
	{
		try
		{
			userService.del(ids);
			return super.success("成功删除" + ids.length + "条记录!");
		}
		catch (ServiceException e)
		{
			logger.error("删除用户出错", e);
			return super.fail("删除用户发生系统错误");
		}
	}

	@RequestMapping(value = "/user/list.ajax")
	@ResponseBody
	public Map<String, Object> list(Page<UserVo> page)
	{
		try
		{
			Page<UserVo> pageData = userService.queryPage(page);
			return super.page(pageData);
		}
		catch (ServiceException e)
		{
			logger.error("查询列表出错", e);
			return super.fail("查询列表发生系统错误");
		}
	}
	
	@RequestMapping(value = "/sys/session.ajax")
	@ResponseBody
	public Map<String, Object> sessionUser()
	{
		try
		{
			Integer id = UserUtils.getSessionUser().getId();
			return super.success(userService.getVo(id));
		}
		catch (Exception e)
		{
			logger.error("查询详情出错", e);
			return super.fail("查询详情发生系统错误");
		}
	}

	@RequestMapping(value = "/sys/login.ajax")
	@ResponseBody
	public Map<String, Object> login(String username, String password)
	{
		try
		{
			User user = userService.login(username, password);
			if (user == null)
			{
				return super.fail("用户名或密码不正确!");
			}
			if (user.getIsDisable() == 0)
			{
				return super.fail("用户已停用,请联系管理员");
			}
			user.setPassword(null);// session不需要缓存密码
			UserUtils.addSessionUser(user);
			return super.success("登录成功");
		}
		catch (ServiceException e)
		{
			logger.error("系统异常，稍后再试...");
			return super.fail("系统异常，稍后再试...");
		}
	}

	@RequestMapping(value = "/sys/logout.ajax")
	public String logout()
	{
		User user = UserUtils.getSessionUser();
		if (user != null)
		{
			UserUtils.removeSessionUser();
			logger.info("用户:".concat(user.getName()).concat("在 ")
					.concat(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())).concat("退出"));
		}
		return "redirect:/pages/login.jsp";
	}
}