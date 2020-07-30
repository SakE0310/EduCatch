package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class EventController {
	private static String CONTEXT_PATH="notice/noticeBoard";
	private static Logger log = Logger.getLogger(EventController.class);
	
	//private NoticeService noticeService;
	
	
	//공지사항 게시판 목록 조회
	@RequestMapping("/listEvent.ec")
	public ModelAndView listEvent( ) {
		log.info("EventController listEvent 시작 >>>");

		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/event");
		
		log.info("EventController listEvent 끝 >>>");
		return mav;
	}
}
