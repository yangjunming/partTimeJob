package cn.com.job.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.SystemMessageBean;
import cn.com.job.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/getMessageList")
	@ResponseBody
	public List<SystemMessageBean> getMessageList(@RequestBody SystemMessageBean systemMessageBean){
		List<SystemMessageBean> list =  new ArrayList<>();
		list=managerService.getMessageList(systemMessageBean);
		return list;
	}
	

}
