package cn.com.job.mapper;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.UserBean;

public interface UserMapper {

	public UserBean getUserById(@Param("userId")int uerId);

	public int insert(UserBean userBean);

}
