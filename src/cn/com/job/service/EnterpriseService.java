package cn.com.job.service;

import java.util.List;

import cn.com.job.bean.EnterpriseBean;

public interface EnterpriseService {

	public int insert(EnterpriseBean enterpriseBean);

	public EnterpriseBean getInfoByUserId(Integer userId);

	public List<EnterpriseBean> getEnterpriseList();

	public boolean update(EnterpriseBean enterpriseBean);

}
