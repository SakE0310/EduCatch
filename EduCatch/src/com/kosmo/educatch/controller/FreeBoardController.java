package com.kosmo.educatch.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.FilePathManager;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.FreeService;
import com.kosmo.educatch.vo.FreeVO;
import com.kosmo.educatch.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class FreeBoardController {
	private Logger log = LoggerManager.getInstance().getLogger(FreeBoardController.class);
	// 파일경로 바꿔주는 싱글톤 객체
	private FilePathManager fManager = FilePathManager.getInstance();
	
	@Autowired
	private FreeService freeService;
	
	//자유게시판 목록조회
	@RequestMapping("/freeboardlist")
	public ModelAndView listFreeBoard(@ModelAttribute FreeVO param, HttpServletRequest request) {
		log.info("listFreeBoard함수 진입>>>");
		
		log.info("param.getKeyword()"+param.getKeyword());
		log.info("param.getSearchFilter()"+param.getSearchFilter());
		
		log.info("param.getStartDate()"+param.getStartDate());
		log.info("param.getEndDate()"+param.getEndDate());
		
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();
		
		if(startDate == null && endDate ==null) {
			startDate ="";
			endDate="";
		}else {
			startDate = startDate.replace("/", "-");
			endDate = endDate.replace("/","-");
			log.info("startDate>>>"+startDate);
			log.info("endDate>>>"+endDate);
					
		}
		
		String papeSize = "10";
		String curPage = "1";
		String groupSize = "5";
		String totalCount = "0"; 
		
		if(request.getParameter("curPage")!=null) {
			curPage = request.getParameter("curPage");
		}
		
		param.setPagesize(papeSize);
		param.setCurpage(curPage);
		param.setGroupsize(groupSize);
		param.setTotalcount(totalCount);
		
		List<FreeVO> list = freeService.listFreeBoard(param);
		int listSize = list.size();
		log.info("list사이즈>>>"+listSize);
		
		for(int i=0; i<listSize; i++) {
			FreeVO fvo =(FreeVO)list.get(i);
			
			log.info("글번호"+fvo.getFbno());
			log.info("제목"+fvo.getFbsubject());
			log.info("작성자"+fvo.getFbname());
			log.info("첨부파일"+fvo.getFbimg());
			log.info("내용"+fvo.getFbcontent());
			log.info("회원번호"+fvo.getMember_mno());
			log.info("삭제여부"+fvo.getFbdeleteyn());
			log.info("작성일"+fvo.getFbinsertdate());
			log.info("수정일"+fvo.getFbupdatedate());
			log.info("pagesize>>"+fvo.getPagesize());
			log.info("curpage>>"+fvo.getCurpage());
			log.info("groupsize>>"+fvo.getGroupsize());
			log.info("totalcount>>"+fvo.getTotalcount());
		}
		
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
		mav.setViewName("community/freeboard/insertFreeBoard");
		log.info("selectfreeboardI함수 끝>>>");
		return mav;
	}
	//자유게시판 상세정보조회(수정,삭제일경우->상세정보조회)
	@RequestMapping("selectfreeboardDetail")
	public ModelAndView selectfreeboarddDetail(@ModelAttribute FreeVO param, HttpSession session) {
		log.info("selectfreeboarddDetail함수 시작>>>");
		
		MemberVO mvo = null;
		mvo=(MemberVO) session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		log.info("fbno>>>"+param.getFbno());
		log.info("회원번호>>>"+mvo.getMno());
		
		if(param.getFbno().length()>0 && param.getFbno()!=null) {
			FreeVO freevo = freeService.selectFreeBoard(param);
			log.info("frevo.getMember_mno>>>"+freevo.getMember_mno());
			log.info("첨부파일>>"+freevo.getFbimg());
			mav.addObject("freevo", freevo);
			mav.addObject("membervo", mvo);
		}
		mav.setViewName("community/freeboard/freeDetail");
		log.info("selectfreeboarddDetail함수 끝>>>");
		return mav;
	}
	
	//자유게시판 상세정보조회(수정,삭제일경우->수정,삭제 게시판으로 이동)
	@RequestMapping("selectfreeboardUD")
	public ModelAndView selectFreeBoardUD(@ModelAttribute FreeVO param, HttpSession session) {
		log.info("selectfreeboardUD함수 시작>>>");
		
		MemberVO mvo = null;
		mvo=(MemberVO) session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		log.info("fbno>>>"+param.getFbno());
		log.info("member_mno"+ mvo.getMno());
		log.info("freevo.membermno>>>"+param.getMember_mno());
		
		String mno = mvo.getMno();
		String fmno = param.getMember_mno();
		
		log.info("mno>>>"+mno);
		log.info("fmno>>>"+fmno);
		
		if(mno.equals(fmno)) {
			if(param.getFbno().length()>0 && param.getFbno()!=null) {
				FreeVO freevo = freeService.selectFreeBoard(param);
				mav.addObject("freevo", freevo);
				mav.setViewName("community/freeboard/updateFreeBoard");
			}
		}else {
			if(param.getFbno().length()>0 && param.getFbno()!=null) {
				log.info("회원님이 쓰신 글이 아닙니다.");
				FreeVO freevo = freeService.selectFreeBoard(param);
				log.info("frevo.getMember_mno>>>"+freevo.getMember_mno());
				mav.addObject("freevo", freevo);
				mav.addObject("membervo", mvo);
				mav.setViewName("community/freeboard/freeDetail");
				
			}
			
		}
		
//		if(param.getFbno().length()>0 && param.getFbno()!=null) {
//			
//			FreeVO freevo = freeService.selectFreeBoard(param);
//			
//			mav.addObject("freevo", freevo);
//		}
//		mav.setViewName("community/freeboard/updateFreeBoard");
		log.info("selectfreeboardUD함수 끝>>>");
		return mav;
	}
	//자유게시판 등록
	@RequestMapping("insertfreeboard")
	public ModelAndView insertFreeBoard(@ModelAttribute FreeVO param, HttpSession session,HttpServletRequest request) {
		log.info("insertFreeBoard 함수 진입");
		
		String fbno = null;
		String fbsubject = null;
		String fbname = null;
		String fbcontent =null;
		String fbimg = null;
		String resultStr = "";
		
		//String mid = null;
		//String mno = null;
		String member_mno = null;
		
		
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data 파일 업로드");
			
			// file삽입경로 (변경필수)
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/freeImg";
			uploadPath = fManager.changePath(uploadPath);
			log.info("upload Path Test >>> " + uploadPath);
			
			int size=10*1024*1024;
			//String uploadPath =request.getServletContext().getRealPath("")+"//assets//img//freeImg";
			//String uploadPath = "C://Users//ekfri//git//EduCatch//EduCatch//WebContent//assets//img//freeImg";
			
			ModelAndView mav = new ModelAndView();
			try {
				MultipartRequest mr = new MultipartRequest(request,
															uploadPath,
															size,
															"UTF-8",
															new DefaultFileRenamePolicy());
				fbno = mr.getParameter("fbno");
				fbsubject = mr.getParameter("fbsubject");
				fbname =mr.getParameter("mname");
				fbcontent = mr.getParameter("fbcontent");
				resultStr="";
				
				//mid = mr.getParameter("mid");
				//mno = mr.getParameter("mno");
				member_mno = mr.getParameter("mno");
				
				log.info("fbno>>>"+fbno);
				log.info("fbsubject>>>"+fbsubject);
				log.info("fbname>>>"+fbname);
				log.info("fbcontent>>>"+fbcontent);
				//log.info("mid>>>"+mid);
				//log.info("mno>>>"+mno);
				log.info("member_mno>>>"+member_mno);
				
				Enumeration<String> en = mr.getFileNames();
				List<String> list = new ArrayList<String>();
				
				while(en.hasMoreElements()) {
					String file1 = en.nextElement();
					String filename = mr.getFilesystemName(file1);
					log.info("fileName>>>"+filename);
					list.add(mr.getFilesystemName(file1));
				}
				fbimg = String.valueOf(list.get(0));
				
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			log.info("파일이 없는 경우");
			fbno = request.getParameter("fbno");
			fbsubject = request.getParameter("fbsubject");
			fbname = request.getParameter("mname");
			fbcontent = request.getParameter("fbcontent");
			member_mno = request.getParameter("mno");
			fbimg = request.getParameter("fbimg");
		}
		
		param.setFbno(fbno);
		param.setFbsubject(fbsubject);
		param.setFbname(fbname);
		param.setFbcontent(fbcontent);
		param.setMember_mno(member_mno);
		param.setFbimg(fbimg);
		
		log.info("글번호"+param.getFbno());
		log.info("글제목"+param.getFbsubject());
		log.info("작성자"+param.getFbname());
		log.info("글내용"+param.getFbcontent());
		log.info("회원번호"+param.getMember_mno());
		log.info("이미지파일"+param.getFbimg());
		log.info("삭제여부"+param.getFbdeleteyn());
		log.info("입력일"+param.getFbinsertdate());
		log.info("수정일"+param.getFbupdatedate());
		
		int result=freeService.insertFreeBoard(param);
		log.info("result>>>"+result);
		
		if(result>0) resultStr="등록완료가 되었습니다";
		else resultStr="등록에 문제가 있어서 완료하지 못했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("community/freeboard/insertFreeBoardForm");
		log.info("mav>>>"+mav);
		return mav;
		
	}

	//자유게시판 수정
	@RequestMapping("updatefreeboard")
	public ModelAndView updateFreeBoard(@ModelAttribute FreeVO param,HttpServletRequest request) {
		log.info("updateFreeBoard함수 진입");
		
		String fbno = null;
		String fbsubject = null;
		String fbname = null;
		String fbcontent=null;
		String fbimg = null;
		//String member_mno= null;
		String resultStr = "";
		
		
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("파일 업로드");
			
			// file삽입경로 (변경필수)
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/freeImg";
			uploadPath = fManager.changePath(uploadPath);
			log.info("upload Path Test >>> " + uploadPath);
			
			int size=10*1024*1024;
			//String uploadPath = request.getServletContext().getRealPath("")+"//assets//img//freeImg";
			//String uploadPath = "C://Users//ekfri//git//EduCatch//EduCatch//WebContent//assets//img//freeImg";
			
			ModelAndView mav = new ModelAndView();
			try {
				MultipartRequest mr = new MultipartRequest(request,
															uploadPath,
															size,
															"UTF-8",
															new DefaultFileRenamePolicy());
				
				fbno = mr.getParameter("fbno");
				fbsubject = mr.getParameter("fbsubject");
				fbname =mr.getParameter("fbname");
				fbcontent = mr.getParameter("fbcontent");
				//member_mno = mr.getParameter("mno");
				resultStr="";
				
				
				log.info("fbno>>>"+fbno);
				log.info("fbsubject>>>"+fbsubject);
				log.info("fbname>>>"+fbname);
				log.info("fbcontent>>>"+fbcontent);
				//log.info("mno>>>"+member_mno);
				
				
				Enumeration<String> en = mr.getFileNames();
				List<String> list = new ArrayList<String>();
				
				while(en.hasMoreElements()) {
					String file1 = en.nextElement();
					String filename = mr.getFilesystemName(file1);
					log.info("fileName>>>"+filename);
					list.add(mr.getFilesystemName(file1));
				}
				fbimg = String.valueOf(list.get(0));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			log.info("파일이 변하지 않은 경우");
			fbno = request.getParameter("fbno");
			fbsubject = request.getParameter("fbsubject");
			fbname = request.getParameter("fbname");
			fbcontent = request.getParameter("fbcontent");
			fbimg = request.getParameter("fbimg");
			//member_mno = request.getParameter("mno");
		}
		param.setFbno(fbno);
		param.setFbsubject(fbsubject);
		param.setFbname(fbname);
		param.setFbcontent(fbcontent);
		param.setFbimg(fbimg);
		//param.setMember_mno(member_mno);
		
		log.info("글번호"+param.getFbno());
		log.info("제목"+param.getFbsubject());
		log.info("작성자"+param.getFbname());
		log.info("내용"+param.getFbcontent());
		log.info("회원번호"+param.getMember_mno());
		log.info("첨부파일"+param.getFbimg());
		log.info("삭제여부"+param.getFbdeleteyn());
		log.info("입력일"+param.getFbinsertdate());
		log.info("수정일"+param.getFbupdatedate());
		
		int result = freeService.updateFreeBoard(param);
		log.info("result"+result);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			resultStr="update";
			log.info("수정완료");
			mav.addObject("freevo", param);
		}
		else {
			resultStr="update";
			log.info("수정 실패 or 본인이 쓴 글이 아닙니다.");
		}
		
		mav.addObject("result", resultStr);
		mav.setViewName("community/freeboard/result");
		
		log.info("updateFreeBoard함수 끝");
		return mav;
	}
	
	//자유게시판 삭제
	@RequestMapping("deletefreeboard")
	public ModelAndView deleteFreeBoard(@ModelAttribute FreeVO param, HttpSession session) {
		log.info("deleteFreeBoard함수 시작");
		log.info("글번호"+param.getFbno());
		log.info("회원번호"+param.getMember_mno());
		
		String deleteStr = "";
		String isSuccess="";

		ModelAndView mav = new ModelAndView();
		
		MemberVO mvo = null;
		mvo=(MemberVO) session.getAttribute("user");

		
		String mno = mvo.getMno();
		log.info("현재 로그인한 회원번호"+mno);
		String fbmno = param.getMember_mno();
		log.info("글쓴 사람 회원번호"+fbmno);
		
		if(mno.equals(fbmno)) {
			int result = freeService.deleteFreeBoard(param);
			if(result>0) {
				deleteStr = "delete";
				isSuccess="true";
				log.info("삭제완료");
			}else {
				deleteStr = "delete";
				isSuccess="false";
				log.info("삭제실패");
			}
			mav.addObject("result", deleteStr);
			mav.addObject("isSuccess", isSuccess);
			mav.setViewName("community/freeboard/result");
			
		}else {
			log.info("회원님이 쓰신 글이 아닙니다.");
			FreeVO freevo = freeService.selectFreeBoard(param);
			log.info("frevo.getMember_mno>>>"+freevo.getMember_mno());
			mav.addObject("freevo", freevo);
			mav.addObject("membervo", mvo);
			mav.setViewName("community/freeboard/freeDetail");
		}

		log.info("deleteFreeBoard함수 끝");
		return mav;
	}
}
