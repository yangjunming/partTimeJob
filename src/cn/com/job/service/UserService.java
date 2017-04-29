package cn.com.job.service;

import cn.com.job.bean.UserBean;

public interface UserService {

	public UserBean getUserById(int uerId);

	public boolean registerUser(UserBean userBean);

	public UserBean login(UserBean userBean);

	public boolean updateUser(UserBean userBean);

}
