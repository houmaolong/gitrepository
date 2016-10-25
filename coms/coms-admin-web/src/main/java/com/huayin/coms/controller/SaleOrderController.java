package com.huayin.coms.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.huayin.coms.exception.ServiceException;
import com.huayin.coms.mapper.CommonMapper;
import com.huayin.coms.model.SaleOrder;
import com.huayin.coms.model.SaleOrderDetail;
import com.huayin.coms.service.ISaleOrderService;
import com.huayin.coms.vo.Page;
import com.huayin.coms.vo.SaleOrderVo;

 
@Controller
public class SaleOrderController  extends BasicController{
	private static final Logger logger = LoggerFactory.getLogger(SaleOrderController.class);

	@Autowired
	@Qualifier("saleOrderService")
	private ISaleOrderService saleOrderService;
	
	@Autowired
	@Qualifier("commonMapper")
	private CommonMapper commonMapper;
	
	@RequestMapping(value = "/sale/get.ajax")
	@ResponseBody
	public Map<String, Object> get(Integer id) {
		try {
			Map<String, Object> map = saleOrderService.get(id);
			return super.success(map);
		} catch (Exception e) {
			logger.error("查询详情出错", e);
			return super.fail("查询详情发生系统错误");
		}
	}
	//新增订单
	@RequestMapping(value = "/sale/add.ajax")
	@ResponseBody
	public Map<String, Object> add(SaleOrder order) {
		try {
			saleOrderService.add(order);
			return super.success(order.getId());
		} catch (ServiceException e) {
			logger.error("新增订单出错", e);
			return super.fail("新增订单发生系统错误");
		}
	}
	
	//新增订单批量添加
	@RequestMapping(value = "/sale/addWithDetails.ajax")
	@ResponseBody
	public Map<String, Object> add(@ModelAttribute("order")SaleOrderVo order,HttpServletRequest request) {
			try {
				int i=0;
				for(SaleOrderDetail detail:order.getDetails()){
					MultipartFile filePic = this.buildMultiFile(request, "details["+i+"].pic");
					if (filePic != null) {
						// 组装图片保存路径
						String fileDirPath = this.buildFileDir(request);
						// 组装图片保存在数据库中的url前缀
						String prefixUrl = this.buildPrefixUrl(request);
						//创建文件路径
						new File(fileDirPath).mkdirs();
						File destDir = new File(fileDirPath.concat(File.separator).concat(filePic.getOriginalFilename()));
						filePic.transferTo(destDir);
						detail.setPhoto(prefixUrl + filePic.getOriginalFilename());
					}
					i++;
				}
				
			    saleOrderService.add(order,order.getDetails());
				return super.success(order.getId());
			} catch (ServiceException e) {
				logger.error("新增订单出错", e);
				return super.fail("新增订单发生系统错误");
			}catch (Exception e) {
				logger.error("新增订单出错", e);
				return super.fail("新增订单发生系统错误");
			}
		}
	
