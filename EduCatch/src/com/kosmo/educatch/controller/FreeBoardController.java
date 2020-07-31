package com.kosmo.educatch.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.FreeService;
import com.kosmo.educatch.vo.FreeVO;



@Controller
public class FreeBoardController {
	private static Logger log=
			Logger.getLogger(FreeBoardController.class);
	
	@Autowired
	private FreeService freeService;
	
	//자유게시판 목록조회
	@RequestMapping("/freeboardlist")
	public ModelAndView listFreeBoard(@ModelAttribute FreeVO param) {
		log.info("listFreeBoard함수 진입>>>");
		
		List<FreeVO> list = freeService.listFreeBoard(param);
		int listSize = list.size();
		log.info("list사이즈>>>"+listSize);
		
		for(int i=0; i<listSize; i++) {
			log.info("글번호"+list.get(i).getFbno());
			log.info("글번호"+list.get(i).getFbno());
			log.info("글번호"+list.get(i).getFbno());
			log.info("글번호"+list.get(i).getFbno());
			log.info("글번호"+list.get(i).getFbno());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardlist",list);
		mav.setViewName("comunity/freeboard/listFreeBoard");
		
		log.info("mav>>>"+mav);
		log.info("freeBoard함수 끝>>>");
		return mav;
		
	}
}
