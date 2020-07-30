package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//공지사항 게시판
@Controller
public class NoticeController {
	private static String CONTEXT_PATH="notice";
	private static Logger log = Logger.getLogger(NoticeController.class);
	
	//private NoticeService noticeService;
	
	
	//공지사항 게시판 목록 조회
	@RequestMapping("/listNotice.ec")
	public ModelAndView listNotice( ) {
		log.info("NoticeController listNotice 시작 >>>");

		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/notice");
		
		log.info("NoticeController listNotice 끝 >>>");
		return mav;
	}
}
