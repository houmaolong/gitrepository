package com.huayin.coms.mapper;

import com.huayin.coms.model.SaleOrderDetail;
import com.huayin.coms.model.SaleOrderDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleOrderDetailMapper {
    int countByExample(SaleOrderDetailExample example);

    int deleteByExample(SaleOrderDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SaleOrderDetail record);

    int insertSelective(SaleOrderDetail record);

    List<SaleOrderDetail> selectByExampleWithPage(@Param("example") SaleOrderDetailExample example, @Param("from") Integer from, @Param("to") Integer to);

    List<SaleOrderDetail> selectByExample(SaleOrderDetailExample example);

    SaleOrderDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SaleOrderDetail record, @Param("example") SaleOrderDetailExample example);

    int updateByExample(@Param("record") SaleOrderDetail record, @Param("example") SaleOrderDetailExample example);

    int updateByPrimaryKeySelective(SaleOrderDetail record);

    int updateByPrimaryKey(SaleOrderDetail record);
}