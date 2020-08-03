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
		log.info("listFreeBoard함수 끝>>>");
		return mav;
	}
	
	//자유게시판 상세정보조회(등록일 경우)
	@RequestMapping("selectfreeboardI")
	public ModelAndView selectFreeBoardI(@ModelAttribute FreeVO param) {
		log.info("selectfreeboardI함수 시작>>>");
		ModelAndView mav = new ModelAndView();
		log.info("fbno>>>"+param.getFbno());
		if(param.getFbno().length()==0) {
			mav.addObject("mode","insert");
		}
		mav.setViewName("community/freeboard/insertFreeBoard");
		log.info("selectfreeboardI함수 끝>>>");
		return mav;
	}
	//자유게시판 상세정보조회(수정,삭제일경우)
	@RequestMapping("selectfreeboardUD")
	public ModelAndView selectFreeBoardUD(@ModelAttribute FreeVO param) {
		log.info("selectfreeboardUD함수 시작>>>");
		ModelAndView mav = new ModelAndView();
		log.info("fbno>>>"+param.getFbno());
		
		if(param.getFbno().length()>0 && param.getFbno()!=null) {
			FreeVO freevo = freeService.selectFreeBoard(param);
			mav.addObject("freevo", freevo);
			mav.addObject("mode", "update");
		}
		mav.setViewName("community/freeboard/updateFreeBoard");
		log.info("selectfreeboardUD함수 끝>>>");
		return mav;
	}
	//자유게시판 등록
	@RequestMapping("insertfreeboard")
	public ModelAndView insertFreeBoard(@ModelAttribute FreeVO param) {
		log.info("insertFreeBoard 함수 진입");
		log.info("글번호"+param.getFbno());
		log.info("제목"+param.getFbsubject());
		log.info("작성자"+param.getFbname());
		log.info("내용"+param.getFbcontent());
		log.info("첨부파일"+param.getFbimg());
		log.info("삭제여부"+param.getFbdeleteyn());
		log.info("입력일"+param.getFbinsertdate());
		log.info("수정일"+param.getFbupdatedate());
		log.info("updateFreeBoard함수 끝");
		String resultStr="";
		int result=freeService.insertFreeBoard(param);
		log.info("result>>>"+result);
		
		if(result>0) resultStr="등록완료가 되었습니다";
		else resultStr="등록에 문제가 있어서 완료하지 못했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("community/freeboard/insertResult");
		log.info("mav>>>"+mav);
		return mav;
	}
	//자유게시판 수정
	@RequestMapping("updatefreeboard")
	public ModelAndView updateFreeBoard(@ModelAttribute FreeVO param) {
		log.info("updateFreeBoard함수 진입");
		log.info("글번호"+param.getFbno());
		log.info("제목"+param.getFbsubject());
		log.info("작성자"+param.getFbname());
		log.info("내용"+param.getFbcontent());
		log.info("첨부파일"+param.getFbimg());
		log.info("삭제여부"+param.getFbdeleteyn());
		log.info("입력일"+param.getFbinsertdate());
		log.info("수정일"+param.getFbupdatedate());
		
		String updateStr ="";
		int result = freeService.updateFreeBoard(param);
		log.info("result"+result);
		if(result>0) updateStr="수정을 완료하였습니다";
		else updateStr="수정하는데 문제가 생겼습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", updateStr);
		mav.setViewName("community/freeboard/updateResult");
		
		log.info("updateFreeBoard함수 끝");
		return mav;
	}
	
	//자유게시판 삭제
	@RequestMapping("deletefreeboard")
	public ModelAndView deleteFreeBoard(@ModelAttribute FreeVO param) {
		return null;
	}
}
