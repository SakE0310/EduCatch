/*
package com.kosmo.educatch.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.ReplyService;
import com.kosmo.educatch.vo.ReplyVO;




@Controller
public class ReplyController {
	
	private Logger log = LoggerManager.getInstance().getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping("listReply")
	public ModelAndView listReply(@ModelAttribute ReplyVO param) {
		log.info("ReplyController listReply >>> 호출성공");
		
		List<ReplyVO> list=replyService.listReply(param);
		log.info("list.size() >>> "+list.size());
		
		int listCnt=list.size();
		
		for(int i=0; i<listCnt; i++) {
			ReplyVO rvo=(ReplyVO)list.get(i);
			
			log.info(rvo.getRecontent());

		}
		
	}
}
*/
