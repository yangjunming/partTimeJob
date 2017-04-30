package cn.com.job.mapper;

import java.util.List;

import cn.com.job.bean.SystemMessageBean;

public interface ManagerMapper {

	public List<SystemMessageBean> getMessageList(SystemMessageBean systemMessageBean);

}
