package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.vo.ConsultVO;

@Controller
public class ConsultController {
	
private static Logger log=Logger.getLogger(ReviewController.class);

	@Autowired
	private ConsultService consultService;

	//전체조회
	@RequestMapping("listConsult")
	public ModelAndView listConsult(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController listConsult >>> 호출성공");

		List<ConsultVO> list=consultService.listConsult;
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
		mav.setViewName("community/consultBoard/consultBoard");
		
		log.info("mav >>> "+mav);
		log.info("ConsultController listConsult >>> 끝");
		
		return mav;
	}

}
