package cn.com.job.service;

import java.util.List;

import cn.com.job.bean.CatalogBean;
import cn.com.job.bean.SystemMessageBean;

public interface ManagerService {

	public List<SystemMessageBean> getMessageList(SystemMessageBean systemMessageBean);

	public boolean updateSysteInfo(SystemMessageBean systemMessageBean);

	public boolean addSystemInfo(SystemMessageBean systemMessageBean);

	public SystemMessageBean getSystemInfo(Integer messageId);

	public List<CatalogBean> getCatalogList(CatalogBean catalogBean);

	public boolean editCatalog(CatalogBean catalogBean);

	public boolean addCatalog(CatalogBean catalogBean);

}
