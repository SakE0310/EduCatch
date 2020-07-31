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
	
	//===============공지사항 등록페이지 이동================================
	@RequestMapping("insertDisplay")
	public ModelAndView insertDisplay() {
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
		
		log.info("param.getNno()>>>"+param.getNno());
		log.info("param.getNsubject()>>>"+param.getNsubject());
		log.info("param.getNname()>>>"+param.getNname());
		log.info("param.getNimg()>>>"+param.getNimg());
		log.info("param.getNcontent()>>>"+param.getNcontent());
		log.info("param.getNdeleteyn()>>>"+param.getNdeleteyn());
		log.info("param.getNinsertdate()>>>"+param.getNinsertdate());
		log.info("param.getNupdatedate()>>>"+param.getNupdatedate());
		
		int size = 10*1024*1024;
		String path = "C://Users//kosmo_02//git//EduCatch//EduCatch//WebContent//assets//img//notice";
		
		String resultStr="";
		
		try {
			MultipartRequest multi = new MultipartRequest(request 
														 ,path
														 ,size
														 ,"UTF-8"
														 ,new DefaultFileRenamePolicy());
			
			Enumeration<String> et = multi.getFileNames();
			List<String> list = new ArrayList<String>();
			
			
			while(et.hasMoreElements()){
				String file = et.nextElement();
				list.add(multi.getFilesystemName(file));
			}//end of while
			
			
		} catch (Exception e) {
			log.info("에러>>>>"+e.getMessage());
		}
		int nCnt = noticeService.insertNotice(param);
		log.info("nCnt>>>"+nCnt);
		
		if(nCnt > 0) {
			resultStr="등록 완료";
		}else {
			resultStr="등록 실패";
		}//end of if-else
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reslut", resultStr);
		mav.setViewName("notice/noticeBoard/noticeinsertForm");
		
		log.info("NoticeController insertNotice 끝 >>>");
		return mav;
	}//end of insertNotice
			
}
