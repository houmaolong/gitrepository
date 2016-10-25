package com.huayin.coms.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.mapper.CommonMapper;
import com.huayin.coms.mapper.CustomerMapper;
import com.huayin.coms.model.Customer;
import com.huayin.coms.model.CustomerExample;
import com.huayin.coms.util.UserUtils;

 
@Controller
public class CustomerController  extends BasicController{
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	@Qualifier("customerMapper")
	private CustomerMapper customerMapper;
	@Autowired
	@Qualifier("commonMapper")
	private CommonMapper commonMapper;
	
	@RequestMapping(value = "/customer/list.ajax")
	@ResponseBody
	public Map<String, Object> list() {
		try {
			CustomerExample example=new CustomerExample();
			List<Customer> list=customerMapper.selectByExample(example);
			return super.success(list);
		} catch (ServiceException e) {
			logger.error("查询客户列表出错", e);
			return super.fail("查询客户列表发生系统错误");
		}
	}
	@RequestMapping(value = "/sys/getCustomer.ajax")
	@ResponseBody
	public Map<String, Object> getCustomer() {
		try {
			Map<String, Object> map=commonMapper.selectCustomerById(UserUtils.getSessionUser().getCustomerId());
			return super.success(map);
		} catch (ServiceException e) {
			logger.error("查询客户详情出错", e);
			return super.fail("查询客户详情发生系统错误");
		}
	}
	@RequestMapping(value = "/sys/getAddress.ajax")
	@ResponseBody
	public Map<String, Object> getAddress() {
		try {
			List<Map<String, Object>> list=commonMapper.selectAddressByCustomerId(UserUtils.getSessionUser().getCustomerId());
			return super.success(list);
		} catch (ServiceException e) {
			logger.error("查询客户详情出错", e);
			return super.fail("查询客户详情发生系统错误");
		}
	}


}