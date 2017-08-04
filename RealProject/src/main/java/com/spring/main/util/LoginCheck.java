package com.spring.main.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	//컨트롤러 요청 전
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception{
		System.out.println("인터셉터");
		boolean pass = false;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginId") == null){
			System.out.println("비로그인");
			response.sendRedirect("/main/");
		}else{
			System.out.println("로그인");
			pass = true;
		}
	
		return pass;
	}
	
	//컨트롤러 요청 후 ~ jsp 전송 전
	@Override
	public void postHandle(HttpServletRequest request, 
		HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		System.out.println("post handler 접근");
		HttpSession session = request.getSession();
		String loginBox = "<div id='loginArea'>"
			+"안녕하세요, "+session.getAttribute("loginId")+" 님! "	
			+" <a href='./logout'>로그아웃</a>"
			+"</div>";
		mav.addObject("loginBox", loginBox);
	}	

}
