package com.kosmo.educatch.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.AcademyAddService;
import com.kosmo.educatch.vo.AcademyVO;

@Controller
public class AcademyAddController {
	private static Logger log = Logger.getLogger(AcademyAddController.class);

	@Autowired
	private AcademyAddService academyAddService;

	@RequestMapping("academyPage")
	public ModelAndView pageAcademy() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/fuck2");
		return mav;
	}

	// 학원등록 버튼 눌렀을때
	@RequestMapping("insertAcademy")
	public ModelAndView insertAcademy(@ModelAttribute AcademyVO param, HttpServletRequest request) {
		log.info("AcademyAddController insertAcademy >>> ");
		ModelAndView mav = new ModelAndView();

		int result = academyAddService.insertAcademy(param);

		if (result > 0) {
			mav.addObject("resultStr", "성공");
		} else {
			mav.addObject("resultStr", "실패");
		}

		mav.setViewName("search/fuck2");

		return mav;
	}// end of insertAcademy
}
