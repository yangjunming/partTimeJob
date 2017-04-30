package cn.com.job.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.InfoBean;
import cn.com.job.bean.RelationBean;
import cn.com.job.bean.SigupInfoBean;

public interface InfoMapper {

	public int addInfo(InfoBean infoBean);

	public List<InfoBean> getInfoListByUserId(Integer userId);

	public int updateInfo(@Param("infoId")Integer infoId,@Param("infoStatus") Integer infoStatus);

	public List<SigupInfoBean> getsigupList(@Param("infoId") Integer infoId);

	public int updateRelationStatus(@Param("relationId")Integer relationId,@Param("relationStatus") Integer relationStatus);

	public int hireNum(@Param("infoId")int infoId);

	public InfoBean getInfoById(@Param("infoId")Integer infoId);

	public int editInfo(InfoBean infoBean);

	public List<InfoBean> getInfoListByStatus(@Param("status")Integer status,@Param("search")String search);

	public int signup(RelationBean relationBean);

	public RelationBean getRelation(RelationBean relationBean);

}
