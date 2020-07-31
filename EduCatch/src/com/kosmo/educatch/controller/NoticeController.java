package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.NoticeService;
import com.kosmo.educatch.vo.NoticeVO;

//공지사항 게시판
@Controller
public class NoticeController {
	private static Logger log = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	//============ 공지사항 게시판 목록 조회===================================
	@RequestMapping("/listNotice.ec")
	public ModelAndView listNotice(@ModelAttribute NoticeVO param) {
		log.info("NoticeController listNotice 시작 >>>");

		List<NoticeVO> list = noticeService.listNotice(param);
		log.info("NoticeController listNotice list.size()>>>"+ list.size());

		for(int i=0; i<list.size(); i++) {
			//list를 VO로 형변환해준다.
			NoticeVO nvo=(NoticeVO)list.get(i);
			log.info("nvo.getNno()>>>"+nvo.getNno());
			log.info("nvo.getNsubject()>>>"+nvo.getNsubject());
			log.info("nvo.getNname()>>>"+nvo.getNname());
			log.info("nvo.getNimg()>>>"+nvo.getNimg());
			log.info("nvo.getNcontent()>>>"+nvo.getNcontent());
			log.info("nvo.getNdeleteyn()>>>"+nvo.getNdeleteyn());
			log.info("nvo.getNinsertdate()>>>"+nvo.getNinsertdate());
			log.info("nvo.getNupdatedate()>>>"+nvo.getNupdatedate());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList",list);
		mav.setViewName("notice/noticeBoard/notice");
		
		log.info("NoticeController listNotice 끝 >>>");
		log.info("NoticeController listNotice 끝 >>>");
		return mav;
	}
	
	//===============공지사항 관리자모드 : 등록================================
	@RequestMapping("/insertNotice.ec")
	public ModelAndView insertNotice() {
		log.info("NoticeController insertNotice 시작 >>>");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticeBoard/noticeInsert");
		
		log.info("NoticeController insertNotice 끝 >>>");
		return mav;
	}
			
}
