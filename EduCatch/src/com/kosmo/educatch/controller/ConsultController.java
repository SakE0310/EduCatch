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

import com.kosmo.educatch.service.ConsultService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConsultVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReviewVO;

@Controller
public class ConsultController {
	
private static Logger log=Logger.getLogger(ReviewController.class);

	@Autowired
	private ConsultService consultService;

	//전체조회
	@RequestMapping("listConsult")
	public ModelAndView listConsult(@ModelAttribute ConsultVO param, AcademyVO avo,
									HttpServletRequest request) {
		
		log.info("ConsultController listConsult >>> 호출성공");
		
		String pno="P003";
		String pagesize="5";
		String groupsize="5";
		String curpage="1";
		String totalcount="0";
		
		//날짜 조회
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();
		
		//시작일 종료일 날짜형식 변환
		if(startDate == null && endDate == null) {
			startDate = "";
			endDate ="";
		}else {
			startDate = startDate.replace("/", "-");
			endDate = endDate.replace("/", "-");
			log.info("startDate>>>"+startDate);
			log.info("endDate>>>"+endDate);
		}
		
		
		if(request.getParameter("curpage") !=null) {
			curpage=request.getParameter("curpage");
		}
		
		param.setPno(pno);
		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);

		List<ConsultVO> list=consultService.listConsult(param);
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
			
			log.info("pno >>> "+cvo.getPno());
			log.info("pagesize >>> "+cvo.getPagesize());
			log.info("groupsize >>> "+cvo.getGroupsize());
			log.info("curpage >>> "+cvo.getCurpage());
			log.info("totalcount >>> "+cvo.getTotalcount());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listConsult", list);
		mav.setViewName("community/consultBoard/consultBoard");
		
		log.info("mav >>> "+mav);
		log.info("ConsultController listConsult >>> 끝");
		
