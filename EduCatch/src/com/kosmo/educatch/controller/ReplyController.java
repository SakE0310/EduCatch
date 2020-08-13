
package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.ReplyService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ReplyVO;

@Controller
public class ReplyController {
	
	private Logger log = LoggerManager.getInstance().getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping("replyList.ec")
	public Map<String, Object> replyList(@ModelAttribute ReplyVO rvo,
										 Model model){
		
		log.info("ReplyController replyList >>> 댓글 조회 성공 ");
		log.info("reviewboard_rbno >>> "+rvo.getReviewboard_rbno()+"member_mno >>> "+rvo.getMember_mno()+"reno >>> "+rvo.getReno());
		
		List<ReplyVO> replyList=replyService.replyList(rvo);
		
		Map<String, Object> m=new HashMap<String, Object>();
		
		m.put("replyList", replyList);
		
		log.info("ReplyController replyList >>> 끝 ");
		return m;
	}
	
	
	@ResponseBody
	@RequestMapping("creplyList.ec")
	public Map<String, Object> creplyList(@ModelAttribute ReplyVO rvo,
										 Model model){
		
		log.info("ReplyController replyList >>> 댓글 조회 성공 ");
		log.info("consultboard_cbno >>> "+rvo.getConsultboard_cbno()+"member_mno >>> "+rvo.getMember_mno()+"reno >>> "+rvo.getReno());
		
		List<ReplyVO> creplyList=replyService.creplyList(rvo);
		
		Map<String, Object> m=new HashMap<String, Object>();
		
		m.put("creplyList", creplyList);
		
		log.info("ReplyController creplyList >>> 끝 ");
		return m;
	}
	
	@ResponseBody
	@RequestMapping("replyInsert.ec")
	public String replyInsert(@ModelAttribute ReplyVO rvo) {
		log.info("ReplyController replyList >>> 댓글 입력 성공 ");
		
		int nCntReplyInsert = replyService.replyInsert(rvo);
		
		String insertResult = "";
		
		if(nCntReplyInsert == 1){
			log.info("댓글등록 성공 >>> nCntReplyInsert : " + nCntReplyInsert);
			insertResult = "댓글이 등록되었습니다.";
		}else{
			log.info("댓글등록 실패 >>> nCntReplyInsert : " + nCntReplyInsert);
			insertResult = "댓글등록에 실패했습니다.";
		}
		
		log.info("ReplyController replyList >>> 댓글 끝 ");
		
		return insertResult;
		
		
	}
	
	@ResponseBody
	@RequestMapping("replyUpdate.ec")
	public String replyUpdate(@ModelAttribute ReplyVO rvo,
							  HttpServletRequest request) {
		log.info("ReplyController replyList >>> 댓글 수정 성공");
		
		
		int nCntReplyUpdate = replyService.replyUpdate(rvo);
		
		String reno=request.getParameter("reno");
		log.info("reno >>> "+reno);
		String updateResult = "";
		
		if(nCntReplyUpdate==1){
			log.info("댓글수정 성공 >>> nCntReplyUpdate : " + nCntReplyUpdate);
			updateResult = "댓글이 수정되었습니다.";
		}else{
			log.info("댓글수정 실패 >>> nCntReplyUpdate : " + nCntReplyUpdate);
			updateResult = "댓글수정에 실패했습니다.";
		}
		
		log.info("ReplyController replyList >>> 댓글 수정 끝");
		
		return updateResult;
		
	}
	
	@ResponseBody
	@RequestMapping("replyDelete")
	public String replyDelete(@ModelAttribute ReplyVO rvo) {
		log.info("ReplyController replyDelete >>> 댓글 수정 성공");
		
		int nCntReplyDelete = replyService.replyDelete(rvo);
		String deleteResult = "";
		
		if(nCntReplyDelete==1){
			log.info("댓글삭제 성공 >>> nCntReplyDelete : " + nCntReplyDelete);
			deleteResult = "댓글이 삭제되었습니다.";
		}else{
			log.info("댓글삭제 실패 >>> nCntReplyDelete : " + nCntReplyDelete);
			deleteResult = "댓글삭제에 실패했습니다.";
		}
		
		return deleteResult;
	}

}

