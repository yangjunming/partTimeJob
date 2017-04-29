package cn.com.job.mapper;

import org.apache.ibatis.annotations.Param;

import cn.com.job.bean.EnterpriseBean;

public interface EnterpriseMapper {

	public int insert(EnterpriseBean enterpriseBean);

	public EnterpriseBean getInfoByUserId(@Param("userId")Integer userId);

}
