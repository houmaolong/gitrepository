package com.huayin.coms.service;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.model.User;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.UserVo;

public interface IUserService
{

	User get(Integer id);

	Page<UserVo> queryPage(Page<UserVo> page);

	void add(User user) throws ServiceException;

	void del(Integer[] ids);

	void update(User user);

	User login(String username, String password) throws ServiceException;

	UserVo getVo(Integer id);

	void updatePassword(String password, String old_password)throws ServiceException;

}
