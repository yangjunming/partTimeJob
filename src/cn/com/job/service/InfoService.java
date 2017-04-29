package cn.com.job.service;

import java.util.List;

import cn.com.job.bean.InfoBean;
import cn.com.job.bean.SigupInfoBean;

public interface InfoService {

	public boolean addInfo(InfoBean infoBean);

	public List<InfoBean> getInfoListByUserId(Integer userId);

	public boolean updateInfo(Integer infoId, Integer infoStatus);

	public List<SigupInfoBean> getsigupList(Integer infoId);

	public boolean updateRelationStatus(Integer relationId, Integer relationStatus);

	public InfoBean getInfoById(Integer infoId);

	public boolean editInfo(InfoBean infoBean);

}
