package cn.com.job.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.job.bean.CandidateBean;
import cn.com.job.bean.CommentBean;
import cn.com.job.bean.InfoBean;
import cn.com.job.bean.RelationBean;
import cn.com.job.bean.SigupInfoBean;
import cn.com.job.service.InfoService;
import cn.com.job.service.UserService;

@Controller
@RequestMapping("/info")
public class InfoController {

	@Autowired
	private InfoService infoService;
	@Autowired
	private UserService userService;

	/**
	 * 新增招聘信息
	 * 
	 * @param infoBean
	 * @return
	 */
	@RequestMapping("addInfo")
	@ResponseBody
	public boolean addInfo(@RequestBody InfoBean infoBean) {
		boolean result = infoService.addInfo(infoBean);
		return result;
	}

	/**
	 * 编辑招聘信息
	 * 
	 * @param infoBean
	 * @return
	 */
	@RequestMapping("editInfo")
	@ResponseBody
	public boolean editInfo(@RequestBody InfoBean infoBean) {
		boolean result = infoService.editInfo(infoBean);
		return result;
	}

	/**
	 * 根据公司人员获取招聘信息列表
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping("getInfoListByUserId")
	@ResponseBody
	public List<InfoBean> getInfoListByUserId(@RequestParam Integer userId) {
		List<InfoBean> infoBean = new ArrayList<>();
		if (null == userId || userId == 0) {
			return infoBean;
		}
		infoBean = infoService.getInfoListByUserId(userId);
		return infoBean;
	}
	
	/**
	 * 查询招聘信息列表
	 * @param infoBean
	 * @return
	 */
	@RequestMapping("/getInfoList")
	@ResponseBody
	public List<InfoBean> getInfoList(@RequestBody InfoBean infoBean) {
		List<InfoBean> infoBeanList = new ArrayList<>();
		infoBeanList = infoService.getInfoList(infoBean);
		return infoBeanList;
	}

	/**
	 * 更新招聘信息状态
	 * 
	 * @param infoId
	 * @param infoStatus
	 * @return
	 */
	@RequestMapping("/updateInfo")
	@ResponseBody
	public boolean updateInfo(@RequestParam Integer infoId, @RequestParam Integer infoStatus) {
		boolean result = infoService.updateInfo(infoId, infoStatus);
		return result;
	}

	/**
	 * 获取应聘者列表
	 * 
	 * @param infoId
	 * @return
	 */
	@RequestMapping("/getsigupList")
	@ResponseBody
	public List<SigupInfoBean> getsigupList(@RequestParam Integer infoId) {
		List<SigupInfoBean> sigupList = new ArrayList<>();
		if (null == infoId || infoId == 0) {
			return sigupList;
		}
		sigupList = infoService.getsigupList(infoId);
		return sigupList;
	}

	/**
	 * 更新招聘信息-应聘者关联表状态
	 * 
	 * @param relationId
	 * @param relationStatus
	 * @return
	 */
	@RequestMapping("/updateRelationStatus")
	@ResponseBody
	public boolean updateRelationStatus(@RequestParam Integer relationId, @RequestParam Integer relationStatus) {
		if (null == relationId || relationId == 0) {
			return false;
		}
		boolean result = infoService.updateRelationStatus(relationId, relationStatus);
		return result;
	}

	/**
	 * 获取招聘信息详情
	 * 
	 * @param infoId
	 * @return
	 */
	@RequestMapping("getInfoById")
	@ResponseBody
	public InfoBean getInfoById(@RequestParam Integer infoId) {
		InfoBean infoBean = new InfoBean();
		if (null == infoId || infoId == 0) {
			return infoBean;
		}
		infoBean = infoService.getInfoById(infoId);
		return infoBean;
	}

	/**
	 * 根据状态查询招聘信息列表
	 * 
	 * @param status
	 * @return
	 */
	@RequestMapping("/getInfoListByStatus")
	@ResponseBody
	public List<InfoBean> getInfoListByStatus(@RequestParam Integer status, @RequestParam String search) {
		List<InfoBean> infoBean = new ArrayList<>();
		if (null == status) {
			return infoBean;
		}
		infoBean = infoService.getInfoListByStatus(status, search);
		return infoBean;
	}
	
	/**
	 * 查看我报名的兼职工作
	 * @param search
	 * @return
	 */
	@RequestMapping("/getInfoListByCandidate")
	@ResponseBody
	public List<InfoBean> getInfoListByCandidate(@RequestParam Integer userId, @RequestParam String search) {
		List<InfoBean> infoBean = new ArrayList<>();
		infoBean = infoService.getInfoListByCandidate(userId,search);
		return infoBean;
	}
	

