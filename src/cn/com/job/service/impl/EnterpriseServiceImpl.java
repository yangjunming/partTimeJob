package cn.com.job.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.job.bean.EnterpriseBean;
import cn.com.job.mapper.EnterpriseMapper;
import cn.com.job.service.EnterpriseService;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	private EnterpriseMapper enterpriseMapper;

	@Override
	public int insert(EnterpriseBean enterpriseBean) {
		int result = enterpriseMapper.insert(enterpriseBean);
		if(result>0){
			return enterpriseBean.getEnterpriseId();
		}
		return 0;
	}

	@Override
	public EnterpriseBean getInfoByUserId(Integer userId) {
		EnterpriseBean enterpriseBean =enterpriseMapper.getInfoByUserId(userId);
		return enterpriseBean;
	}

	@Override
	public List<EnterpriseBean> getEnterpriseList() {
		List<EnterpriseBean> list = enterpriseMapper.getEnterpriseList();
		return list;
	}

	@Override
	public boolean update(EnterpriseBean enterpriseBean) {
		int result = enterpriseMapper.update(enterpriseBean);
		if(result>0){
			return true;
		}
		return false;
	}

}
