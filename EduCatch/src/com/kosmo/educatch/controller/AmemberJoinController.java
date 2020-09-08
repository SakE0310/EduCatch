package com.kosmo.educatch.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.FilePathManager;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.AmemberJoinService;
import com.kosmo.educatch.service.MemberJoinService;
import com.kosmo.educatch.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AmemberJoinController {
	private Logger log = LoggerManager.getInstance().getLogger(MemberJoinController.class);
	// 파일경로 바꿔주는 싱글톤 객체
	private FilePathManager fManager = FilePathManager.getInstance();
	
	@Autowired
	private AmemberJoinService amemberjoinservice;
	
	@Autowired
	private JavaMailSender mailSender;

	private int size;
	

	//학원회원가입폼으로 이동 
	@RequestMapping("/amemberJoinForm")
	public ModelAndView AmemberJoinForm(@ModelAttribute MemberVO param) {
		log.info("AmemberJoinForm함수 진입");
		ModelAndView mav = new ModelAndView(); 
		
		mav.setViewName("member/join/academyJoinForm");
		log.info("AmemberJoinForm함수 진입 끝");
		return mav;
	}
	
	//등록
	@RequestMapping("amemberinsert")
	public ModelAndView aMemberInsert(@ModelAttribute MemberVO param, HttpServletRequest request) {
		log.info("amemberInsert함수 진입+파일 업로드");
		
		String mno = "";
		String mid = "";
		String mpw = "";
		String mname = "";
		String mtel = "";
		String maddrno = "";
		String maddr1 = "";
		String maddr2 = "";
		String mimg = "";
		String resultStr = "";

		// file삽입경로 (변경필수)
		String uploadPath = request.getServletContext().getRealPath("") + "/assets/img/amemimg";
		uploadPath = fManager.changePath(uploadPath);
		log.info("upload Path Test >>> " + uploadPath);
		
		int size=10*1024*1024;
		//String uploadPath = request.getServletContext().getRealPath("")+"//assets//img//amemimg";
		//String uploadPath = "C://Users//ekfri//git//EduCatch//EduCatch//WebContent//assets//img//amemimg";
		
		try {
			MultipartRequest mr = new MultipartRequest(request,
														uploadPath,
														size,
														"UTF-8",
														new DefaultFileRenamePolicy());
			
			mno = mr.getParameter("mno");
			
			//아이디 조립(이메일)
			String memail0 = mr.getParameter("memail0");
			String memail1 = mr.getParameter("memail1");
			mid = memail0 +"@"+ memail1;

			mpw = mr.getParameter("mpw");
			mname = mr.getParameter("mname");
			
			//핸드폰 조립
			String mtel1 = mr.getParameter("mtel1");
			String mtel2 = mr.getParameter("mtel2");
			String mtel3 = mr.getParameter("mtel3");
			mtel = mtel1+"-"+mtel2+"-"+mtel3;

			maddrno = mr.getParameter("maddrno");
			maddr1 = mr.getParameter("maddr1");
			maddr2 = mr.getParameter("maddr2");
			
			log.info("회원번호"+mno);
			log.info("아이디(이메일)"+mid);
			log.info("비밀번호"+mpw);
			log.info("회원이름"+mname);
			log.info("핸드폰번호"+mtel);
			log.info("우편번호"+maddrno);
			log.info("기본주소"+maddr1);
			log.info("상세주소"+maddr2);
			
			Enumeration<String> en = mr.getFileNames();
			List<String> list = new ArrayList<String>();
			
			while(en.hasMoreElements()) {
				String file1 = en.nextElement();
				String filename = mr.getFilesystemName(file1);
				log.info("fileName>>>"+filename);
				list.add(mr.getFilesystemName(file1));
			}
			mimg = String.valueOf(list.get(0));
			
			param.setMno(mno);
			param.setMid(mid);
			param.setMpw(mpw);
			param.setMname(mname);
			param.setMtel(mtel);
			param.setMaddrno(maddrno);
			param.setMaddr1(maddr1);
			param.setMaddr2(maddr2);
			param.setMimg(mimg);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//인증번호 생성(난수 발생)
		String memailchk = getKey(6);
		param.setMemailchk(memailchk);
		log.info("memailchk난수>>>"+memailchk);
		
		//db에 기본정보 insert
		int result  = amemberjoinservice.aMemberInsert(param);
		log.info("result>>"+result);
		
		//이메일 발송
		sendAuthMail(mid, memailchk, mid);
		
		//난수 발생 및 이메일 발송
		//String memailchk = sendAuthMail(mid, memailchk);
		//param.setMemailchk(memailchk);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			resultStr="등록 완료";
		}
		else {
			resultStr="등록 문제 발생";
		}
		
		log.info("amemberInsert함수 진입 끝");
		mav.addObject("result",resultStr);
		mav.setViewName("member/join/result");
		return mav;
	}
	
	//난수발생함수
	private String getKey(int size) {
		log.info("난수발생함수getKey() 시작");
		this.size = size;
		return getAuthcode();
	}
	
	//인증코드 난수 발생
	private String getAuthcode() {
		log.info("인증코드 난수 발생함수 getAuthcode() 시작");
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num=0;
		
		while(sb.length()<size) {
			num = random.nextInt(10);
			sb.append(num);
		}
		return sb.toString();
	}
	//인증메일 보내기
	public void sendAuthMail(String email, String memailchk, String mid){
		log.info("이메일보내기함수 sendAuthMail() 시작");
		
		
		String mailcontent = "<h1>[이메일 인증]</h1><br>" +
				"<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"+
				"<a href='http://localhost:8088/EduCatch/memberupdate.ec?memailchk="+memailchk+"&mid="+mid+"'>이메일 인증확인</a>";
		try {
			MimeMessage mailmessage = mailSender.createMimeMessage();
			MimeMessageHelper helper;
			helper = new MimeMessageHelper(mailmessage, true,"utf-8");
			helper.setFrom(new InternetAddress("educatch2020@gmail.com"));
			helper.setTo(new InternetAddress(email));
			helper.setSubject("[EduCatch]회원가입 이메일인증");
			helper.setText(mailcontent,true);
			mailSender.send(mailmessage);
		} catch (javax.mail.MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	//DB에 난수(memailchk) Y로 업데이트	
	@RequestMapping("amemberupdate")
	public ModelAndView aMemberUpdate(@ModelAttribute MemberVO param) {
		log.info("amemberupdate함수 진입");
		log.info("(쿼리스트링)memailchk>>>"+param.getMemailchk());
		
		String resultStr ="";
		int result = amemberjoinservice.aMemberUpdate(param);
		log.info("result>>>"+result);
		if(result>0) {
			resultStr="회원등록이 완료되셨습니다.";
		}
		else {
			resultStr="수정 문제";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("member/join/joinComplete");
		log.info(resultStr);
		log.info("amemberupdate함수 끝");
		return mav;
	}
	
}
