package com.doubleu.controller;

import java.util.ArrayList;
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
import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderVo;
import com.doubleu.calender.vo.CalenderWeekList;
import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.service.SelectSerivce;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.MarketDibDao;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;
import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeVo;

@RestController
public class ControllerMain {
	@Autowired
	SelectReceiverService selectApprovalReceiver;
	
	@Autowired
	SelectOutgoingService selectApprovalOutgoing;
	
	//market
	@Autowired
	MarketDao marketDao;
	
	// 이메일
	@Autowired
	EmailDao DaoService;
	
	@Autowired
	SelectSerivce selectService;
	
	@Autowired
	CalenderService calender;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	FamilyeventService familyeventService;
	
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
			HttpSession session,
			EmailPage page
			) {
		ModelAndView mv = new ModelAndView();
		String profileImg;
		LoginVo loginVo= (LoginVo) session.getAttribute("member");
		
		//approval
		Map<String, Object> receiverMap = selectApprovalReceiver.selectReceiver(req, session);
		mv.addObject("receiverApprovalList", receiverMap.get("list"));
		Map<String, Object> outgoingMap = selectApprovalOutgoing.selectOutgoing(req, session);
		mv.addObject("outgoingApprovalList", outgoingMap.get("list"));
		
		//market
		List<MarketVo> marketlist = marketDao.selectMarketMain();
		mv.addObject("marketList", marketlist);
		
		//이메일
		int emailMailBox = 3; //보낸 메일함
		page.setEmailMailBox(emailMailBox);
		Map<String, Object> map = DaoService.selectPaging(page, session);
		mv.addObject("EmailList", map.get("pageList"));		
				
		//게시판
	    List<NoticeVo> contentList1 = noticeService.select();
        mv.addObject("contentList1", contentList1);
        List<FamilyeventVo> contentList = familyeventService.select();
        mv.addObject("contentList", contentList);
        
        // 일정
        List<CalenderWeekList> list = new ArrayList<>();
        list = calender.setMonthCalender(session);
        List<CalenderVo> mainList = calender.selectMain(session);
	         int year = calender.getYear();
	         int month = calender.getMonth();
	         int day = calender.getDay();
	         mv.addObject("currentYear", year);
	         mv.addObject("currentMonth", month);
	         mv.addObject("currentDay", day);
	         mv.addObject("calender",list);
	         mv.addObject("mainList",mainList);
        
		//IMG
		if(loginVo.getMemberName().equals("정희석")) {
			profileImg = "/img/profilem.jpg";
		}
		else if(loginVo.getMemberName().equals("정해준")) {
			profileImg = "/img/profilehaejun.png";
		}
		else if(loginVo.getMemberName().equals("김재현")){
			profileImg = "/img/profilekim.png";
		}
		else {
			profileImg = "/img/profileg.jpg";
		}
		mv.addObject("profileImg", profileImg);
		
		mv.setViewName("MainPage/index");
		return mv;
	}
}
