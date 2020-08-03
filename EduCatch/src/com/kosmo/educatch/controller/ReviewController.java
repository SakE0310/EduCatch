package com.kosmo.educatch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.ReviewService;
import com.kosmo.educatch.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private static Logger log=Logger.getLogger(ReviewController.class);

	@Autowired
	private ReviewService reviewService;

	//전체조회
	@RequestMapping("listReview.ec")
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
		mav.setViewName("community/reviewBoard/reviewBoard");
		
		log.info("mav >>> "+mav);
		log.info("ReviewController listReview >>> 끝");
		
		return mav;
	}
	
	//글쓰기 버튼 눌렀을때
	@RequestMapping("/insertDisplay.ec")
	public ModelAndView insertDisplay(@ModelAttribute ReviewVO param) {
		
		log.info("ReviewController insertDisplay >>> 호출 성공 ");
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/reviewBoard/reviewInsert");
		
		return mav;
	
	}
	
	//등록 버튼 눌렀을 때
	@RequestMapping("insertReview.ec")
	public ModelAndView insertReview(@ModelAttribute ReviewVO param,
									 HttpServletRequest request) {
		log.info("ReviewController insertReview >>> 호출 성공 ");

		String resultStr="";
		int result=reviewService.insertReview(param);
		
		if(result>0) 
			resultStr = "등록 페이지 ";
		else
			resultStr = "등록 실패";
		
		log.info("param.getRbno() >> "+param.getRbno());
		log.info("param.getRbsubject() >> "+param.getRbsubject());
		log.info("param.getRbgrade() >> "+param.getRbgrade());
		log.info("param.getAcademy_ano() >> "+param.getAcademy_ano());
		log.info("param.getRbcontent() >> "+param.getRbcontent());
		log.info("param.getRbimg() >> "+param.getRbimg());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("community/reviewBoard/result");
		log.info("ReviewController insertReview >>> 끝 ");
		return mav;
	
	}
	
	//상세 조회
	@RequestMapping("/selectReview.ec")
	public ModelAndView selectReview(@RequestParam(value="rbno", required=false) String rbno) {
		//value="rbno", required=false
		log.info("ReviewController selectReview >>> 호출 성공");
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("ReviewVO", reviewService.selectReview(rbno));
		mav.setViewName("community/reviewBoard/detailReview");

		
		log.info("ReviewController selectReview >>> 끝");
		
		return mav;
	}
	
	//업데이트 상세 조회
	@RequestMapping("/selectUpdate.ec")
	public ModelAndView selectUpdate(@RequestParam(value="rbno", required=false) String rbno) {
		//value="rbno", required=false
		log.info("ReviewController selectUpdate >>> 호출 성공");
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("ReviewVOO", reviewService.selectUpdate(rbno));
		mav.setViewName("community/reviewBoard/updateReview");
		
		
		log.info("ReviewController selectUpdate >>> 끝");
		
		return mav;
	}
	
	//수정 버튼 눌렀을 때
	@RequestMapping("/updateReview.ec")
	public ModelAndView updateReview(@ModelAttribute ReviewVO param) {
		log.info("ReviewController updateReview >>> 호출 성공");
		String resultStr="";
		int result=reviewService.updateReview(param);
		
		if(result>0)
			resultStr="수정 성공";
		else
			resultStr="수정 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("community/reviewBoard/updateReview");
		
		return mav;
	}
	
	

	
}
