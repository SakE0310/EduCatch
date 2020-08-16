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

import com.kosmo.educatch.service.AcademyAddService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.ConvenienceVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AcademyAddController {
	private static Logger log = Logger.getLogger(AcademyAddController.class);

	@Autowired
	private AcademyAddService academyAddService;

	// ---------------관리자 페이지에서 학원등록을 눌렀을때 
	@RequestMapping("academyPage")
	public ModelAndView pageAcademy() {
		log.info("AcademyAddController pageAcademy >>> 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/addAcademy");
		log.info("AcademyAddController pageAcademy >>> 끝");
		return mav;
	}

	// ----------------학원등록 페이지에서 학원등록 버튼 눌렀을때
	@RequestMapping("insertAcademy")
	public ModelAndView insertAcademy(@ModelAttribute AcademyVO avo, ConvenienceVO cvo,
			HttpServletRequest request) {
		log.info("AcademyAddController insertAcademy >>> 시작");
		
		String ano = null;
		String aname = null;
		String atel = null;
		String axpoint = null;
		String aypoint = null;
		String aaddrno = null;
		String aaddr1 = null;
		String aaddr2 = null;
		String alogo = null;
		String category_cno = null;
		String cno = null;
		String cmajor = null;
		String cminor = null;
		String file = null;
		
		String academy_ano = null;
		String acparking = null;
		String acstore = null;
		String acbus = null;
		String acelevator = null;
		String acstudyroom = null;
		String aclounge = null;
		String aclocker = null;
		
		
		ModelAndView mav = new ModelAndView();
		
		// 멀티파트 폼데이터인지 확인하기 위함
		// 멀티파트 폼데이터면 파일 전송을 실시
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");
			
			// file삽입경로 (변경필수)
			String uploadPath = "C://Users//kosmo_26//git//EduCatch//EduCatch//WebContent//assets//img//academyLogo";
			// file 최대크기
			int size = 10 * 1024 * 1024;
			// multipart로 파일을 업로드 후 각 데이터셋팅
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
				
				ano=multi.getParameter("ano");
				aname=multi.getParameter("aname");
				atel=multi.getParameter("atel");
				axpoint=multi.getParameter("axpoint");
				aypoint=multi.getParameter("aypoint");
				aaddrno=multi.getParameter("aaddrno");
				aaddr1=multi.getParameter("aaddr1");
				aaddr2=multi.getParameter("aaddr2");
				alogo=multi.getParameter("alogo");
				category_cno=multi.getParameter("category_cno");
				cno=multi.getParameter("cno");
				cmajor=multi.getParameter("cmajor");
				cminor=multi.getParameter("cminor");
				
				academy_ano = multi.getParameter("academy_ano");
				acparking = multi.getParameter("acparking");
				acstore = multi.getParameter("acstore");
				acbus = multi.getParameter("acbus");
				acelevator = multi.getParameter("acelevator");
				acstudyroom = multi.getParameter("acstudyroom");
				aclounge = multi.getParameter("aclounge");
				aclocker = multi.getParameter("aclocker");
				
				log.info("cmajor >>> " + cmajor);
				log.info("cminor >>> " + cminor);
				
				
				log.info("multi >>> " + multi);
				
				Enumeration en = multi.getFileNames();
				while(en.hasMoreElements()) {
					String file1 = (String) en.nextElement();
					file = multi.getFilesystemName(file1);
					log.info("fileName >>> " + file);
				}
				
			} catch (Exception e) {
				log.info("에러>>>>"+e.getMessage());
			}//end of try-catch
			
			// 멀티파트 폼데이터가 아닐경우 파일 전송없이 매핑
		}else {
			log.info("multipart/form-data false");
			
			ano = request.getParameter("ano");
			aname = request.getParameter("aname");
			atel = request.getParameter("atel");
			axpoint = request.getParameter("axpoint");
			aypoint = request.getParameter("aypoint");
			aaddrno = request.getParameter("aaddrno");
			aaddr1 = request.getParameter("aaddr1");
			aaddr2 = request.getParameter("aaddr2");
			alogo = request.getParameter("alogo");
			category_cno = request.getParameter("category_cno");
			cno = request.getParameter("cno");
			cmajor = request.getParameter("cmajor");
			cminor = request.getParameter("cminor");
			
			academy_ano = request.getParameter("academy_ano");
			acparking = request.getParameter("acparking");
			acstore = request.getParameter("acstore");
			acbus = request.getParameter("acbus");
			acelevator = request.getParameter("acelevator");
			acstudyroom = request.getParameter("acstudyroom");
			aclounge = request.getParameter("aclounge");
			aclocker = request.getParameter("aclocker");
		}
		
		log.info("ano >>> " + ano);
		log.info("aname >>> " + aname);
		log.info("axpoint >>> " + axpoint);
		log.info("aypoint >>> " + aypoint);
		log.info("aaddrno >>> " + aaddrno);
		log.info("aaddr1 >>> " + aaddr1);
		log.info("aaddr2 >>> " + aaddr2);
		log.info("academy_ano" + academy_ano);
		log.info("category_cno >>> " + category_cno);
		log.info("cmajor >>> " + cmajor);
		log.info("cminor >>> " + cminor);
		log.info("acparking >>> " + acparking);
		log.info("acparking >>> " + acparking);
		log.info("acparking >>> " + acparking);
		log.info("acparking >>> " + acparking);

		avo.setAno(ano);
		avo.setAname(aname);
		avo.setAtel(atel);
		avo.setAxpoint(axpoint);
		avo.setAypoint(aypoint);
		avo.setAaddrno(aaddrno);
		avo.setAaddr1(aaddr1);
		avo.setAaddr2(aaddr2);
		avo.setAlogo(file);
		avo.setCategory_cno(category_cno);
		avo.setCno(cno);
		avo.setCmajor(cmajor);
		avo.setCminor(cminor);
		
		if(acparking !=null) {
			cvo.setAcparking(acparking);
		}else {
			acparking = "N";
			cvo.setAcparking(acparking);
		}
		
		
		if(acstore !=null) {
			cvo.setAcstore(acstore);
		}else {
			acstore = "N";
			cvo.setAcstore(acstore);
		}
		
		
		if(acbus !=null) {
			cvo.setAcbus(acbus);
		}else {
			acbus = "N";
			cvo.setAcbus(acbus);
		}
		
		
		if(acelevator !=null) {
			cvo.setAcelevator(acelevator);
		}else {
			acelevator = "N";
			cvo.setAcelevator(acelevator);
		}
		
		
		if(acstudyroom !=null) {
			cvo.setAcstudyroom(acstudyroom);
		}else {
			acstudyroom = "N";
			cvo.setAcstudyroom(acstudyroom);
		}
		
		
		if(aclounge !=null) {
			cvo.setAclounge(aclounge);
		}else {
			aclounge = "N";
			cvo.setAclounge(aclounge);
		}
		
		
		if(aclocker !=null) {
			cvo.setAclocker(aclocker);
		}else {
			aclocker = "N";
			cvo.setAclocker(aclocker);
		}
		
		
		
		
		AcademyVO vovo = academyAddService.selectCategory(avo);
		
		cno = vovo.getCno();
		avo.setCategory_cno(cno);

		int result = academyAddService.insertAcademy(avo);
		cvo.setAcademy_ano(ano);
		log.info("ano >>> " + ano);
		log.info("academy_ano >>> " + academy_ano);
		
		int result2 = academyAddService.insertConveniece(cvo);
		
		if (result > 0) {
			mav.addObject("resultStr", "등록 성공");
		} else {
			mav.addObject("resultStr", "등록 실패");
		}


		mav.setViewName("manage/addAcademy");
		log.info("AcademyAddController insertAcademy >>> 끝");
		return mav;
	}// end of insertAcademy
}
