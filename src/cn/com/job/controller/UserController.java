package cn.com.job.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;

import cn.com.job.bean.UserBean;
import cn.com.job.bean.UserResBean;
import cn.com.job.service.CaptchaUtil;
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
	 * 验证码
	 */
	@RequestMapping("/checkJpg")
	public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 通知浏览器不要缓存
		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "-1");
		CaptchaUtil util = CaptchaUtil.Instance();
		// 将验证码输入到session中，用来验证
		String code = util.getString();
		request.getSession().setAttribute("code", code);
		// 输出打web页面
		ImageIO.write(util.getImage(), "jpg", response.getOutputStream());
	}

	/**
	 * 登录
	 * 
	 * @param userBean
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Object login(@RequestBody UserBean userBean, HttpSession session) {
		String codeSession = (String) session.getAttribute("code");
		HashMap<String, Object> map = new HashMap<>();
		if (StringUtils.isEmpty(codeSession)) {
			// 验证码生成失败
			map.put("flag", "0");
			map.put("message", "验证码生成失败,请重新生成");
			return map;
		}
		UserBean userbean = new UserBean();
		if (codeSession.equalsIgnoreCase(userBean.getCode())) {
			// 验证码通过
			session.removeAttribute("code");
			userbean = userService.login(userBean);
			if (null != userbean) {
				// 验证码生成失败
				map.put("flag", "1");
				map.put("type", userbean.getType());
				map.put("message", "登录成功");
				session.setAttribute("User", userbean);
				return map;
			} else {
				map.put("flag", "0");
				map.put("message", "手机号或者密码错误");
				return map;
			}
		} else {
			// "验证码错误";
			session.removeAttribute("code");
			map.put("flag", "0");
			map.put("message", "验证码错误,请重新刷新");
			return map;
		}
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
	 * 电话号码是否存在
	 * 
	 * @param mobile
	 * @return
	 */
	@RequestMapping("/mobileCheck")
	@ResponseBody
	public Object mobileCheck(@RequestParam String mobile,@RequestParam(required=false) Integer userId) {
		HashMap<String, String> map = new HashMap<>();
		if (null == mobile || mobile.equals("")) {
			map.put("flag", "0");
			map.put("message", "参数错误");
			return map;
		}
		boolean result = userService.mobileCheck(mobile,userId);
		if (result) {
			map.put("flag", "1");
			map.put("message", "电话号码已存在");
			return map;
		}
		map.put("flag", "0");
		map.put("message", "电话号码不存在");
		return map;
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

	/**
	 * 获取人员列表
	 * 
	 * @param status
	 * @param userName
	 * @param mobile
	 * @param type
	 * @return
	 */
	@RequestMapping("/getuserList")
	@ResponseBody
	public List<UserBean> getuserList(@RequestParam Integer status, @RequestParam String userName,
			@RequestParam String mobile, @RequestParam Integer type) {
		List<UserBean> list = userService.getuserList(status, userName, mobile, type);
		return list;
	}

}
