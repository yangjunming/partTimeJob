package cn.com.job.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.CandidateBean;
import cn.com.job.bean.UserBean;
import cn.com.job.bean.UserResBean;

public interface UserMapper {

	public UserResBean getUserById(@Param("userId") int uerId);

	public int insert(UserBean userBean);

	public UserBean login(UserBean userBean);

	public int updateUser(UserBean userBean);

	public CandidateBean getCandidateByUserId(@Param("userId") Integer userId);

	public List<UserBean> getuserList(@Param("status") Integer status, @Param("mobile") String mobile,
			@Param("userName") String userName,@Param("type") Integer type);

	public int mobileCheck(@Param("mobile")String mobile,@Param("userId")Integer userId);

}
