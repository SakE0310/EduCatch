package com.kosmo.educatch.controller;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.service.MemberJoinService;
import com.kosmo.educatch.vo.MemberVO;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

@Controller
public class MemberJoinController {
	private Logger log = LoggerManager.getInstance().getLogger(MemberJoinController.class);
	
	@Autowired
	private MemberJoinService memberjoinservice;
	
	@Autowired
	private JavaMailSender mailSender;

	private int size;
	

	//일반회원가입폼으로 이동 
	@RequestMapping("/memberjoinform")
	public ModelAndView memberJoinForm(@ModelAttribute MemberVO param) {
		log.info("memberJoinForm함수 진입");
		ModelAndView mav = new ModelAndView(); 
		
		mav.setViewName("member/join/memberJoinForm");
		log.info("memberJoinForm함수 진입 끝");
		return mav;
	}
	
	//등록
	@RequestMapping("memberinsert")
	public ModelAndView memberInsert(@ModelAttribute MemberVO param, HttpServletRequest request) {
		log.info("memberInsert함수 진입");
		
		//핸드폰 조립
		String mtel1 = request.getParameter("mtel1");
		String mtel2 = request.getParameter("mtel2");
		String mtel3 = request.getParameter("mtel3");
		String mtel = mtel1+"-"+mtel2+"-"+mtel3;
		param.setMtel(mtel);
		
		//아이디 조립(이메일)
		String memail0 = request.getParameter("memail0");
		String memail1 = request.getParameter("memail1");
		String mid = memail0 +"@"+ memail1;
		param.setMid(mid);
		
		String msnsid = param.getMsnsid();
		String msnstype = param.getMsnstype();
		
		log.info("회원번호"+param.getMno());
		log.info("**snsid"+msnsid);
		log.info("**snstype"+msnstype);
		log.info("아이디(이메일)"+param.getMid());
		log.info("비밀번호"+param.getMpw());
		log.info("회원이름"+param.getMname());
		log.info("핸드폰번호"+param.getMtel());
		log.info("우편번호"+param.getMaddrno());
		log.info("기본주소"+param.getMaddr1());
		log.info("상세주소"+param.getMaddr2());
		
		String resultStr ="";
		
		//인증번호 생성(난수 발생)
		//String memailchk = getKey(6);
		String memailchk = getKey();
		String findpw = getKey();
		param.setFindpw(findpw);
		param.setMemailchk(memailchk);
		log.info("memailchk난수>>>"+memailchk);
		
		//db에 기본정보 insert
		int result  = memberjoinservice.memberInsert(param);
		log.info("result>>"+result);
		
		//이메일 발송
		sendAuthMail(memailchk, mid, msnsid, msnstype);
		
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
		
		log.info("memberInsert함수 진입 끝");
		mav.addObject("result",resultStr);
		mav.setViewName("member/join/result");
		return mav;
	}
	//난수발생(문자열)
	private String getKey() {
		log.info("난수발생함수getKey() 시작");
		String eng = "abcdefghijklmnopqrstuvwxyz";
		String num = "0123456789";
		String datastring = eng + num;
		int random_length = 10;
		
		return getAuthcode(datastring, random_length);
	}
	private static SecureRandom random = new SecureRandom();
	//인증코드 난수 발생(문자열)
	private String getAuthcode(String data, int length) {
		StringBuilder sb = new StringBuilder(length);
		for(int i=0; i<length; i++) {
			sb.append(data.charAt(random.nextInt(data.length())));
		}
		return sb.toString();
	}
	
//	//난수발생함수
//	private String getKey(int size) {
//		log.info("난수발생함수getKey() 시작");
//		this.size = size;
//		return getAuthcode();
//	}
//	
//	//인증코드 난수 발생
//	private String getAuthcode() {
//		log.info("인증코드 난수 발생함수 getAuthcode() 시작");
//		Random random = new Random();
//		StringBuffer sb = new StringBuffer();
//		int num=0;
//		
//		while(sb.length()<size) {
//			num = random.nextInt(10);
//			sb.append(num);
//		}
//		return sb.toString();
//	}
	//인증메일 보내기
	public void sendAuthMail(String memailchk, String mid, String msnsid, String msnstype){
		log.info("이메일보내기함수 sendAuthMail() 시작");
		
		
		String mailcontent = "<h1>[이메일 인증]</h1><br>" +
				"<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"+
				"<a href='http://localhost:8088/EduCatch/memberupdate.ec?memailchk="+memailchk+"&mid="+mid+"&msnsid="+msnsid+"&msnstype="+msnstype+"'>이메일 인증확인</a>";
		try {
			MimeMessage mailmessage = mailSender.createMimeMessage();
			MimeMessageHelper helper;
			helper = new MimeMessageHelper(mailmessage, true,"utf-8");
			helper.setFrom(new InternetAddress("educatch2020@gmail.com"));
			helper.setTo(new InternetAddress(mid));
			helper.setSubject("[EduCatch]회원가입 이메일인증");
			helper.setText(mailcontent,true);
			mailSender.send(mailmessage);
		} catch (javax.mail.MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	//DB에 난수(memailchk) Y로 업데이트	
	@RequestMapping("memberupdate")
	public ModelAndView memberUpdate(@ModelAttribute MemberVO param) {
		log.info("memberupdate함수 진입");
		log.info("(쿼리스트링)memailchk>>>"+param.getMemailchk());
		
		String resultStr ="";
		int result = memberjoinservice.memberUpdate(param);
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
		log.info("memberupdate함수 끝");
		return mav;
	}
	//카카오 로그인 시 아이디 중복체크
	@RequestMapping("/memberCheck")
	@ResponseBody
	public int memberCheck(@ModelAttribute MemberVO param) {
		log.info("memberCheck함수 진입");
		log.info("email/mid>>>" + param.getMid());
		log.info("msnsid>>>" + param.getMsnsid());
		List<MemberVO> mcList = memberjoinservice.memberCheck(param);
		log.info("조회된 개수>>>" + mcList.size());
		Map<String, Object> m = new HashMap<String, Object>();
		int num = mcList.size();
		m.put("result", num);
		log.info("memberCheck함수 진입 끝");
		return num;
	}
	//자체 가입시 아이디 중복체크
}
