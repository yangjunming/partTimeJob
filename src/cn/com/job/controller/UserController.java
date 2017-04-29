package cn.com.job.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	/**
	 * 登录
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public UserBean login(@RequestBody UserBean userBean,HttpSession session){
		UserBean userbean = userService.login(userBean);
		if(null != userbean){
			session.setAttribute("User", userbean);
		}else{
		}
		return userbean;
	} 
	
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public boolean logout(HttpServletRequest request){
		HttpSession session = request.getSession();
	    session.invalidate();
		return true;
	} 
	
	
	/**
	 * 注册
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/registerUser")
	@ResponseBody
	public boolean registerUser(@RequestBody UserBean userBean){
		boolean result = userService.registerUser(userBean);
		return result;
	} 
	
}
