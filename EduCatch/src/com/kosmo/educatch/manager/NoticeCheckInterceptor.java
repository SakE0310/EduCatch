package com.kosmo.educatch.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kosmo.educatch.controller.NoticeController;
import com.kosmo.educatch.vo.MemberVO;


public class NoticeCheckInterceptor extends HandlerInterceptorAdapter{
	private Logger log = LoggerManager.getInstance().getLogger(NoticeController.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("Notice Check >>> ");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("user");
		String mauth = null;
		String id = null;
		if(mvo != null) {
			id = mvo.getMid();
			mauth = mvo.getMauth();	
		}
		log.info("mauth : "+mauth);
		log.info("id : "+id);
		if(( id==null || mauth.equals("1") || mauth.equals("2"))) {
			//관리자모드가 아닐때 
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script type='text/javascript' charset='utf-8'> ");
			pw.println("alert('관리자 기능입니다. 새로운 접속을 시도해주세요');");
			pw.println("location.href='http://localhost:8088/EduCatch/index.jsp'");
			pw.println("</script>");
			pw.flush();
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
