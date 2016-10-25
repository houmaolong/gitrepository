package com.huayin.coms.mapper;

import com.huayin.coms.model.Customer;
import com.huayin.coms.model.CustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    int countByExample(CustomerExample example);

    int deleteByExample(CustomerExample example);

    int deleteByPrimaryKey(String uguid1);

    int insert(Customer record);

    int insertSelective(Customer record);

    List<Customer> selectByExampleWithPage(@Param("example") CustomerExample example, @Param("from") Integer from, @Param("to") Integer to);

    List<Customer> selectByExample(CustomerExample example);

    Customer selectByPrimaryKey(String uguid1);

    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
}