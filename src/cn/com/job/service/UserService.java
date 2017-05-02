package cn.com.job.service;

import java.util.List;

import cn.com.job.bean.CandidateBean;
import cn.com.job.bean.UserBean;
import cn.com.job.bean.UserResBean;

public interface UserService {

	public UserResBean getUserById(int uerId);

	public boolean registerUser(UserBean userBean);

	public UserBean login(UserBean userBean);

	public boolean updateUser(UserResBean userBean);

	public CandidateBean getCandidateByUserId(Integer userId);

	public List<UserBean> getuserList(Integer status, String userName, String mobile,Integer type);

	public boolean mobileCheck(String mobile,Integer userId);

}
