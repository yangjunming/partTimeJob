package cn.com.job.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.EnterpriseBean;
import cn.com.job.service.EnterpriseService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {
	
	@Autowired
	private EnterpriseService enterpriseService;
		
	@RequestMapping("/getInfoByUserId")
	@ResponseBody
	public EnterpriseBean getInfoByUserId(@RequestParam Integer userId){
		EnterpriseBean enterpriseBean = new EnterpriseBean();
		if(null == userId || userId==0){
			return enterpriseBean;
		}
		enterpriseBean = enterpriseService.getInfoByUserId(userId);
		return enterpriseBean;
	}
	
	@RequestMapping("/getEnterpriseList")
	@ResponseBody
	public List<EnterpriseBean> getEnterpriseList(){
		List<EnterpriseBean> list = new ArrayList<>();
		list = enterpriseService.getEnterpriseList();
		return list;
	}
	
}
