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

	@Override
	public boolean updateSysteInfo(SystemMessageBean systemMessageBean) {
		int result = managerMapper.updateSysteInfo(systemMessageBean);
		if (result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addSystemInfo(SystemMessageBean systemMessageBean) {
		int result = managerMapper.addSystemInfo(systemMessageBean);
		if (result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public SystemMessageBean getSystemInfo(Integer messageId) {
		return managerMapper.getSystemInfo(messageId);
	}

}
