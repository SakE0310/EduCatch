
package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.FreeReplyService;
import com.kosmo.educatch.vo.ReplyVO;

@Controller
public class FreeReplyController {
	
	private Logger log = LoggerManager.getInstance().getLogger(FreeReplyController.class);
	
	@Autowired
	private FreeReplyService freereplyService;
	
	@ResponseBody
	@RequestMapping("replyFreeList.ec")
	public Map<String, Object> replyFreeList(@ModelAttribute ReplyVO param,
										 Model model){
		
		log.info("FreeReplyController replyList >>> 댓글 조회 성공 ");
		log.info("freeboard_rbno >>> "+param.getFreeboard_fbno()+"member_mno >>> "+param.getMember_mno()+"reno >>> "+param.getReno());
		
		List<ReplyVO> replyList=freereplyService.replyFreeList(param);
		
		Map<String, Object> m=new HashMap<String, Object>();
		
		m.put("replyList", replyList);
		
		log.info("FreeReplyController replyList >>> 끝 ");
		return m;
	}
	
	
	@ResponseBody
	@RequestMapping("replyFreeInsert.ec")
	public String replyFreeInsert(@ModelAttribute ReplyVO param) {
		log.info("replyFreeInsert replyList >>> 댓글 입력 성공 ");
		
		int nCntReplyInsert = freereplyService.replyFreeInsert(param);
		
		String insertResult = "";
		
		if(nCntReplyInsert == 1){
			log.info("댓글등록 성공 >>> nCntReplyInsert : " + nCntReplyInsert);
			insertResult = "댓글이 등록되었습니다.";
		}else{
			log.info("댓글등록 실패 >>> nCntReplyInsert : " + nCntReplyInsert);
			insertResult = "댓글등록에 실패했습니다.";
		}
		
		log.info("FreeReplyController replyList >>> 댓글 끝 ");
		
		return insertResult;
	}
	
	@ResponseBody
	@RequestMapping("replyFreeUpdate.ec")
	public String replyUpdate(@ModelAttribute ReplyVO param,
							  HttpServletRequest request) {
		log.info("ReplyController replyList >>> 댓글 수정");
		
		log.info("회원번호>>>"+param.getMember_mno());
		
		int nCntReplyUpdate = freereplyService.replyFreeUpdate(param);
		
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
	@RequestMapping("replyFreeDelete")
	public String replyDelete(@ModelAttribute ReplyVO param) {
		log.info("ReplyController replyDelete >>> 댓글 삭제");
		
		log.info("회원번호>>"+param.getMember_mno());
		
		int nCntReplyDelete = freereplyService.replyFreeDelete(param);
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

