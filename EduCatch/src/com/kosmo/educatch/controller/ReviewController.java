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

	
	@RequestMapping("/listReview.ec")
	public ModelAndView listReview(@ModelAttribute ReviewVO param,
									HttpServletRequest request) {
		
		log.info("ReviewController listReview >>> 호출성공");
		
		List<ReviewVO>
	}
	
	

	
}
