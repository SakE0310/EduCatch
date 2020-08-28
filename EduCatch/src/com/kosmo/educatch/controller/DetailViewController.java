package com.kosmo.educatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.DetailViewService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.kosmo.educatch.vo.MemberVO;
import com.kosmo.educatch.vo.ReserVO;
import com.kosmo.educatch.vo.ReviewVO;
import com.kosmo.educatch.vo.SubjectVO;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	
	@Autowired
	private DetailViewService detailViewService;

	// ----------상세조회페이지
	@RequestMapping("listDetailView.ec")
	public ModelAndView listDetailView(@ModelAttribute
										SubjectVO svo, ReviewVO rvo,HttpServletRequest request) {
		log.info("DetailViewController listDetailView 시작 >>>> ");
		ModelAndView mav = new ModelAndView();
		
		String ano = (String)request.getParameter("ano");
		log.info("ano >!>!>!>!>!>"+ano);
		
		AcademyVO avo = detailViewService.academyView(ano);
		ConvenienceVO cvo = detailViewService.conView(ano);
		AcademyVO gvo = detailViewService.gradeView(ano);
		List<SubjectVO> subjectlist = detailViewService.subjectViewList(svo);
		List<ReviewVO> reviewlist = detailViewService.reviewList(rvo);
		

		mav.addObject("avo", avo);
		mav.addObject("cvo", cvo);
		mav.addObject("gvo", gvo);
		mav.addObject("subjectList", subjectlist);
		mav.addObject("reviewlist", reviewlist);
		
		mav.setViewName("search/detailView");
		
		log.info("DetailViewController listDetailView mav >>> : " + mav);
		
		log.info("DetailViewController listDetailView 끝 >>>> ");
		
		return mav;
	}
	
	// ----------찜목록 추가 ajax
	@ResponseBody
	@RequestMapping("insertBookmark.ec")
	public Map<String, String> insertBookmark(HttpServletRequest request, HttpSession session){
		log.info("DetailViewController insertBookmark 시작 >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano(ano);
		avo.setAno(ano);
		avo.setMember_mno(member_mno);
		
		int i = detailViewService.insertBookmark(avo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("DetailViewController insertBookmark 끝 >>> ");
		return map;
	}
	
	// ----------찜목록제거 ajax
	@ResponseBody
	@RequestMapping("deleteBookmark.ec")
	public Map<String, String> deleteBookmark(HttpServletRequest request, HttpSession session){
		log.info("DetailViewController deleteBookmark >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		
		
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		AcademyVO avo = new AcademyVO();
		avo.setAcademy_ano(ano);
		avo.setAno(ano);
		avo.setMember_mno(member_mno);
		int i = detailViewService.deleteBookmark(avo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		log.info("DetailViewController deleteBookmark 끝 >>> ");
		return map;
	}
	
	// ----------찜목록조회 ajax
	@ResponseBody
	@RequestMapping("selectBookmark.ec")
	public Map<String, String> selectBookmark(HttpServletRequest request, HttpSession session,
										AcademyVO param){
		log.info("DetailViewController selectBookmark >>> ");
		
		MemberVO mvo = null;
		String member_mno="";
		if(session != null) {
			mvo = (MemberVO)session.getAttribute("user");
			member_mno = mvo.getMno();
		}
		
		param.setMember_mno(member_mno);
		
		
		String ano = request.getParameter("ano");
		log.info("ano >!>!>!> " + ano);
		
		param.setAno(ano);
		param.setAcademy_ano(ano);
		
		
		List<AcademyVO> bookmarklist = detailViewService.selectBookmark(param);
		
		int i = bookmarklist.size();
		log.info("booksize >>>" + i);
		
		
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "failed");
		}
		
		
		
		log.info("DetailViewController selectBookmark 끝 >>> ");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selReser")
	public Map<String, List<ReserVO>> selectReser(HttpServletRequest request){
		AcademyVO avo = new AcademyVO();
		avo.setAno(request.getParameter("ano"));
		avo.setMember_mno(request.getParameter("mno"));
		log.info("selReser mno >>> " + avo.getMember_mno());
		List<ReserVO> list = detailViewService.selectReser(avo);
		Map<String, List<ReserVO>> map = new HashMap<String, List<ReserVO>>();
		map.put("result", list);
		return map;
	};
	
	@ResponseBody
	@RequestMapping("inReser.ec")
	public Map<String, String> inReser(HttpServletRequest request,HttpSession session){
		ReserVO rvo = new ReserVO();
		rvo.setTtno(request.getParameter("ttno"));
		if(session != null) {
			MemberVO mvo = (MemberVO)session.getAttribute("user");
			rvo.setMno(mvo.getMno());
		}
		
		
		int i = 0;
		i = detailViewService.inReser(rvo);
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("delReser.ec")
	public Map<String, String> delReser(HttpServletRequest request,HttpSession session){
		ReserVO rvo = new ReserVO();
		rvo.setTtno(request.getParameter("ttno"));
		if(session != null) {
			MemberVO mvo = (MemberVO)session.getAttribute("user");
			rvo.setMno(mvo.getMno());
		}
		
		int i = 0;
		i = detailViewService.delReser(rvo);
		Map<String, String> map = new HashMap<String, String>();
		if(i > 0) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
}