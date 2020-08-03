package com.kosmo.educatch.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.service.CategoryService;
import com.kosmo.educatch.vo.SearchVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AcademyRequestController {
	
	@Autowired
	private CategoryService categoryService;
	
	Logger log = Logger.getLogger(AcademyRequestController.class);
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/AcaReq")
	public ModelAndView getPage() {
		log.info("AcademyRequestController AcaReq >>> ");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("community/AcademyRequest/acaRequest");
		
		return mv;
	}
	
	@RequestMapping("/sendAcademyInfo")
	public ModelAndView sendMail(HttpServletRequest request) {
		log.info("AcademyRequestController sendMail >>> ");
		log.info("contenttype >>> " + request.getContentType());
		
		String setfrom = "educatch2020@gmail.com";
		String tomail = null;// 받는 사람 이메일
		String aname = null;
		String atel = null;
		String cmajor = null;
		String cminor = null;
		String aaddrno = null;
		String aaddr1 = null;
		String aaddr2 = null;
		String alogo = null;
		String file = null;
		ModelAndView mv = new ModelAndView();
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("true");
			
			String uploadPath = "/Users/k/git/EduCatch/EduCatch/WebContent/assets/img/sendMail";
			int size = 10 * 1024 * 1024;
			try {
				MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
				tomail = mr.getParameter("email");
				aname = mr.getParameter("aname");
				atel = mr.getParameter("atel");
				cmajor = mr.getParameter("cmajor");
				cminor = mr.getParameter("cminor");
				aaddrno = mr.getParameter("aaddrno");
				aaddr1 = mr.getParameter("aaddr1");
				aaddr2 = mr.getParameter("aaddr2");
				alogo = mr.getParameter("alogo");
				log.info("mr >>> " + mr);
				Enumeration en = mr.getFileNames();
				while(en.hasMoreElements()) {
					String file1 = (String) en.nextElement();
					file = mr.getFilesystemName(file1);
					log.info("fileName >>> " + file);
				}
			}catch (Exception e) {
				log.info("Exception >>> " + e);
			}
		}else {
			log.info("false");
			
			tomail = request.getParameter("email");
			aname = request.getParameter("aname");
			atel = request.getParameter("atel");
			cmajor = request.getParameter("cmajor");
			cminor = request.getParameter("cminor");
			aaddrno = request.getParameter("aaddrno");
			aaddr1 = request.getParameter("aaddr1");
			aaddr2 = request.getParameter("aaddr2");
			alogo = request.getParameter("alogo");
		}

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "utf-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(setfrom); // 받는사람 이메일
			messageHelper.setSubject(aname + "학원 등록요청입니다."); // 메일제목은 생략이 가능하다
			messageHelper.setText(
					"<html>"+
					"	<table border='1'>				" 	+
					"		<tr>						" 	+
					"			<td>학원명</td>			" 	+
					"			<td>"+aname+"</td>		" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>학원 이메일 주소</td>	"	+
					"			<td>"+tomail+"</td>		" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>학원 전화번호</td>		" 	+
					"			<td>"+atel+"</td>		" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>분야구분</td>			" 	+
					"			<td>"+cmajor+"</td>		" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>보습과정</td>			" 	+
					"			<td>"+cminor+"</td>		" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>우편번호</td>			" 	+
					"			<td>"+aaddrno+"</td>	" 	+
					"		</tr>						" 	+
					"		<tr>						" 	+
					"			<td>주소</td>				" 	+
					"			<td>"+aaddr1+"</td>		" 	+
					"		</tr>						"	+
					"		<tr>						" 	+
					"			<td>상세주소</td>			" 	+
					"			<td>"+aaddr2+"</td>		" 	+
					"		</tr>						" 	+
					"	</table>						" 	+
					"</html>							", true
			); // 메일 내용
			
			if(file != null) {
				FileSystemResource fsr = new FileSystemResource("/Users/k/git/EduCatch/EduCatch/WebContent/assets/img/sendMail/" +file);
				messageHelper.addAttachment(file, fsr);
			}
			log.info("aname >>> " + aname);
			log.info("atel >>> " + atel);
			log.info("filename >>> " + file);
			mailSender.send(message);
			mv.addObject("resultStr", "성공");
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("resultStr", "실패");
		}
		
		mv.setViewName("community/AcademyRequest/acaRequest");
		return mv;
	}
	
	@RequestMapping(value = "/getCmajor", method = RequestMethod.GET)
	public Map<String,List<SearchVO>> getCmajor(){
		log.info("getCmajor >>> ");
		
		List<SearchVO> list = categoryService.getCmajorList();
		
		log.info(list.get(0).getCmajor());
		
		Map<String, List<SearchVO>> map = new HashMap<String, List<SearchVO>>();
		map.put("major", list);
		
		return map;
	}
}
