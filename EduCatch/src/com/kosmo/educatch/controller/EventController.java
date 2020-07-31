package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//이벤트 게시판
@Controller
public class EventController {
	private static Logger log = Logger.getLogger(EventController.class);
	
	
	//  서비스 두개 쓸려면 오토와이드도 두개 써야함
	//@Autowired
	//private EventService eventService;
	
	
	//공지사항 게시판 목록 조회
	@RequestMapping("/listEvent.ec")
	public ModelAndView listEvent( ) {
		log.info("EventController listEvent 시작 >>>");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/eventBoard/event");
		
		log.info("EventController listEvent 끝 >>>");
		return mav;
	}
}
