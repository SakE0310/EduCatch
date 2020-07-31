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
			log.info("제목"+list.get(i).getFbsubject());
			log.info("작성자"+list.get(i).getFbname());
			log.info("첨부파일"+list.get(i).getFbimg());
			log.info("내용"+list.get(i).getFbcontent());
			log.info("회원번호"+list.get(i).getMember_mno());
			log.info("삭제여부"+list.get(i).getFbdeleteyn());
			log.info("작성일"+list.get(i).getFbinsertdate());
			log.info("수정일"+list.get(i).getFbupdatedate());
		}
		log.info("list.getname()"+list.get(0).getFbname());
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardlist",list);
		mav.setViewName("community/freeboard/listFreeBoard");
		
		log.info("mav>>>"+mav);
		log.info("freeBoard함수 끝>>>");
		return mav;
	}
	
	//자유게시판 상세정보조회(등록일 경우,수정,삭제일경우)
	@RequestMapping("selectfreeboard")
	public ModelAndView selectFreeBoard(@ModelAttribute FreeVO param) {
		log.info("selectFreeBoard함수 시작>>>");
		ModelAndView mav = new ModelAndView();
		log.info("fbno>>>"+param.getFbno());
		if(param.getFbno().length()==0) {
			mav.addObject("mode","insert");
		}
		mav.setViewName("community/freeboard/insertFreeBoard");
		log.info("selectFreeBoard함수 끝>>>");
		return mav;
	}
	
}
