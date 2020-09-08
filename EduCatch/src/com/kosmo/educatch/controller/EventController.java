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

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.EventService;

import com.kosmo.educatch.vo.EventVO;
import com.kosmo.educatch.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//이벤트 게시판
@Controller
public class EventController {
	private Logger log = LoggerManager.getInstance().getLogger(EventController.class);

	@Autowired
	private EventService eventService;
	
	
	//============ 이벤트 게시판 검색 조회===================================
	@RequestMapping("searchEvent.ec")
	public ModelAndView searchEvent(HttpServletRequest request, @ModelAttribute EventVO param) {
		log.info("EventController searchEvent 시작 >>>");
		
		log.info("param.getKeyword()>>" + param.getKeyword());
		log.info("param.getSearchFilter()>>>" + param.getSearchFilter());
		log.info("param.getStartDate()>>>" + param.getStartDate());
		log.info("param.getEndDate()>>>" + param.getEndDate());

		//DatePicker 변수
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();
		
		//페이징 변수
		String pno="P004";
		String pagesize="10";
		String groupsize="5";
		String curpage="1";
		String totalcount="0";
		
		//시작일 종료일 날짜형식 변환
		if(startDate == null && endDate == null) {
			startDate = "";
			endDate ="";
		}
		
		if(request.getParameter("curpage") !=null) {
			curpage=request.getParameter("curpage");
		}

		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);
		
		log.info("param.getPno()>>>"+param.getPagesize());
		log.info("getGroupsize>>>"+param.getGroupsize());
		log.info("param.getCurpage()>>>"+param.getCurpage());
		log.info("param.getTotalcount()>>>"+param.getTotalcount());
		
		List<EventVO> list = eventService.searchEvent(param);
		
		for(int i=0; i<list.size(); i++) {
			EventVO evo = (EventVO)list.get(i);
			
			log.info("evo.getEno()>>>"+evo.getEno());
			log.info("evo.getEsubject()>>>"+evo.getEsubject());
			log.info("evo.getEname()>>>"+evo.getEname());
			log.info("evo.getEimg()>>>"+evo.getEimg());
			log.info("evo.getEcontent()>>>"+evo.getEcontent());
			log.info("evo.getEdeleteyn()>>>"+evo.getEdeleteyn());
			log.info("evo.getEinsertdate()>>>"+evo.getEinsertdate());
			log.info("evo.getEupdatedate()>>>"+evo.getEupdatedate());
			
			log.info("pagesize >>> "+evo.getPagesize());
			log.info("groupsize >>> "+evo.getGroupsize());
			log.info("curpage >>> "+evo.getCurpage());
			log.info("totalcount >>> "+evo.getTotalcount());
		}//end of for

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList",list);
		mav.setViewName("notice/eventBoard/eventSearch");
		
