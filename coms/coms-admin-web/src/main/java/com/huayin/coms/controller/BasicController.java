package com.huayin.coms.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.huayin.coms.vo.Page;

public class BasicController
{

	public Map<String, Object> success(Object data){
		Map<String, Object>  map=new HashMap<String,Object>(3);
		map.put("success", true);
		map.put("msg", "处理成功");
		map.put("data", data);
		return map;
	}
	public Map<String, Object> success(String msg){
		Map<String, Object>  map=new HashMap<String,Object>(3);
		map.put("success", true);
		map.put("msg", msg);
		return map;
	}
	public Map<String, Object> success(){
		Map<String, Object>  map=new HashMap<String,Object>(3);
		map.put("success", true);
		map.put("msg", "处理成功");
		return map;
	}
	public Map<String, Object> page(Page<?> page){
		Map<String, Object>  map=new HashMap<String,Object>(3);
		map.put("page", page.getPage());
		map.put("total", page.getTotal());
		map.put("records", page.getRecords());
		map.put("rows", page.getDatas());
		return map;
	}
	
	public Map<String, Object> fail(String msg){
		Map<String, Object>  map=new HashMap<String,Object>(2);
		map.put("success", false);
		map.put("msg", msg);
		return map;
	}
	
	public MultipartFile buildMultiFile(HttpServletRequest request, String fileName) {
		MultipartFile file = null;
		if (request instanceof MultipartHttpServletRequest) {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			MultiValueMap<String, MultipartFile> mvm = mr.getMultiFileMap();
			List<MultipartFile> list = mvm.get(fileName);
			if (list != null && list.size() > 0) {
				file = list.get(0);
			}
		}
		return file;
	}

	public String buildFileDir(HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		File file = new File(realPath);
		String webappPath = file.getParent();
		return webappPath + File.separator + "uploadfile" + File.separator + "images" + File.separator;
	}

	public String buildPrefixUrl(HttpServletRequest request) {
		String prefixUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + "/uploadfile/images/";
		return prefixUrl;
	}
}
