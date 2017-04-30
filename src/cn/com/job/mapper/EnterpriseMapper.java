package cn.com.job.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.EnterpriseBean;

public interface EnterpriseMapper {

	public int insert(EnterpriseBean enterpriseBean);

	public EnterpriseBean getInfoByUserId(@Param("userId")Integer userId);

	public List<EnterpriseBean> getEnterpriseList();

	public int update(EnterpriseBean enterpriseBean);

}