		log.info("EventController searchEvent 끝 >>>");
		return mav;
	}
	//============ 이벤트 게시판 목록 조회===================================
	@RequestMapping("listEvent.ec")
	public ModelAndView listEvent(HttpServletRequest request, @ModelAttribute EventVO param) {
		log.info("EventController listEvent 시작 >>>");
		
		//페이징 변수
		String pno="P005";
		String pagesize="10";
		String groupsize="5";
		String curpage="1";
		String totalcount="0";
		
		if(request.getParameter("curpage") !=null) {
			curpage=request.getParameter("curpage");
		}
		
		param.setPno(pno);
		param.setPagesize(pagesize);
		param.setGroupsize(groupsize);
		param.setCurpage(curpage);
		param.setTotalcount(totalcount);
		
		log.info("param.getPagesize()>>>"+param.getPagesize());
		log.info("param.getGroupsize>>>"+param.getGroupsize());
		log.info("param.getCurpage()>>>"+param.getCurpage());
		log.info("param.getTotalcount()>>>"+param.getTotalcount());
		
		List<EventVO> list = eventService.listEvent(param);
		
		log.info("param.getPno()>>>"+param.getPagesize());
		log.info("pagesize_param >>> "+param.getPagesize());
		log.info("groupsize_param >>> "+param.getGroupsize());
		log.info("curpage_param >>> "+param.getCurpage());
		log.info("totalcount_param >>> "+param.getTotalcount());
		
		for(int i=0; i<list.size(); i++) {
			EventVO evo = (EventVO)list.get(i);
			
			log.info("evo.getEno()>>>"+evo.getEno());
			log.info("evo.getEsubject()>>>"+evo.getEsubject());
			log.info("evo.getEname()>>>"+evo.getEname());
			log.info("evo.getEimg()>>>"+evo.getEimg());
			log.info("evo.getEcontent()>>>"+evo.getEcontent());
			log.info("evo.getEdeleteyn()>>>"+evo.getEdeleteyn());
			log.info("evo.getEinsertdate()>>>"+evo.getEinsertdate());
			log.info("evo.getEupdatedate()>>>"+evo.getEupdatedate());
			
			log.info("pagesize >>> "+evo.getPagesize());
			log.info("groupsize >>> "+evo.getGroupsize());
			log.info("curpage >>> "+evo.getCurpage());
			log.info("totalcount >>> "+evo.getTotalcount());
		}//end of for
		
		if(list.size() == 0) {
			log.info("0");
			/*
			 * EventVO evo = (EventVO)list.get(0);
			 * log.info("pagesize >>> "+evo.getPagesize());
			 * log.info("groupsize >>> "+evo.getGroupsize());
			 * log.info("curpage >>> "+evo.getCurpage());
			 * log.info("totalcount >>> "+evo.getTotalcount());
			 */
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList",list);
		mav.setViewName("notice/eventBoard/event");
		
		log.info("EventController listEvent 끝 >>>");
		return mav;
	}//end of listEvent
	
	//============ 이벤트 게시판 상세 조회===================================
	@RequestMapping("selectEvent.ec")
	public ModelAndView selectEvent(@ModelAttribute EventVO param) {
		log.info("EventController selectEvent 시작 >>>");
		log.info("param.getEno()>>>"+param.getEno());
		
		EventVO evo = eventService.selectEvent(param);
		log.info("evo.getEno()>>>"+evo.getEno());
		log.info("evo.getEsubject()>>>"+evo.getEsubject());
		log.info("evo.getEname()>>>"+evo.getEname());
		log.info("evo.getEimg()>>>"+evo.getEimg());
		log.info("evo.getEcontent()>>>"+evo.getEcontent());
		log.info("evo.getEdeleteyn()>>>"+evo.getEdeleteyn());
		log.info("evo.getEinsertdate()>>>"+evo.getEinsertdate());
		log.info("evo.getEupdatedate()>>>"+evo.getEupdatedate());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("EventVO", evo);
		mav.setViewName("notice/eventBoard/eventSelect");
		
		log.info("EventController selectEvent 끝 >>>");
		return mav;
	}//end of selectEvent
	
	//============ 이벤트 게시판 등록페이지 이동===================================
	@RequestMapping("insertDisplayEvent.ec")
	public ModelAndView insertDisplayEvent() {
		log.info("EventController insertDisplayEvent 시작 >>>");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/eventBoard/eventInsert");
		
		log.info("EventController insertDisplayEvent 끝 >>>");
		return mav;
	}//end of insertDisplayEvent
	
	//===============이벤트 관리자모드 : 등록================================
	@RequestMapping("insertEvent.ec")
	public ModelAndView insertEvent(HttpServletRequest request
									,@ModelAttribute EventVO param
									, HttpSession session) {
		log.info("EventController insertEvent 시작 >>>");
		
		String esubject=null;
		String eimg=null;
		String econtent=null;
		String ename = null;
		
		//세션을 통해 로그인 된 이름을 가져옴
		MemberVO mvo = null;
		String member_mame ="";
		if(session != null){
			mvo = (MemberVO)session.getAttribute("user");
			member_mame =mvo.getMname();
		}	
		
		ModelAndView mav = new ModelAndView();
		String resultStr="";
		
		//사진을 포함해서 보낼 때
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");
			int size = 10*1024*1024;
			//String path = "C://Users//user//git//EduCatch//EduCatch//WebContent//assets//img//event";
			String path = request.getServletContext().getRealPath("")+"//assets//img//event";
			
			try {
				MultipartRequest multi = new MultipartRequest(request 
															 ,path
															 ,size
															 ,"UTF-8"
															 ,new DefaultFileRenamePolicy());
				
				esubject=multi.getParameter("esubject");
				eimg=multi.getParameter("eimg");
				econtent=multi.getParameter("econtent");
				log.info("multi >>> " + multi);
				
				log.info("esubject>>>"+esubject);
				log.info("eimg>>>"+eimg);
				log.info("econtent>>>"+econtent);
				
				Enumeration<String> et = multi.getFileNames();
				List<String> list = new ArrayList<String>();
				
				
				while(et.hasMoreElements()){
					String file = et.nextElement();
					list.add(multi.getFilesystemName(file));
					log.info("fileName >>> " + file);
				}//end of while
				
				param.setEsubject(esubject);
				param.setEimg(list.get(0));
				param.setEcontent(econtent);
				param.setEname(member_mame);
				
			} catch (Exception e) {
				log.info("에러>>>>"+e.getMessage());
			}//end of try-catch
			
		//사진 없이 보낼 때 
		}else {
			log.info("multipart/form-data false");
						
			esubject = request.getParameter("esubject");
			econtent = request.getParameter("econtent");
			
			param.setEsubject(esubject);
			param.setEcontent(econtent);
			param.setEname(member_mame);
		}//end of if-else
		
		int nCnt = eventService.insertEvent(param);
		log.info("nCnt>>>"+nCnt);
		
		if(nCnt > 0) {
			resultStr="등록 완료";
			
		}else {
			resultStr="등록 실패";
		}//end of if-else
		
		log.info("resultStr>>>"+resultStr);
		mav.addObject("result", resultStr);
		//글 등록한 상세페이지로 이동하기 위한 Form
		mav.setViewName("notice/eventBoard/eventInsertForm");
		
		log.info("EventController insertEvent 끝 >>>");
		return mav;
	}//end of insertEvent
	
	//===============이벤트 수정페이지 이동================================
	@RequestMapping("updateDisplayEvent.ec")
	public ModelAndView updateDisplayEvent(@ModelAttribute EventVO param) {
		log.info("EventController updateDisplayEvent 시작 >>>");
		log.info("param.getNno()>>>"+param.getEno());
		
		EventVO evo= eventService.selectEvent(param);
		
		log.info("evo.getEno()>>>"+evo.getEno());
		log.info("evo.getEsubject()>>>"+evo.getEsubject());
		log.info("evo.getEname()>>>"+evo.getEname());
		log.info("evo.getEimg()>>>"+evo.getEimg());
		log.info("evo.getEcontent()>>>"+evo.getEcontent());
		log.info("evo.getEdeleteyn()>>>"+evo.getEdeleteyn());
		log.info("evo.getEinsertdate()>>>"+evo.getEinsertdate());
		log.info("evo.getEupdatedate()>>>"+evo.getEupdatedate());
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("EventVO", evo);
		mav.setViewName("notice/eventBoard/eventUpdate");
		
		log.info("EventController updateDisplayEvent 끝 >>>");
		return mav;
	}//end of updateDisplayEvent
	
	//===============이벤트 관리자모드 : 수정================================
	@RequestMapping("updateEvent.ec")
	public ModelAndView updateEvent(HttpServletRequest request
									,@ModelAttribute EventVO param) {
		log.info("EventController updateEvent 시작 >>>");
		String resultStr = "";
		String isSuccess = "";
		
		String esubject = null;
		String econtent = null;
		String eno = null;
		String eimg = null;
		
		//enctype가 multipart/form-data 일때 실행
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");
			
			int size = 10*1024*1024;
			String path = request.getServletContext().getRealPath("")+"//assets//img//event";
			
			try {
				MultipartRequest multi = new MultipartRequest(request 
															 ,path
															 ,size
															 ,"UTF-8"
															 ,new DefaultFileRenamePolicy());

				eno =  multi.getParameter("eno");
				esubject = multi.getParameter("esubject");
				eimg = multi.getParameter("eimg2");
				econtent = multi.getParameter("econtent");
				
				log.info("eno>>>"+eno);
				log.info("esubject>>>"+esubject);
				log.info("eimg2>>>"+eimg);
				log.info("econtent>>>"+econtent);
				
				Enumeration<String> et = multi.getFileNames();
				List<String> list = new ArrayList<String>();
				
				while(et.hasMoreElements()){
					String file = et.nextElement();
					list.add(multi.getFilesystemName(file));
					log.info("fileName >>> " + file);
				}//end of while
				
				param.setEno(eno);;
				param.setEsubject(esubject);
				param.setEimg(list.get(0));
				param.setEcontent(econtent);
				
			} catch (Exception e) {
				log.info("에러>>>>"+e.getMessage());
			}//end of try-catch
			
			//enctype가 multipart/form-data가 아닐떄 실행
			//파일을 포함하지 않고 수정할때 실행
		}else {
			log.info("multipart/form-data false");
			
			eimg = request.getParameter("eimg1");
			esubject = request.getParameter("esubject");
			econtent = request.getParameter("econtent");
			
			param.setEimg(eimg);
			param.setEsubject(esubject);
			param.setEcontent(econtent);
		}//end of if-else
		
		int nCnt = eventService.updateEvent(param);
		log.info("nCnt>>>"+nCnt);
		ModelAndView mav = new ModelAndView();
		
		if(nCnt > 0){
			resultStr = "update";
			isSuccess="true";
			log.info("수정완료");
			mav.addObject("EventVO", param);
		}else {
			resultStr = "update";
			isSuccess="false";
			log.info("수정실패");
		}//end of if-else

		mav.addObject("result", resultStr);
		mav.addObject("isSuccess", isSuccess);
		//수정완료되면 수정된 상세보기조회페이지로 이동
		mav.setViewName("notice/eventBoard/eventForm");
		
		log.info("EventController updateEvent 끝 >>>");
		return mav;
	}//end of updateEvent
	
	//===============이벤트 관리자모드 : 삭제================================
	@RequestMapping("deleteEvent.ec")
	public ModelAndView deleteEvent(@ModelAttribute EventVO param) {
		log.info("EventController deleteEvent 시작 >>>");
		String resultStr="";
		String isSuccess="";
		
		int nCnt = eventService.deleteEvent(param);
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
		mav.setViewName("notice/eventBoard/eventForm");
		
		log.info("EventController deleteEvent 끝 >>>");
		return mav;
	}//end of deleteEvent
	
}










