package com.huayin.coms.vo;

import com.huayin.coms.model.User;

public class UserVo extends User
{

	private String customerName;

	public String getCustomerName()
	{
		return customerName;
	}

	public void setCustomerName(String customerName)
	{
		this.customerName = customerName;
	}

	public String getIsAdminStr(){
		if(getIsAdmin()==1){
			return "是";
		}
		return "否";
	}
	public String getIsDisableStr(){
		if(getIsDisable()==0){
			return "是";
		}
		return "否";
	}
}
