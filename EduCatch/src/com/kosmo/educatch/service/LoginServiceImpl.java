package com.kosmo.educatch.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.educatch.dao.LoginMapper;
import com.kosmo.educatch.manager.LoggerManager;
import com.kosmo.educatch.vo.AMemberVO;
import com.kosmo.educatch.vo.MemberVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {

	private Logger log = LoggerManager.getInstance().getLogger(LoginServiceImpl.class);
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private JavaMailSender mailSender;

	
	@Override
	public MemberVO loginCheck(MemberVO mvo) {
		MemberVO result = loginMapper.memberLoginInfo(mvo);
		log.info("result" + result );
		return result;
	}
	
	/*
	 * 비밀번호 변경 전 이메일 확인
	 * 이메일 인증에 따라 return 값 변경
	 * RETURN > Result message
	 */
	@Override
	public String passwordReset(MemberVO param) {
		String result = "";
		String email = param.getMid();
		log.info("password change > " + email);
		if(email != null) {
			String checkMember = loginMapper.emailCheckID(param);
			log.info("checkMember >>>" + checkMember );
			if(checkMember == "" || checkMember == null) {
				result = "이메일 인증이 완료되지 않은 아이디 입니다.";
				return result;
			} else {
				try {
					sendAuthMail(email);
				}catch(Exception e) {
					log.error(e);
					result = "이메일 전송중 오류가 발생했습니다.";
					return result;
				}
				result = "등록된 이메일로 비밀번호 변경 링크를 전송하였습니다.";
			}
		}else {
			result = "존재하지 않는 이메일 입니다.";
		}
		
		return result;
	}

	/*
	 * Email 인증 완료 후 링크로 비밀번호 변경Page 들어온 경우
	 * 해당Email의 Member 정보에 password Update
	 */
	@Override
	public String passwordChange(MemberVO param) {
		loginMapper.passwordChange(param);
		
		String result = param.getMid() + "의 비밀번호가 변경되었습니다.";
		return result;	
	}
	
	// 인증메일 보내기
	public void sendAuthMail(String email) throws Exception {
		String mailcontent = "<h1>[비밀번호 변경]</h1><br>" + "<p>아래 링크를 클릭하시고 비밀번호를 변경해주세요.</p>"
				+ "<a href='http://localhost:8088/EduCatch/passwdChangePage.ec?mid=" + email
				+ "'>이메일 인증확인</a>";
		MimeMessage mailmessage = mailSender.createMimeMessage();
		MimeMessageHelper helper;
		helper = new MimeMessageHelper(mailmessage, true, "utf-8");
		helper.setFrom(new InternetAddress("educatch2020@gmail.com"));
		helper.setTo(new InternetAddress(email));
		helper.setSubject("[EduCatch]비밀번호 변경");
		helper.setText(mailcontent, true);
		mailSender.send(mailmessage);

	}


}