	/**
	 * 报名兼职
	 * 
	 * @param infoId
	 * @param userId
	 * @return
	 */
	@RequestMapping("/signup")
	@ResponseBody
	public Object signup(@RequestParam Integer infoId, @RequestParam Integer userId) {
		HashMap<String, String> map = new HashMap<>();
		if (null == infoId || infoId == 0 || null == userId || 0 == userId) {
			map.put("flag", "0");
			map.put("message", "参数不正确");
			return map;
		}
		CandidateBean candidateBean = userService.getCandidateByUserId(userId);
		if (null == candidateBean) {
			map.put("flag", "0");
			map.put("message", "数据错误");
			return map;
		}
		RelationBean relationBean = new RelationBean();
		relationBean.setCandidateId(candidateBean.getCandidateId());
		relationBean.setInfoId(infoId);
		boolean result = infoService.signup(relationBean);
		if (result) {
			map.put("flag", "1");
			map.put("message", "报名成功");
			return map;
		}
		map.put("flag", "0");
		map.put("message", "报名失败");
		return map;
	}

	/**
	 * 根据人员id和招聘信息id查询是否报名
	 * 
	 * @param infoId
	 * @param userId
	 * @return
	 */
	@RequestMapping("/getRelation")
	@ResponseBody
	public RelationBean getRelation(@RequestParam Integer infoId, @RequestParam Integer userId) {
		RelationBean relationbean = new RelationBean();
		if (null == infoId || infoId == 0 || null == userId || 0 == userId) {
			return relationbean;
		}
		CandidateBean candidateBean = userService.getCandidateByUserId(userId);
		if (null == candidateBean) {
			return relationbean;
		}
		RelationBean relationBean = new RelationBean();
		relationBean.setCandidateId(candidateBean.getCandidateId());
		relationBean.setInfoId(infoId);
		relationbean = infoService.getRelation(relationBean);
		if (null != relationbean) {
			return relationbean;
		}
		return new RelationBean();
	}
	
	/**
	 * 评论
	 * @param commentBean
	 * @return
	 */
	@RequestMapping("/addComment")
	@ResponseBody
	public Object addComment(@RequestBody CommentBean commentBean){
		HashMap<String, String> map = new HashMap<>();
		if (null == commentBean) {
			map.put("flag", "0");
			map.put("message", "参数不正确");
			return map;
		}
		boolean result = infoService.addComment(commentBean);
		if (result) {
			map.put("flag", "1");
			map.put("message", "评论成功");
			return map;
		}
		map.put("flag", "0");
		map.put("message", "评论失败");
		return map;
	}
	
	/**
	 * 查询评论列表
	 * @param infoId
	 * @param status
	 * @return
	 */
	@RequestMapping("/commentList")
	@ResponseBody
	public List<CommentBean> commentList(@RequestParam Integer infoId,@RequestParam Integer status){
		List<CommentBean> list = new ArrayList<>();
		if(null== infoId || infoId==0){
			return list;
		}
		list = infoService.commentList(infoId,status);
		return list;
	}
	
	/**
	 * 查看评论详情
	 * @param commentBean
	 * @return
	 */
	@RequestMapping("/commentInfo")
	@ResponseBody
	public CommentBean commentInfo(@RequestParam Integer commentId){
		CommentBean commentBeans = new CommentBean();
		if(commentId==null || commentId ==0){
			return commentBeans;
		}
		commentBeans = infoService.commentInfo(commentId);
		return commentBeans;
	}
	
	/**
	 * 提交回复
	 * @param commentBean
	 * @return
	 */
	@RequestMapping("/updateComment")
	@ResponseBody
	public Object updateComment(@RequestBody CommentBean commentBean){
		HashMap<String, String> map = new HashMap<>();
		if (null == commentBean) {
			map.put("flag", "0");
			map.put("message", "参数不正确");
			return map;
		}
		boolean result = infoService.updateComment(commentBean);
		if (result) {
			map.put("flag", "1");
			map.put("message", "回复成功");
			return map;
		}
		map.put("flag", "0");
		map.put("message", "回复失败");
		return map;
	}
	
	@RequestMapping("/deleteComment")
	@ResponseBody
	public Object deleteComment(@RequestParam Integer commentId){
		HashMap<String, String> map = new HashMap<>();
		if(null== commentId || commentId==0){
			map.put("flag", "0");
			map.put("message", "参数不正确");
			return map;
		}
		boolean result = infoService.deleteComment(commentId);
		if (result) {
			map.put("flag", "1");
			map.put("message", "删除成功");
			return map;
		}
		map.put("flag", "0");
		map.put("message", "删除失败");
		return map;
		
	}

}