	//编辑销售订单
		@RequestMapping(value = "/sale/updateWithDetails.ajax")
		@ResponseBody
		public Map<String, Object> update(@ModelAttribute("order")SaleOrderVo order,HttpServletRequest request) {
				try {
					int i=0;
					for(SaleOrderDetail detail:order.getDetails()){
						MultipartFile filePic = this.buildMultiFile(request, "details["+i+"].pic");
						if (filePic != null) {
							// 组装图片保存路径
							String fileDirPath = this.buildFileDir(request);
							// 组装图片保存在数据库中的url前缀
							String prefixUrl = this.buildPrefixUrl(request);
							//创建文件路径
							new File(fileDirPath).mkdirs();
							File destDir = new File(fileDirPath.concat(File.separator).concat(filePic.getOriginalFilename()));
							filePic.transferTo(destDir);
							detail.setPhoto(prefixUrl + filePic.getOriginalFilename());
						}
						i++;
					}
					
				    saleOrderService.update(order,order.getDetails());
					return super.success(order.getId());
				} catch (ServiceException e) {
					logger.error("编辑销售订单出错", e);
					return super.fail("编辑销售订单发生系统错误");
				}catch (Exception e) {
					logger.error("编辑销售订单出错", e);
					return super.fail("编辑销售订单发生系统错误");
				}
			}
	//删除订单
	@RequestMapping(value = "/sale/del.ajax")
	@ResponseBody
	public Map<String, Object> del(@RequestParam("ids[]") Integer[] ids) {
		try {
			saleOrderService.del(ids);
			return super.success("成功删除"+ids.length+"条记录!");
		} catch (ServiceException e) {
			logger.error("删除订单出错", e);
			return super.fail("删除订单发生系统错误");
		}
	}
	//订单列表
	@RequestMapping(value = "/sale/list.ajax")
	@ResponseBody
	public Map<String, Object> list(Page<Map<String,Object>> page) {
		try {
			Page<Map<String, Object>> pageData=saleOrderService.queryPage(page);
			return super.page(pageData);
		} catch (ServiceException e) {
			logger.error("查询列表出错", e);
			return super.fail("查询列表发生系统错误");
		}
	}
	//订单详情列表
	@RequestMapping(value = "/sale/detail_list.ajax")
	@ResponseBody
	public Map<String, Object> detailList(Page<Map<String,Object>> page) {
		try {
			Page<Map<String, Object>> pageData=saleOrderService.queryDetailPage(page);
			return super.page(pageData);
		} catch (ServiceException e) {
			logger.error("查询列表出错", e);
			return super.fail("查询列表发生系统错误");
		}
	}
	//审核
	@RequestMapping(value = "/sale/updateToAudited.ajax")
	@ResponseBody
	public Map<String, Object> updateToAudited(@RequestParam("ids[]") Integer[] ids)
	{
		try
		{
			saleOrderService.updateToAudited(ids);
			return super.success("成功修改" + ids.length + "条记录!");
		}
		catch (ServiceException e)
		{
			logger.error("更新审核状态出错", e);
			return super.fail("更新审核状态发生系统错误");
		}
	}	
	//消审
	@RequestMapping(value = "/sale/updateToUnaudit.ajax")
	@ResponseBody
	public Map<String, Object> updateToUnaudit(@RequestParam("ids[]") Integer[] ids)
	{
		try
		{
			saleOrderService.updateToUnaudit(ids);
			return super.success("成功修改" + ids.length + "条记录!");
		}
		catch (ServiceException e)
		{
			logger.error("修改审核状态出错", e);
			return super.fail("修改审核状态发生系统错误");
		}
	}
	//订单详情
	@RequestMapping(value = "/sale/detail.ajax")
	@ResponseBody
	public List<Map<String, Object>> detailList(Integer id) {
			List<Map<String, Object>> detailList = saleOrderService.getDetailList(id);
			return detailList;		
	}
	//新增产品
	@RequestMapping(value = "/sale/addProduct.ajax")
	@ResponseBody
	public Map<String, Object> addProduct(@ModelAttribute("detail")SaleOrderDetail detail,HttpServletRequest request) {
		try {
			MultipartFile filePic = this.buildMultiFile(request, "pic");
			if (filePic != null) {
				// 组装图片保存路径
				String fileDirPath = this.buildFileDir(request);
				// 组装图片保存在数据库中的url前缀
				String prefixUrl = this.buildPrefixUrl(request);
				//创建文件路径
				new File(fileDirPath).mkdirs();
				File destDir = new File(fileDirPath.concat(File.separator).concat(filePic.getOriginalFilename()));
				filePic.transferTo(destDir);
				detail.setPhoto(prefixUrl + filePic.getOriginalFilename());
			}
			saleOrderService.addProduct(detail);
			return super.success();
		}catch (ServiceException e) {
			logger.error("新增产品出错", e);
			return super.fail("新增产品发生系统错误");
		}catch (Exception e) {
			logger.error("新增产品出错", e);
			return super.fail("新增产品发生系统错误");
		} 
	}
	//获得产品信息
	@RequestMapping(value = "/sale/getDetail.ajax")
	@ResponseBody
	public Map<String, Object> getDetail(Integer id) {			
		try
		{
			SaleOrderDetail detail = saleOrderService.getDetail(id);
			return super.success(detail);
		}
		catch (Exception e)
		{
			logger.error("查询详情出错", e);
			return super.fail("查询详情发生系统错误");
		}
	}
	
	//编辑产品信息
	@RequestMapping(value = "/sale/editDetail.ajax")
	@ResponseBody
	public Map<String, Object> editDetail(@ModelAttribute("detail")SaleOrderDetail detail,HttpServletRequest request) {			
		try
		{	
			MultipartFile filePic = this.buildMultiFile(request, "pic");
			if (filePic != null) {
				// 组装图片保存路径
				String fileDirPath = this.buildFileDir(request);
				// 组装图片保存在数据库中的url前缀
				String prefixUrl = this.buildPrefixUrl(request);
				//创建文件路径
				new File(fileDirPath).mkdirs();
				File destDir = new File(fileDirPath.concat(File.separator).concat(filePic.getOriginalFilename()));
				filePic.transferTo(destDir);
				detail.setPhoto(prefixUrl + filePic.getOriginalFilename());
			}
			saleOrderService.updateDetail(detail);
			return super.success();
		}
		catch (Exception e)
		{
			logger.error("查询详情出错", e);
			return super.fail("查询详情发生系统错误");
		}
	}
	//删除订单
	@RequestMapping(value = "/sale/delDetail.ajax")
	@ResponseBody
	public Map<String, Object> delDetail(@RequestParam("ids[]") Integer[] ids) {
		try {
			saleOrderService.delDetail(ids);
			return super.success("成功删除"+ids.length+"条记录!");
		} catch (ServiceException e) {
			logger.error("删除订单出错", e);
			return super.fail("删除订单发生系统错误");
		}
	}
	//单位列表
	@RequestMapping(value = "/sale/unitList.ajax")
	@ResponseBody
	public Map<String,Object> unitList() {
			List<Map<String,Object>> unitList = saleOrderService.getUnitlList();
			
			return super.success(unitList);		
	}	
}