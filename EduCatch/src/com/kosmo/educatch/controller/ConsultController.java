package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.ConsultService;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.ReviewVO;

@Controller
public class ConsultController {
	
private static Logger log=Logger.getLogger(ReviewController.class);

	@Autowired
	private ConsultService consultService;

	//전체조회
	@RequestMapping("listConsult")
	public ModelAndView listConsult(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController listConsult >>> 호출성공");

		List<ConsultVO> list=consultService.listConsult(param);
		log.info("list.size() >>> "+list.size());
		
		int listCnt=list.size();
		
		for(int i=0; i<listCnt; i++) {
			ConsultVO cvo=(ConsultVO)list.get(i);
			
			log.info(cvo.getCbno());
			log.info(cvo.getCbsubject());
			log.info(cvo.getCbname());
			log.info(cvo.getCbcontent());
			log.info(cvo.getAcademy_ano());
			log.info(cvo.getMember_mno());
			log.info(cvo.getCdeleteyn());
			log.info(cvo.getCinsertdate());
			log.info(cvo.getCupdatedate());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listConsult", list);
		mav.setViewName("community/consultBoard/consultBoard");
		
		log.info("mav >>> "+mav);
		log.info("ConsultController listConsult >>> 끝");
		
		return mav;
	}
	
	
	//글쓰기 버튼 눌렀을 때
	@RequestMapping("cinsertDisplay")
	public ModelAndView cinsertDisplay(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController cinsertDisplay >>> 호출 성공 ");
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/consultBoard/consultInsert");
		
		log.info("ConsultController cinsertDisplay >>> 끝 ");
		return mav;
	
	}
	
	//등록 버튼 눌렀을 때
	@RequestMapping("insertConsult")
	public ModelAndView insertConsult(@ModelAttribute ConsultVO param) {
		log.info("ConsultController insertConsult >>> 호출 성공");
		
		String resultStr="";
		int result=consultService.insertConsult(param);
		
		ModelAndView mav=new ModelAndView();
		if(result>0) 
			resultStr="등록 완료";
		else
			resultStr="등록 실패";
		
		mav.addObject("result", resultStr);
		mav.setViewName("community/consultBoard/consultInsertForm");
		
		log.info("ConsultController insertConsult >>> 끝");
		return mav;
		
	}

}
