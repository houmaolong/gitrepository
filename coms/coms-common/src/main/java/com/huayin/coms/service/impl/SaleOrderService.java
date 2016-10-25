package com.huayin.coms.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.mapper.CommonMapper;
import com.huayin.coms.mapper.SaleOrderDetailMapper;
import com.huayin.coms.mapper.SaleOrderMapper;
import com.huayin.coms.model.SaleOrder;
import com.huayin.coms.model.SaleOrderDetail;
import com.huayin.coms.model.SaleOrderDetailExample;
import com.huayin.coms.service.ISaleOrderService;
import com.huayin.coms.util.UserUtils;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.SaleOrderVo;
@Service("saleOrderService")
public class SaleOrderService extends BasicService implements ISaleOrderService
{
	private Logger logger=LoggerFactory.getLogger(SaleOrderService.class);
	
	@Autowired
	@Qualifier("saleOrderMapper")
	SaleOrderMapper saleOrderMapper;
	@Autowired
	@Qualifier("saleOrderDetailMapper")
	SaleOrderDetailMapper saleOrderDetailMapper;
	@Autowired
	@Qualifier("commonMapper")
	CommonMapper commonMapper;
	public Map<String,Object> get(Integer id)
	{
		return commonMapper.selectSaleOrderByPrimaryKey(id);
	}
	public Page<Map<String,Object>> queryPage(Page<Map<String,Object>> page)
	{
		Map<String,Object> params=page.getParams();
		if(UserUtils.getSessionUser().getIsAdmin()!=1){
			params.put("createUserId", UserUtils.getSessionUser().getId());
		}
		Integer count=commonMapper.countSaleOrderByCondition(params);
		List<Map<String,Object>> list=commonMapper.selectSaleOrderByConditionWithPage(params, (page.getPage()-1)*page.getRows()+1, page.getPage()*page.getRows());
		page.setRecords(count);
		page.setDatas(list);
		return page;
	}
	@Transactional(rollbackFor=ServiceException.class)
	public void add(SaleOrder saleOrder) throws ServiceException
	{
		try
		{
			saleOrder.setCreateTime(new Date());
			saleOrder.setCreateUserId(UserUtils.getSessionUser().getId());
			saleOrder.setSerialNumber(new SimpleDateFormat("yyyyMMddhhMMSS").format(new Date()));//产生编号
			saleOrderMapper.insertSelective(saleOrder);
		}
		catch (Exception e)
		{
			logger.error("新增销售订单发生业务逻辑错误", e);
			throw new ServiceException("新增销售订单发生业务逻辑错误", e);
		}
	}
	
	@Override
	@Transactional(rollbackFor=ServiceException.class)
	public void add(SaleOrder order, List<SaleOrderDetail> details)
	{
		try
		{
			add(order);
			for(SaleOrderDetail detail:details){
				if(!StringUtils.isEmpty(detail.getProductName())){
					detail.setMasterId(order.getId());
					addProduct(detail);
				}
			}
		}
		catch (ServiceException e)
		{
			logger.error("新增销售订单发生业务逻辑错误", e);
			throw new ServiceException("新增销售订单发生业务逻辑错误", e);
		}
	}

	@Transactional(rollbackFor=ServiceException.class)
	public void del(Integer[] ids)
	{
		try
		{
			for (Integer id : ids)
			{
				saleOrderMapper.deleteByPrimaryKey(id);
				commonMapper.deleteByForeignKey(id);
			}
		}
		catch (Exception e)
		{
			logger.error("删除销售订单发生业务逻辑错误", e);
			throw new ServiceException("删除销售订单发生业务逻辑错误", e);
		}
		
	}
	//审核
	@Override
	@Transactional(rollbackFor=ServiceException.class)
	public void updateToAudited(Integer[] ids)
	{
		try
		{			
			for (Integer id : ids)
			{
				commonMapper.updateToAudited(id);
			}
		}
		catch (Exception e)
		{
			logger.error("修改审核状态发生业务逻辑错误", e);
			throw new ServiceException("修改审核状态发生业务逻辑错误", e);
		}
	}
	//消审
	@Override
	@Transactional(rollbackFor=ServiceException.class)
	public void updateToUnaudit(Integer[] ids)
	{
		try
		{			
			for (Integer id : ids)
			{
				commonMapper.updateToUnaudit(id);
			}
		}
		catch (Exception e)
		{
			logger.error("修改审核状态发生业务逻辑错误", e);
			throw new ServiceException("修改审核状态发生业务逻辑错误", e);
		}
	}
	@Override
	public List<Map<String, Object>> getDetailList(Integer id)
	{
		return commonMapper.getDetailListById(id);
	}
	@Override
	public void addProduct(SaleOrderDetail detail)
	{
		saleOrderDetailMapper.insertSelective(detail);
	}
	@Override
	public SaleOrderDetail getDetail(Integer id)
	{
		return saleOrderDetailMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateDetail(SaleOrderDetail detail)
	{
		saleOrderDetailMapper.updateByPrimaryKeySelective(detail);
	}
	@Override
	@Transactional(rollbackFor=ServiceException.class)
	public void delDetail(Integer[] ids)
	{
		try
		{
			for (Integer id : ids)
			{
				saleOrderDetailMapper.deleteByPrimaryKey(id);
			}
		}
		catch (Exception e)
		{
			logger.error("删除详情发生业务逻辑错误", e);
			throw new ServiceException("删除详情发生业务逻辑错误", e);
		}
	}
	@Override
	public List<Map<String, Object>> getUnitlList()
	{
		return commonMapper.getUnitList();
	}
	@Override
	@Transactional(rollbackFor=ServiceException.class)
	public void update(SaleOrderVo order, List<SaleOrderDetail> details)
	{
		try
		{
			saleOrderMapper.updateByPrimaryKeySelective(order);
			List<Integer> ids=new ArrayList<Integer>();
			for(SaleOrderDetail detail:details){
				if(!StringUtils.isEmpty(detail.getProductName())){
					if(detail.getId()!=null){
						saleOrderDetailMapper.updateByPrimaryKeySelective(detail);
					}else{
						detail.setMasterId(order.getId());
						addProduct(detail);
					}
					ids.add(detail.getId());
				}
			}
			SaleOrderDetailExample example=new SaleOrderDetailExample();
			example.createCriteria().andMasterIdEqualTo(order.getId()).andIdNotIn(ids);
			saleOrderDetailMapper.deleteByExample(example);
		}
		catch (Exception e)
		{
			logger.error("编辑销售销售订单发生业务逻辑错误",e);
			throw new ServiceException("编辑销售销售订单发生业务逻辑错误",e);
		}
	}
	@Override
	public Page<Map<String, Object>> queryDetailPage(Page<Map<String, Object>> page)
	{
		
		Map<String,Object> params=page.getParams();
		if(UserUtils.getSessionUser().getIsAdmin()!=1){
			params.put("createUserId", UserUtils.getSessionUser().getId());
		}
		Integer count=commonMapper.countSaleOrderDetailByCondition(params);
		List<Map<String,Object>> list=commonMapper.selectSaleOrderDetailByConditionWithPage(params, (page.getPage()-1)*page.getRows()+1, page.getPage()*page.getRows());
		page.setRecords(count);
		page.setDatas(list);
		return page;
	}
}
