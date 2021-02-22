package com.doubleu.login.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.login.mybatis.LoginDao;
import com.doubleu.login.service.LoginService;
import com.doubleu.login.vo.LoginVo;

@Controller
public class loginMainController {

	@Autowired
	LoginService LoginService;
	
	@Autowired
	LoginDao daoService;
	
	// 로그인 체크
	@RequestMapping(value="/loginCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView LoginResult(
			LoginVo vo,
			HttpServletRequest req,
			HttpSession session
			) {
		
		ModelAndView mv = new ModelAndView();
		
		
		System.out.println("컨트롤 :  " + vo);
		vo = LoginService.loginCheck(vo, session);
		System.out.println("컨트롤 후 :  " + vo);
		
		if(vo == null) {
			session.setAttribute("member", null);
			mv.setViewName("redirect:/loginPost");
		}else {
			session.setAttribute("member", vo);
			mv.setViewName("MainPage/index");
		}
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping(value="/loginOut", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView LoginOut(
			LoginVo vo,
			HttpServletRequest req,
			HttpSession session
			) {
		
		ModelAndView mv = new ModelAndView();
		
		// session.removeAttribute("memberMid"); 개별 초기화
		session.invalidate(); // 세션 초기화
		
		return mv;
	}

}
