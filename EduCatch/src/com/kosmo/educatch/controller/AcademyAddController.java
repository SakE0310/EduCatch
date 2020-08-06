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
import com.kosmo.educatch.vo.SearchVO;
import java.util.List;

@Controller
public class AcademyAddController {
	private static Logger log = Logger.getLogger(AcademyAddController.class);

	@Autowired
	private AcademyAddService academyAddService;

	@RequestMapping("academyPage")
	public ModelAndView pageAcademy() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/academyAdd");
		return mav;
	}

	// 학원등록 버튼 눌렀을때
	@RequestMapping("insertAcademy")
	public ModelAndView insertAcademy(@ModelAttribute AcademyVO avo,
									SearchVO svo, HttpServletRequest request) {
		log.info("AcademyAddController insertAcademy >>> ");
		ModelAndView mav = new ModelAndView();
		
		log.info(avo.getCmajor());
		academyAddService.selectCategory(svo);
		
		log.info("getCategory_cno" + avo.getCategory_cno());
		
		String cno = svo.getCno();
		
		avo.setCategory_cno(cno);
		
		log.info("getCno" + svo.getCno());
		log.info("getCmajor" + svo.getCmajor());
		log.info("getCminor" + svo.getCminor());
		log.info(request.getParameter("cmajor"));
		log.info(request.getParameter("cminor"));
		log.info(request.getParameter("category_cno"));

//		int result = academyAddService.insertAcademy(avo);

		
//		if (result > 0) {
//			mav.addObject("resultStr", "등록 성공");
//		} else {
//			mav.addObject("resultStr", "등록 실패");
//		}

		mav.setViewName("search/academyAdd");

		return mav;
	}// end of insertAcademy
}
