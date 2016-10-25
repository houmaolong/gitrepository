package com.huayin.coms.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T>
{
	private Integer rows=10;//每页大小
	private Integer page=1;//第几页
	private String sord="asc";//排序方式
	private Map<String,Object> params=new HashMap<String,Object>();//查询参数
	
	private Integer total;//返回共多少页
	private Integer records;//返回共多少条数据
	private List<T> datas;//返回数量集合
	public Integer getRows()
	{
		return rows;
	}
	public void setRows(Integer rows)
	{
		this.rows = rows;
	}
	public Integer getPage()
	{
		return page;
	}
	public void setPage(Integer page)
	{
		this.page = page;
	}
	public String getSord()
	{
		return sord;
	}
	public void setSord(String sord)
	{
		this.sord = sord;
	}
	public Map<String, Object> getParams()
	{
		return params;
	}
	public void setParams(Map<String, Object> params)
	{
		this.params = params;
	}
	public Integer getTotal()
	{
		total=new Double(Math.ceil(new Double(records)/new Double(rows))).intValue();
		return total;
	}
	public void setTotal(Integer total)
	{
		this.total = total;
	}
	public Integer getRecords()
	{
		return records;
	}
	public void setRecords(Integer records)
	{
		this.records = records;
	}
	public List<T> getDatas()
	{
		return datas;
	}
	public void setDatas(List<T> datas)
	{
		this.datas = datas;
	}
	
}
