package com.huayin.coms.vo;

import java.util.ArrayList;
import java.util.List;

import com.huayin.coms.model.SaleOrder;
import com.huayin.coms.model.SaleOrderDetail;

public class SaleOrderVo extends SaleOrder
{
	private List<SaleOrderDetail> details = new ArrayList<SaleOrderDetail>();

	public List<SaleOrderDetail> getDetails()
	{
		return details;
	}

	public void setDetails(List<SaleOrderDetail> details)
	{
		this.details = details;
	}
	
}
