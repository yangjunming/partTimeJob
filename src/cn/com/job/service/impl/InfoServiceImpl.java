package cn.com.job.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.job.bean.InfoBean;
import cn.com.job.bean.RelationBean;
import cn.com.job.bean.SigupInfoBean;
import cn.com.job.mapper.InfoMapper;
import cn.com.job.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoMapper infoMapper;

	@Override
	public boolean addInfo(InfoBean infoBean) {
		int result = infoMapper.addInfo(infoBean);
		if(result>0){
			return true;
		}
		return false;
	}

	@Override
	public List<InfoBean> getInfoListByUserId(Integer userId) {
		List<InfoBean> list = infoMapper.getInfoListByUserId(userId);
		if(list.size()>0){
			for (InfoBean infoBean : list) {
				int hireNum = infoMapper.hireNum(infoBean.getInfoId());
				infoBean.setHireNum(hireNum);
			}
			
		}
		return list;
	}

	@Override
	public boolean updateInfo(Integer infoId,Integer infoStatus) {
		int result = infoMapper.updateInfo(infoId,infoStatus);
		if(result>0){
			return true;
		}
		return false;
	}

	@Override
	public List<SigupInfoBean> getsigupList(Integer infoId) {
		return infoMapper.getsigupList(infoId);
	}

	@Override
	public boolean updateRelationStatus(Integer relationId, Integer relationStatus) {
		int result = infoMapper.updateRelationStatus(relationId,relationStatus);
		if(result>0){
			return true;
		}
		return false;
	}

	@Override
	public InfoBean getInfoById(Integer infoId) {
		return infoMapper.getInfoById(infoId);
	}

	@Override
	public boolean editInfo(InfoBean infoBean) {
		int result = infoMapper.editInfo(infoBean);
		if(result>0){
			return true;
		}
		return false;
	}

	@Override
	public List<InfoBean> getInfoListByStatus(Integer status,String search) {
		List<InfoBean> list = infoMapper.getInfoListByStatus(status,search);
		return list;
	}

	@Override
	public boolean signup(RelationBean relationBean) {
		int result = infoMapper.signup(relationBean);
		if(result>0){
			return true;
		}
		return false;
	}

	@Override
	public RelationBean getRelation(RelationBean relationBean) {
		return infoMapper.getRelation(relationBean);
	}
	
}
