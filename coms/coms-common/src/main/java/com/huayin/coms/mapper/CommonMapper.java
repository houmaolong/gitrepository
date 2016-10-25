package com.huayin.coms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huayin.coms.model.SaleOrderDetail;

public interface CommonMapper {
    List<Map<String, Object>> selectSaleOrderByConditionWithPage(@Param("params")Map<String, Object> params, @Param("from") Integer from, @Param("to") Integer to);
	Integer countSaleOrderByCondition(@Param("params")Map<String, Object> params);
	Integer updateToAudited(Integer id);
	Integer updateToUnaudit(Integer id);
	List<Map<String, Object>> getDetailListById(Integer id);
	void addProduct(SaleOrderDetail detail);
	void deleteByForeignKey(Integer id);
	SaleOrderDetail getDetail(Integer id);
	Map<String, Object> selectCustomerById(String customerId);
	List<Map<String, Object>> selectAddressByCustomerId(String customerId);
	List<Map<String, Object>> getUnitList();
	Map<String, Object> selectSaleOrderByPrimaryKey(Integer id);
	Integer countSaleOrderDetailByCondition(@Param("params")Map<String, Object> params);
	List<Map<String, Object>> selectSaleOrderDetailByConditionWithPage(@Param("params")Map<String, Object> params, @Param("from")Integer from, @Param("to") Integer to);
}