		return mav;
	}
	
	//검색 페이징
	@RequestMapping("searchConsult")
	public ModelAndView searchConsult(@ModelAttribute ConsultVO param,
			HttpServletRequest request) {
		
		log.info("ConsultController searchConsult >>> 호출성공");
		
		String pno="P003";
		String pagesize="5";
		String groupsize="5";
		String curpage="1";
		String totalcount="0";
		
		//날짜 조회
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();
		
		//시작일 종료일 날짜형식 변환
		if(startDate == null && endDate == null) {
			startDate = "";
			endDate ="";
		}else {
			startDate = startDate.replace("/", "-");
			endDate = endDate.replace("/", "-");
			log.info("startDate>>>"+startDate);
			log.info("endDate>>>"+endDate);
		}
		
		
		if(request.getParameter("curpage") !=null) {
			curpage=request.getParameter("curpage");
		}
		
		param.setPno(pno);
		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);
		
		List<ConsultVO> list=consultService.searchConsult(param);
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
			
			log.info("pno >>> "+cvo.getPno());
			log.info("pagesize >>> "+cvo.getPagesize());
			log.info("groupsize >>> "+cvo.getGroupsize());
			log.info("curpage >>> "+cvo.getCurpage());
			log.info("totalcount >>> "+cvo.getTotalcount());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("searchConsult", list);
		mav.setViewName("community/consultBoard/consultBoard_search");
		
		log.info("mav >>> "+mav);
		log.info("ConsultController searchConsult >>> 끝");
		
		return mav;
	}
	
	
	//글쓰기 버튼 눌렀을 때
	@RequestMapping("cinsertDisplay")
	public ModelAndView cinsertDisplay(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController cinsertDisplay >>> 호출 성공 ");
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/consultBoard/consultInsert");
		
		log.info("ConsultController cinsertDisplay >>> 끝 ");
		return mav;
	
	}
	
	//등록 버튼 눌렀을 때
	@RequestMapping("insertConsult")
	public ModelAndView insertConsult(HttpServletRequest request,
									  @ModelAttribute AcademyVO avo, ConsultVO param,
																	 MemberVO mvo) {
		log.info("ConsultController insertConsult >>> 호출 성공");
		String mid=mvo.getMid();
		String aname = avo.getAname();
		
		AcademyVO avov = consultService.academyAno(aname);
		MemberVO mvov=consultService.memberMno(mvo);
		
		String ano = avov.getAno();
		String mno=mvov.getMid();
		
		param.setAcademy_ano(ano);
		param.setMember_mno(mno);
		
		
		String resultStr="";
		int result=consultService.insertConsult(param);
		
		ModelAndView mav=new ModelAndView();
		if(result>0) 
			resultStr="등록 완료";
		else
			resultStr="등록 실패";
		
		mav.addObject("result", resultStr);
		mav.setViewName("community/consultBoard/consultInsertForm");
		
		log.info("ConsultController insertConsult >>> 끝");
		return mav;
		
	}
	
	//상담 상세 조회
	@RequestMapping("selectConsult")
	public ModelAndView selectConsult(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController selectConsult >>> 호출 성공");
		
		String cbno=(String)param.getCbno();
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("ConsultVO", consultService.selectConsult(cbno));
		mav.setViewName("community/consultBoard/detailConsult");
		
		log.info("ConsultController selectConsult >>> 끝");
		
		return mav;
		
	}
	
	
	//상담 수정 조회
	@RequestMapping("selectUpdate1")
	public ModelAndView selectUpdate1(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController selectUpdate1 >>> 호출 성공");
		
		String cbno=(String)param.getCbno();
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("ConsultVOO", consultService.selectUpdate1(cbno));
		mav.setViewName("community/consultBoard/updateConsult");
		
		log.info("ConsultController selectUpdate1 >>> 끝");
		
		return mav;
		
	}
	
	//수정 버튼 눌렀을 떄
	@RequestMapping("updateConsult")
	public ModelAndView updateConsult(@ModelAttribute ConsultVO param) {
		log.info("ConsultController updateConsult >>> 호출 성공");
		String resultStr="";
		int nCnt=consultService.updateConsult(param);
		
		ModelAndView mav=new ModelAndView();
		if(nCnt>0) {
			resultStr="update";
			log.info("수정 완료");
			mav.addObject("ConsultVOO", param);
		}else {
			resultStr="update";
			log.info("수정 실패");
		}
		mav.addObject("result", resultStr);
		mav.setViewName("community/consultBoard/result");
		
		log.info("ConsultController updateConsult >>> 끝");
		
		return mav;
	}
		
		
	//삭제 버튼 눌렀을 때
	@RequestMapping("deleteConsult")
	public ModelAndView deleteConsult(@ModelAttribute ConsultVO param) {
		
		log.info("ConsultController deleteConsult >>> 호출 성공");		
		
		String resultStr="";
		String isSuccess="";
		String cbno=(String)param.getCbno();
		
		int nCnt=consultService.deleteConsult(cbno);
		
		ModelAndView mav=new ModelAndView();
		
		if(nCnt>0) {
			resultStr = "delete";
			isSuccess="true";
			log.info("삭제완료");
			
		}else {
			resultStr = "delete";
			isSuccess="false";
			log.info("삭제실패");
		}
		
		mav.addObject("result", resultStr);
		mav.addObject("isSuccess", isSuccess);
		mav.setViewName("community/consultBoard/result");
		
		log.info("ConsultController deleteConsult >>> 끝");	
		
		return mav;
		
		
	}
	
	//학원리스트 조회
	@RequestMapping("cacademyList.ec")
	public ModelAndView cacademyList(@ModelAttribute AcademyVO param) {

		log.info("ReviewController cacademyList >>> 호출성공");

		
		List<AcademyVO> list=consultService.cacademyList(param);
		log.info("list.size() >>> "+list.size());
		
		int listCnt = list.size();
		
		for(int i=0; i<listCnt; i++) {
			AcademyVO avo=(AcademyVO)list.get(i);
			
			log.info("avo.getAno()		>>"+avo.getAno());
			log.info("avo.getAname()	>>"+avo.getAname());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cacademyList", list);
		mav.setViewName("community/consultBoard/search_pop");
		
		log.info("mav >>> "+mav);
		log.info("ReviewController cacademyList >>> 끝");
		
		return mav;
	}

}