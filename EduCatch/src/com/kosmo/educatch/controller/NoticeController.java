package com.kosmo.educatch.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.NoticeService;
import com.kosmo.educatch.vo.NoticeVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//공지사항 게시판
@Controller
public class NoticeController {
	private static Logger log = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	//============ 공지사항 게시판 목록 조회===================================
	@RequestMapping("/listNotice.ec")
	public ModelAndView listNotice(@ModelAttribute NoticeVO param) {
		log.info("NoticeController listNotice 시작 >>>");

		List<NoticeVO> list = noticeService.listNotice(param);
		log.info("NoticeController listNotice list.size()>>>"+ list.size());

		for(int i=0; i<list.size(); i++) {
			//list를 VO로 형변환해준다.
			NoticeVO nvo=(NoticeVO)list.get(i);
			log.info("nvo.getNno()>>>"+nvo.getNno());
			log.info("nvo.getNsubject()>>>"+nvo.getNsubject());
			log.info("nvo.getNname()>>>"+nvo.getNname());
			log.info("nvo.getNimg()>>>"+nvo.getNimg());
			log.info("nvo.getNcontent()>>>"+nvo.getNcontent());
			log.info("nvo.getNdeleteyn()>>>"+nvo.getNdeleteyn());
			log.info("nvo.getNinsertdate()>>>"+nvo.getNinsertdate());
			log.info("nvo.getNupdatedate()>>>"+nvo.getNupdatedate());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList",list);
		mav.setViewName("notice/noticeBoard/notice");
		
		log.info("NoticeController listNotice 끝 >>>");
		return mav;
	}//end of listNotice
	
	
	//===============공지사항 관리자모드 : 조회================================
	@RequestMapping("selectNotice.ec")
	public ModelAndView selectNotice(@ModelAttribute NoticeVO param) {
		 String nno= (String)param.getNno(); 
		 log.info("nno>>>"+nno);
		 
		NoticeVO nvo= noticeService.selectNotice(nno);
		log.info("nvo.getNno()>>>"+nvo.getNno());
		log.info("nvo.getNsubject()>>>"+nvo.getNsubject());
		log.info("nvo.getNname()>>>"+nvo.getNname());
		log.info("nvo.getNimg()>>>"+nvo.getNimg());
		log.info("nvo.getNcontent()>>>"+nvo.getNcontent());
		log.info("nvo.getNdeleteyn()>>>"+nvo.getNdeleteyn());
		log.info("nvo.getNinsertdate()>>>"+nvo.getNinsertdate());
		log.info("nvo.getNupdatedate()>>>"+nvo.getNupdatedate());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("NoticeVO", nvo);
		mav.setViewName("notice/noticeBoard/noticeSelect");
		
		log.info("NoticeController selectNotice 끝 >>>");
		return mav;
	}
	
	//===============공지사항 등록페이지 이동================================
	@RequestMapping("insertDisplayNotice.ec")
	public ModelAndView insertDisplayNotice() {
		log.info("NoticeController insertDisplay 시작 >>>");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticeBoard/noticeInsert");
		
		log.info("NoticeController insertDisplay 끝 >>>");
		return mav;
	}//end of insertDisplay
	
	
	//===============공지사항 관리자모드 : 등록================================
	@RequestMapping("/insertNotice.ec")
	public ModelAndView insertNotice(HttpServletRequest request
									,@ModelAttribute NoticeVO param) {
		log.info("NoticeController insertNotice 시작 >>>");
		log.info("contenttype >>> " + request.getContentType());
		
		String nsubject=null;
		String nimg=null;
		String ncontent=null;
		
		ModelAndView mav = new ModelAndView();
		String resultStr="";
		
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");
			
			int size = 10*1024*1024;
			String path = "C://Users//kosmo_02//git//EduCatch//EduCatch//WebContent//assets//img//notice";
			
			
			try {
				MultipartRequest multi = new MultipartRequest(request 
															 ,path
															 ,size
															 ,"UTF-8"
															 ,new DefaultFileRenamePolicy());
				
				nsubject=multi.getParameter("nsubject");
				nimg=multi.getParameter("nimg");
				ncontent=multi.getParameter("ncontent");
				log.info("multi >>> " + multi);
				
				log.info("nsubject>>>"+nsubject);
				log.info("nimg>>>"+nimg);
				log.info("ncontent>>>"+ncontent);
				
				Enumeration<String> et = multi.getFileNames();
				List<String> list = new ArrayList<String>();
				
				
				while(et.hasMoreElements()){
					String file = et.nextElement();
					list.add(multi.getFilesystemName(file));
					log.info("fileName >>> " + file);
				}//end of while
				
				param.setNsubject(nsubject);
				param.setNimg(list.get(0));
				param.setNcontent(ncontent);
				
			} catch (Exception e) {
				log.info("에러>>>>"+e.getMessage());
			}//end of try-catch
			
			// 멀티파트 폼데이터가 아닐경우 파일 전송없이 매핑
		}else {
			log.info("multipart/form-data false");
			
			nsubject = request.getParameter("nsubject");
			ncontent = request.getParameter("ncontent");
			
			param.setNsubject(nsubject);
			param.setNcontent(ncontent);
			
		}
		
		int nCnt = noticeService.insertNotice(param);
		log.info("nCnt>>>"+nCnt);
		
		if(nCnt > 0) {
			resultStr="등록 완료";
		}else {
			resultStr="등록 실패";
		}//end of if-else
		
		mav.addObject("result", resultStr);
		mav.setViewName("notice/noticeBoard/noticeinsertForm");
		
		log.info("NoticeController insertNotice 끝 >>>");
		return mav;
	}//end of insertNotice
	
