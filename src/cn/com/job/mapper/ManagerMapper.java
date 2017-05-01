package cn.com.job.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.SystemMessageBean;

public interface ManagerMapper {

	public List<SystemMessageBean> getMessageList(SystemMessageBean systemMessageBean);

	public int updateSysteInfo(SystemMessageBean systemMessageBean);

	public int addSystemInfo(SystemMessageBean systemMessageBean);

	public SystemMessageBean getSystemInfo(@Param("messageId")Integer messageId);

}
