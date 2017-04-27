package cn.com.job.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.com.job.bean.EnterpriseBean;
import cn.com.job.bean.UserBean;
import cn.com.job.mapper.UserMapper;
import cn.com.job.service.EnterpriseService;
import cn.com.job.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private EnterpriseService enterpriseService;
	
	@Override
	public UserBean getUserById(int uerId) {
		return userMapper.getUserById(uerId);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean registerUser(UserBean userBean) {
		int result = userMapper.insert(userBean);
		if(result >0 && userBean.getType() == 2){
			EnterpriseBean enterpriseBean = new EnterpriseBean();
			enterpriseBean.setArea(userBean.getAddress());
			enterpriseBean.setEnterpriseName(userBean.getEnterpriseName());
			enterpriseBean.setUserId(userBean.getUserId());
			enterpriseService.insert(enterpriseBean);
		}
		return result>0;
	}

}
