package cn.com.job.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.com.job.bean.CandidateBean;
import cn.com.job.bean.EnterpriseBean;
import cn.com.job.bean.UserBean;
import cn.com.job.bean.UserResBean;
import cn.com.job.mapper.CandidateMapper;
import cn.com.job.mapper.UserMapper;
import cn.com.job.service.EnterpriseService;
import cn.com.job.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private EnterpriseService enterpriseService;
	@Autowired
	private CandidateMapper candidateMapper;

	@Override
	public UserResBean getUserById(int uerId) {
		return userMapper.getUserById(uerId);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public boolean registerUser(UserBean userBean) {
		int result = userMapper.insert(userBean);
		if (result > 0 && userBean.getType() == 2) {
			EnterpriseBean enterpriseBean = new EnterpriseBean();
			enterpriseBean.setArea(userBean.getAddress());
			enterpriseBean.setEnterpriseName(userBean.getEnterpriseName());
			enterpriseBean.setUserId(userBean.getUserId());
			enterpriseService.insert(enterpriseBean);
		}else if(result > 0 && userBean.getType() == 3){
			
		}
		return result > 0;
	}

	@Override
	public UserBean login(UserBean userBean) {
		return userMapper.login(userBean);
	}

	@Override
	public boolean updateUser(UserResBean userBean) {
		UserBean userbean = new UserBean(userBean);
		int result = userMapper.updateUser(userbean);
		if (result > 0) {
			if(userBean.getType() == 2){
				EnterpriseBean enterpriseBean = new EnterpriseBean();
				enterpriseBean.setEnterpriseId(userBean.getEnterpriseId());
				enterpriseBean.setArea(userBean.getArea());
				enterpriseBean.setDescribe(userBean.getEnterpriseDescribe());
				enterpriseBean.setEnterpriseName(userBean.getEnterpriseName());
				enterpriseBean.setUserId(userBean.getUserId());
				enterpriseService.update(enterpriseBean);
			}else if(userBean.getType() == 3){
				CandidateBean candidateBean = new CandidateBean();
				candidateBean.setCandidateId(userBean.getCandidateId());
				candidateBean.setAge(userBean.getAge());
				candidateBean.setDescribe(userBean.getCandidateDescribe());
				candidateBean.setEducation(userBean.getEducation());
				candidateBean.setGender(userBean.getGender());
				candidateMapper.update(candidateBean);
			}
			return true;
		}
		return false;
	}

	@Override
	public CandidateBean getCandidateByUserId(Integer userId) {
		return userMapper.getCandidateByUserId(userId);
	}

	@Override
	public List<UserBean> getuserList(Integer status, String userName, String mobile,Integer type) {
		return userMapper.getuserList(status,mobile,userName,type);
	}

}
