package com.kosmo.educatch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.ReviewService;
import com.kosmo.educatch.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private static Logger log=Logger.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;

	//전체조회
	@RequestMapping("listReview")
	public ModelAndView listReview(@ModelAttribute ReviewVO param) {
		
		log.info("ReviewController listReview >>> 호출성공");
		log.info(param);
		log.info(param.getMember_mno());
		log.info(param.getRbcontent());
		
		
		List<ReviewVO> list=reviewService.listReview(param);
		log.info("list.size() >>> "+list.size());
		
		int listCnt = list.size();
		
		for(int i=0; i<listCnt; i++) {
			ReviewVO rvo=(ReviewVO)list.get(i);
			
			log.info("rbno >>> "+rvo.getRbno());
			log.info("rbsubject >>> "+rvo.getRbsubject());
			log.info("rbname >>> "+rvo.getRbname());
			log.info("rbimg >>> "+rvo.getRbimg());
			log.info("rbcontent >>> "+rvo.getRbcontent());
			log.info("academyano >>> "+rvo.getAcademy_ano());
			log.info("membermno >>> "+rvo.getMember_mno());
			log.info("rbgrade >>> "+rvo.getRbgrade());
			log.info("rbdeleteyn >>> "+rvo.getRbdeleteyn());
			log.info("rbinsertdate >>> "+rvo.getRbinsertdate());
			log.info("rbupdatedate >>> "+rvo.getRbupdatedate());

		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listReview", list);
		mav.setViewName("comunity/reviewBoard/reviewBoard");
		
		log.info("mav >>> "+mav);
		log.info("ReviewController listReview >>> 끝");
		
		return mav;
	}
	
	

	
}
