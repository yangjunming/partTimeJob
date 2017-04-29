package cn.com.job.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.InfoBean;
import cn.com.job.bean.SigupInfoBean;
import cn.com.job.service.InfoService;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	/**
	 * 新增招聘信息
	 * @param infoBean
	 * @return
	 */
	@RequestMapping("addInfo")
	@ResponseBody
	public boolean addInfo(@RequestBody InfoBean infoBean){
		boolean result = infoService.addInfo(infoBean);
		return result;
	}
	
	/**
	 * 编辑招聘信息
	 * @param infoBean
	 * @return
	 */
	@RequestMapping("editInfo")
	@ResponseBody
	public boolean editInfo(@RequestBody InfoBean infoBean){
		boolean result = infoService.editInfo(infoBean);
		return result;
	}
	
	/**
	 * 根据公司人员获取招聘信息列表
	 * @param userId
	 * @return
	 */
	@RequestMapping("getInfoListByUserId")
	@ResponseBody
	public List<InfoBean> getInfoListByUserId(@RequestParam Integer userId){
		List<InfoBean> infoBean = new ArrayList<>();
		if(null ==userId ||userId ==0 ){
			return infoBean;
		}
		infoBean = infoService.getInfoListByUserId(userId);
		return infoBean;
	}
	
	/**
	 * 更新招聘信息状态
	 * @param infoId
	 * @param infoStatus
	 * @return
	 */
	@RequestMapping("/updateInfo")
	@ResponseBody
	public boolean updateInfo(@RequestParam Integer infoId,@RequestParam Integer infoStatus){
		boolean result = infoService.updateInfo(infoId,infoStatus);
		return result;
	}
	
	/**
	 * 获取应聘者列表
	 * @param infoId
	 * @return
	 */
	@RequestMapping("/getsigupList")
	@ResponseBody
	public List<SigupInfoBean> getsigupList(@RequestParam Integer infoId){
		List<SigupInfoBean> sigupList = new ArrayList<>();
		if(null == infoId || infoId ==0 ){
			return sigupList;
		}
		sigupList = infoService.getsigupList(infoId);
		return sigupList;
	}
	
	/**
	 * 更新招聘信息-应聘者关联表状态
	 * @param relationId
	 * @param relationStatus
	 * @return
	 */
	@RequestMapping("/updateRelationStatus")
	@ResponseBody
	public boolean updateRelationStatus(@RequestParam Integer relationId,@RequestParam Integer relationStatus){
		if(null == relationId || relationId==0){
			return false;
		}
		boolean result = infoService.updateRelationStatus(relationId,relationStatus);
		return result;
	}
	
	/**
	 * 获取招聘信息详情
	 * @param infoId
	 * @return
	 */
	@RequestMapping("getInfoById")
	@ResponseBody
	public InfoBean getInfoById(@RequestParam Integer infoId){
		InfoBean infoBean = new InfoBean();
		if(null ==infoId ||infoId ==0 ){
			return infoBean;
		}
		infoBean = infoService.getInfoById(infoId);
		return infoBean;
	}
}
