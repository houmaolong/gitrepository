package com.huayin.coms.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.mapper.CustomerMapper;
import com.huayin.coms.mapper.UserMapper;
import com.huayin.coms.model.Customer;
import com.huayin.coms.model.User;
import com.huayin.coms.model.UserExample;
import com.huayin.coms.model.UserExample.Criteria;
import com.huayin.coms.service.IUserService;
import com.huayin.coms.util.UserUtils;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.UserVo;

@Service("userService")
public class UserService extends BasicService implements IUserService
{
	private Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	@Qualifier("userMapper")
	UserMapper userMapper;

	@Autowired
	@Qualifier("customerMapper")
	CustomerMapper customerMapper;

	public User get(Integer id)
	{
		return userMapper.selectByPrimaryKey(id);
	}

	public Page<UserVo> queryPage(Page<UserVo> page)
	{
		try
		{
			Map<String, Object> params = page.getParams();
			UserExample example = new UserExample();
			example.setOrderByClause("id desc");
			Criteria criteria = example.createCriteria();
			criteria.andIdNotEqualTo(UserUtils.getSessionUser().getId());
			User user=UserUtils.getSessionUser();
			if(user.getIsAdmin()!=1){
				//非管理员查询和自己同一个客户的用户
				criteria.andCustomerIdEqualTo(user.getCustomerId());
			}
			if (!StringUtils.isEmpty(params.get("customerId")))
			{
				criteria.andCustomerIdEqualTo(params.get("customerId").toString());
			}
			if (!StringUtils.isEmpty(params.get("serialNumber")))
			{
				criteria.andSerialNumberLike("%".concat(params.get("serialNumber").toString()).concat("%"));
			}
			if (!StringUtils.isEmpty(params.get("name")))
			{
				criteria.andNameLike("%".concat(params.get("name").toString()).concat("%"));
			}
			Integer count = userMapper.countByExample(example);
			List<User> list = userMapper.selectByExampleWithPage(example, (page.getPage() - 1) * page.getRows()+1,
					page.getPage() * page.getRows());

			page.setRecords(count);
			page.setDatas(assembly(list));

		}
		catch (Exception e)
		{
			logger.error("查询用户列表发生系统错误", e);
			throw new ServiceException("查询用户列表发生系统错误", e);
		}
		return page;

	}

	private List<UserVo> assembly(List<User> list) throws IllegalAccessException, InvocationTargetException
	{
		List<UserVo> listVo = new ArrayList<UserVo>();
		for (User user : list)
		{
			listVo.add(assembly(user));
		}
		return listVo;
	}

	private UserVo assembly(User user) throws IllegalAccessException, InvocationTargetException
	{
		UserVo userVo = new UserVo();
		BeanUtils.copyProperties(userVo, user);
		Customer customer = customerMapper.selectByPrimaryKey(user.getCustomerId());
		if (customer != null)
		{
			userVo.setCustomerName(customer.getSname()+"("+customer.getScode()+")");
		}
		userVo.setPassword(null);
		return userVo;
	}

	@Transactional(rollbackFor = ServiceException.class)
	public void add(User user) throws ServiceException
	{
		try
		{
			UserExample example=new UserExample();
			example.createCriteria().andNameEqualTo(user.getName());
			List<User> checUsers=userMapper.selectByExample(example);
			if(checUsers.size()>0){
				throw new ServiceException("用户名已经存在!");
			}
			user.setAliasName(user.getName());
			user.setSerialNumber(new SimpleDateFormat("yyyyMMddhhMMSS").format(new Date()));// 产生编号
			userMapper.insertSelective(user);
		}catch (ServiceException e)
		{
			throw e;
		}
		catch (Exception e)
		{
			logger.error("新增用户发生业务逻辑错误", e);
			throw new ServiceException("新增用户发生业务逻辑错误", e);
		}
	}

	@Transactional(rollbackFor = ServiceException.class)
	public void del(Integer[] ids)
	{
		try
		{
			for (Integer id : ids)
			{
				userMapper.deleteByPrimaryKey(id);
			}
		}
		catch (Exception e)
		{
			logger.error("删除用户发生业务逻辑错误", e);
			throw new ServiceException("删除用户发生业务逻辑错误", e);
		}

	}

	@Transactional(rollbackFor = ServiceException.class)
	public void update(User user)
	{
		try
		{
			UserExample example=new UserExample();
			example.createCriteria().andNameEqualTo(user.getName()).andIdNotEqualTo(user.getId());
			List<User> checUsers=userMapper.selectByExample(example);
			if(checUsers.size()>0){
				throw new ServiceException("用户名已经存在!");
			}
			userMapper.updateByPrimaryKeySelective(user);
		}catch (ServiceException e)
		{
			throw new ServiceException("用户名已存在", e);
		}
		catch (Exception e)
		{
			logger.error("修改用户发生业务逻辑错误", e);
			throw new ServiceException("修改用户发生业务逻辑错误", e);
		}
	}

	public User login(String username, String password) throws ServiceException
	{
		UserExample example = new UserExample();
		example.createCriteria().andNameEqualTo(username).andPasswordEqualTo(password);
		List<User> list = userMapper.selectByExample(example);
		if (list.size() == 0)
		{
			return null;
		}
		return userMapper.selectByExample(example).get(0);

	}

	public UserVo getVo(Integer id)
	{
		try
		{
			User user = get(id);
			return assembly(user);
		}
		catch (Exception e)
		{
			logger.error("查询详细发生业务逻辑错误", e);
		}
		return null;
	}

	public void updatePassword(String password, String old_password) throws ServiceException
	{
		try
		{
			User user = UserUtils.getSessionUser();
			user = this.get(user.getId());
			if (!user.getPassword().equals(old_password))
			{
				throw new ServiceException("旧密码不正确");
			}
			user.setPassword(password);
			userMapper.updateByPrimaryKeySelective(user);
		}
		catch (ServiceException e)
		{
			logger.error("旧密码不正确");
			throw e;
		}
		catch (Exception e)
		{
			logger.error("修改密码发生业务逻辑错误", e);
			throw new ServiceException("修改密码发生业务逻辑错误", e);
		}
	}

}
