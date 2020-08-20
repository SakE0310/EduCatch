package com.kosmo.educatch.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kosmo.educatch.controller.AcademyRequestController;
import com.kosmo.educatch.vo.MemberVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	private Logger log = LoggerManager.getInstance().getLogger(AcademyRequestController.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("user");
		String id = null;
		if(mvo != null) {
			id = mvo.getMid();		
		}
		log.info("id : "+id);
		if (id==null) {
			//로그인 안했을 때
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script type='text/javascript' charset='utf-8'> ");
			pw.println("alert('로그인이 필요한 기능입니다. 로그인을 해주세요');");
			pw.println("location.href = document.referrer;");
			pw.println("</script>");
			pw.flush();
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
