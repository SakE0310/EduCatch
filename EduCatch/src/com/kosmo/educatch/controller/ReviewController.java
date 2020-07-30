package com.kosmo.educatch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import com.kosmo.educatch.service.ReviewService;
import com.kosmo.educatch.vo.ReviewVO;


@Controller
public class ReviewController {
	
	private static Logger log=Logger.getLogger(ReviewController.class);
	
	private static final String CONTEXT_PATH="reviewboard";
	
	@Autowired
	private ReviewService reviewService;

	//전체조회
	@RequestMapping("/listReview.ec")
	public ModelAndView listReview(@ModelAttribute ReviewVO param,
									HttpServletRequest request) {
		
		log.info("ReviewController listReview >>> 호출성공");
		
		List<ReviewVO> list=reviewService.listReview(param);
		
		int listCnt=list.size();
		
		for(int i=0; i<listCnt; i++) {
			ReviewVO rvo=(ReviewVO)list.get(i);
			
			log.info("rbno >>> "+rvo.getRbno());
			log.info("rbsubject >>> "+rvo.getRbsubject());
			log.info("rbname >>> "+rvo.getRbname());
			log.info("rbimg >>> "+rvo.getRbimg());
			log.info("rbcontent >>> "+rvo.getRbcontent());
			log.info("academyano >>> "+rvo.getAcademyano());
			log.info("membermno >>> "+rvo.getMembermno());
			log.info("rbgrade >>> "+rvo.getRbgrade());
			log.info("rbdeleteyn >>> "+rvo.getRbdeleteyn());
			log.info("rbinsertdate >>> "+rvo.getRbinsertdate());
			log.info("rbupdatedate >>> "+rvo.getRbupdatedate());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listReview", list);
		mav.setViewName(CONTEXT_PATH+"/reviewBoard");
		
		return mav;
	}
	
	

	
}