	//===============공지사항 수정페이지 이동================================
		@RequestMapping("updateDisplayNotice.ec")
		public ModelAndView updateDisplayNotice(@ModelAttribute NoticeVO param) {
			log.info("NoticeController updateDisplayNotice 시작 >>>");
			log.info("param.getNno()>>>"+param.getNno());
			
			String nno= (String)param.getNno(); 
			NoticeVO nvo= noticeService.selectNotice(nno);
			
			log.info("nvo.getNno()>>>"+nvo.getNno());
			log.info("nvo.getNsubject()>>>"+nvo.getNsubject());
			log.info("nvo.getNname()>>>"+nvo.getNname());
			log.info("nvo.getNimg()>>>"+nvo.getNimg());
			log.info("nvo.getNcontent()>>>"+nvo.getNcontent());
			log.info("nvo.getNdeleteyn()>>>"+nvo.getNdeleteyn());
			log.info("nvo.getNinsertdate()>>>"+nvo.getNinsertdate());
			log.info("nvo.getNupdatedate()>>>"+nvo.getNupdatedate());
			ModelAndView mav = new ModelAndView();
			mav.addObject("NoticeVO", nvo);
			
			mav.setViewName("notice/noticeBoard/noticeUpdate");
			
			log.info("NoticeController updateDisplayNotice 끝 >>>");
			return mav;
		}//end of insertDisplay
	
	
	//===============공지사항 관리자모드 : 수정================================
	@RequestMapping("updateNotice.ec")
	public ModelAndView updateNotice(@ModelAttribute NoticeVO param) {
		log.info("NoticeController updateNotice 시작 >>>");
		String resultStr="";
		String isSuccess="";
		
		int nCnt = noticeService.updateNotice(param);
		log.info("nCnt>>>"+nCnt);
		ModelAndView mav = new ModelAndView();
		
		if(nCnt > 0) {
			resultStr = "update";
			isSuccess="true";
			log.info("수정완료");
			mav.addObject("NoticeVO", param);
		
		}else {
			resultStr = "update";
			log.info("수정실패");
		}//end of if-else
		
		mav.addObject("result", resultStr);
		mav.addObject("isSuccess", isSuccess);
		
		//수정완료되면 수정된 상세보기조회페이지로 이동
		mav.setViewName("notice/noticeBoard/noticeForm");
		log.info("NoticeController updateNotice 끝 >>>");
		return mav;
	}//end of updateNotice
	
	//===============공지사항 관리자모드 : 삭제================================
	@RequestMapping("deleteNotice.ec")
	public ModelAndView deleteNotice(@ModelAttribute NoticeVO param) {
		log.info("NoticeController deleteNotice 시작 >>>");
		String resultStr="";
		String isSuccess="";
		
		int nCnt = noticeService.deleteNotice(param);
		log.info("nCnt>>>"+nCnt);
		ModelAndView mav = new ModelAndView();
		
		if(nCnt > 0) {
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
		
		mav.setViewName("notice/noticeBoard/noticeForm");
		log.info("NoticeController deleteNotice 끝 >>>");
		return mav;
	}
}
