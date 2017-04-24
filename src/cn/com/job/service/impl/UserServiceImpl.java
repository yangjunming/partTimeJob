package cn.com.job.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.job.bean.UserBean;
import cn.com.job.mapper.UserMapper;
import cn.com.job.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserBean getUserById(int uerId) {
		return userMapper.getUserById(uerId);
	}

}
