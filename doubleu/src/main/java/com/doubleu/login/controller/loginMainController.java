package com.doubleu.login.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.service.SelectOutgoingService;
import com.doubleu.approval.service.SelectReceiverService;
import com.doubleu.login.mybatis.LoginDao;
import com.doubleu.login.service.LoginService;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.vo.MarketVo;

@Controller
public class loginMainController {

	@Autowired
	LoginService LoginService;
	
	@Autowired
	LoginDao daoService;
	
	@Autowired
	SelectReceiverService selectApprovalReceiver;
	
	@Autowired
	SelectOutgoingService selectApprovalOutgoing;
	
	//market
	@Autowired
	MarketDao marketDao;
		
	// 로그인 체크
	@RequestMapping(value="/loginCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView LoginResult(
			LoginVo loginVo,
			HttpServletRequest req,
			HttpSession session
			) {
		session.setMaxInactiveInterval(-1);
		ModelAndView mv = new ModelAndView();
		String profileImg;
		
		System.out.println("컨트롤 :  " + loginVo);
		loginVo = LoginService.loginCheck(loginVo, session);
		System.out.println("컨트롤 후 :  " + loginVo);
		
		if(loginVo == null) {
			session.setAttribute("member", null);
			mv.setViewName("redirect:/loginPost");
		}else {
			session.setAttribute("member", loginVo);
			mv.setViewName("MainPage/index");
		}
		
		if(loginVo.getMemberName().equals("정해준") || loginVo.getMemberName().equals("정희석")) {
			 profileImg = "/img/profilem.jpg";
		}
		else {
			 profileImg = "/img/profileg.jpg";
		}
		//전자결재 불러오기
		mv.addObject("profileImg", profileImg);
		Map<String, Object> receiverMap = selectApprovalReceiver.selectReceiver(req, session);
		mv.addObject("receiverApprovalList", receiverMap.get("list"));
		Map<String, Object> outgoingMap = selectApprovalOutgoing.selectOutgoing(req, session);
		mv.addObject("outgoingApprovalList", outgoingMap.get("list"));
		
		//market
		List<MarketVo> marketlist = marketDao.selectMarketMain();
		mv.addObject("marketList", marketlist);
		
		
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
		
		System.out.println("세션 초기화 전 : " + session.getAttribute("member"));
		session.invalidate(); // 세션 초기화
		mv.setViewName("redirect:/login");
		return mv;
	}
}
