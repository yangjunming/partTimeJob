package cn.com.job.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.job.bean.SystemMessageBean;
import cn.com.job.mapper.ManagerMapper;
import cn.com.job.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;

	@Override
	public List<SystemMessageBean> getMessageList(SystemMessageBean systemMessageBean) {
		List<SystemMessageBean> list = managerMapper.getMessageList(systemMessageBean);
		return list;
	}

}
