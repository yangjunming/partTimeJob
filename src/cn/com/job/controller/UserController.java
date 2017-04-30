package cn.com.job.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.UserBean;
import cn.com.job.bean.UserResBean;
import cn.com.job.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/getUserById")
	@ResponseBody
	public UserResBean getUserById(@RequestParam int userId) {
		UserResBean userBean = userService.getUserById(userId);
		return userBean;
	}

	/**
	 * 登录
	 * 
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public UserBean login(@RequestBody UserBean userBean, HttpSession session) {
		UserBean userbean = userService.login(userBean);
		if (null != userbean) {
			session.setAttribute("User", userbean);
		} else {
			userbean = new UserBean();
		}
		return userbean;
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public boolean logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return true;
	}

	/**
	 * 注册
	 * 
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/registerUser")
	@ResponseBody
	public boolean registerUser(@RequestBody UserBean userBean) {
		boolean result = userService.registerUser(userBean);
		return result;
	}

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param oldPassword
	 * @param newPassword
	 * @param request
	 * @return
	 */
	@RequestMapping("/editPassword")
	@ResponseBody
	public Object editPassword(@RequestParam Integer userId, @RequestParam String oldPassword,
			@RequestParam String newPassword, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<>();
		UserResBean userBean = userService.getUserById(userId);
		if (null == userBean) {
			map.put("falg", "0");
			map.put("message", "用户失效,请重新登录");
			return map;
		}
		if (!userBean.getPassword().equals(oldPassword)) {
			map.put("falg", "0");
			map.put("message", "旧密码不正确,请重新输入");
			return map;
		}
		UserResBean userbean = new UserResBean();
		userbean.setUserId(userId);
		userbean.setPassword(newPassword);
		boolean result = userService.updateUser(userbean);
		if (result) {
			map.put("falg", "1");
			map.put("message", "修改成功");
			HttpSession session = request.getSession();
			session.invalidate();
		} else {
			map.put("falg", "0");
			map.put("message", "修改失败");
		}
		return map;
	}

	/**
	 * 修改人员信息
	 * 
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/editUserInfo")
	@ResponseBody
	public Object editUserInfo(@RequestBody UserResBean userBean) {
		HashMap<String, String> map = new HashMap<>();
		if (null == userBean) {
			map.put("falg", "0");
			map.put("message", "用户失效,请重新登录");
			return map;
		}
		if (0 == userBean.getUserId()) {
			map.put("falg", "0");
			map.put("message", "用户失效,请重新登录");
			return map;
		}
		boolean result = userService.updateUser(userBean);
		if (result) {
			map.put("falg", "1");
			map.put("message", "修改成功");
		} else {
			map.put("falg", "0");
			map.put("message", "修改失败");
		}
		return map;
	}

	@RequestMapping("/getuserList")
	@ResponseBody
	public List<UserBean> getuserList(@RequestParam Integer status, @RequestParam String userName,
			@RequestParam String mobile,@RequestParam Integer type) {
		List<UserBean> list = userService.getuserList(status,userName,mobile,type);
		return list;
	}

}
