package cn.com.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.UserBean;
import cn.com.job.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/getUserById")
	@ResponseBody
	public UserBean getUserById(@RequestParam int uerId){
		UserBean userBean = userService.getUserById(uerId);
		return userBean;
	} 
	
}
