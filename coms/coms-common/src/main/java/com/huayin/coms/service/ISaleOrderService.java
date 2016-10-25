package com.huayin.coms.service;

import java.util.List;
import java.util.Map;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.model.SaleOrder;
import com.huayin.coms.model.SaleOrderDetail;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.SaleOrderVo;

public interface ISaleOrderService
{

	Map<String, Object> get(Integer id);

	Page<Map<String,Object>> queryPage(Page<Map<String,Object>> page);

	void add(SaleOrder order) throws ServiceException;

	void del(Integer[] ids);

	void updateToAudited(Integer[] ids);

	void updateToUnaudit(Integer[] ids);

	List<Map<String, Object>> getDetailList(Integer id);

	void addProduct(SaleOrderDetail detail);

	SaleOrderDetail getDetail(Integer id);

	void updateDetail(SaleOrderDetail detail);

	void delDetail(Integer[] ids);

	List<Map<String, Object>> getUnitlList();

	void add(SaleOrder order, List<SaleOrderDetail> details);

	void update(SaleOrderVo order, List<SaleOrderDetail> details);

	Page<Map<String, Object>> queryDetailPage(Page<Map<String, Object>> page);
    
	
}
