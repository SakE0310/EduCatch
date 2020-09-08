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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.FilePathManager;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.CategoryService;
import com.kosmo.educatch.vo.AcademyVO;
import com.kosmo.educatch.vo.SearchVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AcademyRequestController {
	
	private Logger log = LoggerManager.getInstance().getLogger(AcademyRequestController.class);
	// 파일경로 바꿔주는 싱글톤 객체
	private FilePathManager fManager = FilePathManager.getInstance();
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	// 메일전송을 위함
	private JavaMailSender mailSender;
	
	@RequestMapping("/AcaReq")
	public ModelAndView getPage() {
		log.info("AcademyRequestController AcaReq >>> ");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("community/AcademyRequest/acaRequest");
		
		return mv;
	}
	
	//전송하기 버튼
	@RequestMapping("/sendAcademyInfo")
	public ModelAndView sendMail(HttpServletRequest request) {
		log.info("AcademyRequestController sendMail >>> ");
		log.info("contenttype >>> " + request.getContentType());
		
		// 보내는사람
		String setfrom = "educatch2020@gmail.com";
		// 받는 사람 이메일
		String tomail = null;
		// 학원이름
		String aname = null;
		// 학원전화
		String atel = null;
		// 분야구분
		String cmajor = null;
		// 보습과정
		String cminor = null;
		// 우편번호
		String aaddrno = null;
		// 주소1
		String aaddr1 = null;
		// 상세주소
		String aaddr2 = null;
		// 로고 이미지
		String alogo = null;
		// 이미지 파일
		String file = null;
		
		ModelAndView mv = new ModelAndView();
		
		// 멀티파트 폼데이터인지 확인하기 위함
		// 멀티파트 폼데이터면 파일 전송을 실시
		if(request.getContentType().toLowerCase().startsWith("multipart/form-data")) {
			log.info("multipart/form-data true");
			
			// file삽입경로 (변경필수)
			String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/sendMail";
			uploadPath = fManager.changePath(uploadPath);
			log.info("upload Path Test >>> " + uploadPath);
			// file 최대크기
			int size = 10 * 1024 * 1024;
			// multipart로 파일을 업로드 후 각 데이터셋팅
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
			// 멀티파트 폼데이터가 아닐경우 파일 전송없이 매핑
		}else {
			log.info("multipart/form-data false");
			
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
			// 보내는사람 생략하면 정상작동을 안함
			messageHelper.setFrom(setfrom);
			// 받는사람 이메일
			messageHelper.setTo(setfrom); 
			// 메일제목은 생략이 가능하다
			messageHelper.setSubject(aname + "학원 등록요청입니다."); 
			// 메일 내용은 html tag로 표를 만들어 내용을 입력 후 전송
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
			);
			
			// file(multipart~~)가 있으면.. 파일 경로에 맞는 것을 메일전송에 첨부시킴
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
			log.info("Error >>> " + e);
			mv.addObject("resultStr", "실패");
		}
		
		mv.setViewName("community/AcademyRequest/acaRequest");
		return mv;
	}
	
	// json 타입 반환위함
	@ResponseBody
	@RequestMapping(value = "/getCmajor")
	public Map<String,List<SearchVO>> getCmajor(){
		log.info("getCmajor >>> ");
		
		List<SearchVO> list = categoryService.getCmajorList();
		
		log.info(list.get(0).getCmajor());
		
		Map<String, List<SearchVO>> map = new HashMap<String, List<SearchVO>>();
		map.put("major", list);
		
		// map이 jackson-databind라이브러리에 의해 json으로 변환되어 리턴이 된다. 
		// ajax에서 해당 url호출시 html형식으로반환이 되는것이아닌 JSON타입의 객체로 반환이 된다.
		// 궁금하면 http://localhost:8088/EduCatch/getCmajor.ec 접근바람
		return map;
	}
	
	//minor 얻어와 json으로 변환 전송
	@ResponseBody
	@RequestMapping(value="/getCminor")
	public Map<String, List<SearchVO>> getCminor(HttpServletRequest request){
		log.info("getCminor >>> ");
		log.info("parameter major >>> " + request.getParameter("major"));
		
		String major = request.getParameter("major");
		
		List<SearchVO> list = categoryService.getCminorList(major);
		
		Map<String, List<SearchVO>> map = new HashMap<String, List<SearchVO>>();
		map.put("minor", list);
		return map;
	}
}
