package cn.com.job.service;

import java.util.List;

import cn.com.job.bean.SystemMessageBean;

public interface ManagerService {

	public List<SystemMessageBean> getMessageList(SystemMessageBean systemMessageBean);

}
