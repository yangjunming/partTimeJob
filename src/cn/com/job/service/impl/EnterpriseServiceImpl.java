package cn.com.job.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.job.bean.EnterpriseBean;
import cn.com.job.mapper.EnterpriseMapper;
import cn.com.job.service.EnterpriseService;

public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	private EnterpriseMapper enterpriseMapper;

	@Override
	public int insert(EnterpriseBean enterpriseBean) {
		int result = enterpriseMapper.insert(enterpriseBean);
		return 0;
	}

}
