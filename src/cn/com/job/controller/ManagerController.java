package cn.com.job.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.CatalogBean;
import cn.com.job.bean.SystemMessageBean;
import cn.com.job.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	/**
	 * 获取系统消息列表
	 * @param systemMessageBean
	 * @return
	 */
	@RequestMapping("/getMessageList")
	@ResponseBody
	public List<SystemMessageBean> getMessageList(@RequestBody SystemMessageBean systemMessageBean){
		List<SystemMessageBean> list =  new ArrayList<>();
		list=managerService.getMessageList(systemMessageBean);
		return list;
	}
	
	/**
	 * 更新系统公告
	 * @param systemMessageBean
	 * @return
	 */
	@RequestMapping("/updateSysteInfo")
	@ResponseBody
	public  Object updateSysteInfo(@RequestBody SystemMessageBean systemMessageBean){
	HashMap<String, String> map = new HashMap<>();
	if (null == systemMessageBean) {
		map.put("flag", "0");
		map.put("message", "参数错误");
		return map;
	}
	if (0 == systemMessageBean.getMessageId()) {
		map.put("flag", "0");
		map.put("message", "参数错误");
		return map;
	}
	boolean result = managerService.updateSysteInfo(systemMessageBean);
	if (result) {
		map.put("flag", "1");
		map.put("message", "修改成功");
	} else {
		map.put("flag", "0");
		map.put("message", "修改失败");
	}
	return map;
	}
	
	/**
	 * 新增系统公告
	 * @param systemMessageBean
	 * @return
	 */
	@RequestMapping("/addSystemInfo")
	@ResponseBody
	public  Object addSystemInfo(@RequestBody SystemMessageBean systemMessageBean){
	HashMap<String, String> map = new HashMap<>();
	if (null == systemMessageBean) {
		map.put("flag", "0");
		map.put("message", "参数错误");
		return map;
	}
	boolean result = managerService.addSystemInfo(systemMessageBean);
	if (result) {
		map.put("flag", "1");
		map.put("message", "新增成功");
	} else {
		map.put("flag", "0");
		map.put("message", "新增失败");
	}
	return map;
	}
	
	/**
	 * 查询系统公告
	 * @param messageId
	 * @return
	 */
	@RequestMapping("/getSystemInfo")
	@ResponseBody
	public SystemMessageBean getSystemInfo(@RequestParam Integer messageId){
		SystemMessageBean systemMessageBean = managerService.getSystemInfo(messageId);
		if(null == systemMessageBean){
			return new SystemMessageBean();
		}
		return systemMessageBean;
	}
	
	/**
	 * 获取分类列表
	 * @return
	 */
	@RequestMapping("/getCatalogList")
	@ResponseBody
	public List<CatalogBean> getCatalogList(@RequestBody CatalogBean catalogBean){
		return managerService.getCatalogList(catalogBean);
	}
	
	@RequestMapping("/addCatalog")
	@ResponseBody
	public Object addCatalog(@RequestBody CatalogBean catalogBean){
		HashMap<String, String> map = new HashMap<>();
		if (null == catalogBean) {
			map.put("flag", "0");
			map.put("message", "参数错误");
			return map;
		}
		boolean result = managerService.addCatalog(catalogBean);
		if (result) {
			map.put("flag", "1");
			map.put("message", "新增成功");
		} else {
			map.put("flag", "0");
			map.put("message", "新增失败");
		}
		return map;
		
	}
	/**
	 * 删除分类
	 * @param catalogBean
	 * @return
	 */
	@RequestMapping("/editCatalog")
	@ResponseBody
	public Object editCatalog(@RequestBody CatalogBean catalogBean){
		HashMap<String, String> map = new HashMap<>();
		if (null == catalogBean) {
			map.put("flag", "0");
			map.put("message", "参数错误");
			return map;
		}
		boolean result = managerService.editCatalog(catalogBean);
		if (result) {
			map.put("flag", "1");
			map.put("message", "删除成功");
		} else {
			map.put("flag", "0");
			map.put("message", "删除失败");
		}
		return map;
	}

}
