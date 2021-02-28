package com.doubleu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.service.SelectOutgoingService;
import com.doubleu.approval.service.SelectReceiverService;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.MarketDibDao;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@RestController
public class ControllerMain {
	@Autowired
	SelectReceiverService selectApprovalReceiver;
	
	@Autowired
	SelectOutgoingService selectApprovalOutgoing;
	
	//market
	@Autowired
	MarketDao marketDao;
	
	@RequestMapping(value = "/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("MainPage/login");
		return mv;
	}
	
	@RequestMapping(value = "/mainHeader")
	public ModelAndView mainHeader() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("MainPage/");
		return mv;
	}
	@RequestMapping(value = "/mainPage")
	public ModelAndView mainPage(
			HttpServletRequest req,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView();
		
		
		//approval
		Map<String, Object> receiverMap = selectApprovalReceiver.selectReceiver(req, session);
		mv.addObject("receiverApprovalList", receiverMap.get("list"));
		Map<String, Object> outgoingMap = selectApprovalOutgoing.selectOutgoing(req, session);
		mv.addObject("outgoingApprovalList", outgoingMap.get("list"));
		
		
		
		//market
		List<MarketVo> marketlist = marketDao.selectMarketMain();
		mv.addObject("marketList", marketlist);
		
		
		
		mv.setViewName("MainPage/index");
		return mv;
	}
}
