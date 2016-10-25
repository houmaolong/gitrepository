package com.huayin.coms.mapper;

import com.huayin.coms.model.SaleOrder;
import com.huayin.coms.model.SaleOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleOrderMapper {
    int countByExample(SaleOrderExample example);

    int deleteByExample(SaleOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SaleOrder record);

    int insertSelective(SaleOrder record);

    List<SaleOrder> selectByExampleWithPage(@Param("example") SaleOrderExample example, @Param("from") Integer from, @Param("to") Integer to);

    List<SaleOrder> selectByExample(SaleOrderExample example);

    SaleOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SaleOrder record, @Param("example") SaleOrderExample example);

    int updateByExample(@Param("record") SaleOrder record, @Param("example") SaleOrderExample example);

    int updateByPrimaryKeySelective(SaleOrder record);

    int updateByPrimaryKey(SaleOrder record);
}