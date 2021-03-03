package com.doubleu.login.controller;
import java.util.ArrayList;
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
import com.doubleu.calender.service.CalenderService;
import com.doubleu.calender.vo.CalenderVo;
import com.doubleu.calender.vo.CalenderWeekList;
import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.service.SelectSerivce;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.login.mybatis.LoginDao;
import com.doubleu.login.service.LoginService;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.vo.MarketVo;
import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeVo;

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

   //이메일
   @Autowired
   EmailDao DaoService;

   @Autowired
   SelectSerivce selectService;

   @Autowired
   FamilyeventService familyeventService;

   @Autowired
   NoticeService noticeService;
   
   @Autowired
   CalenderService calender;
      
   // 로그인 체크
   @RequestMapping(value="/loginCheck", method= {RequestMethod.GET, RequestMethod.POST})
   public ModelAndView LoginResult(
         LoginVo loginVo,
         HttpServletRequest req,
         HttpSession session,
         EmailPage page
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
         
         if(loginVo.getMemberName().equals("정희석")) {
             profileImg = "/img/profilem.jpg";
         }
         else if(loginVo.getMemberName().equals("정해준")) {
            profileImg = "/img/profilehaejun.png";
         }
         else if(loginVo.getMemberName().equals("김재현")){
            profileImg = "/img/profilekim.png";
         }
 	  	 else if(loginVo.getMemberName().equals("전예린")){
	 		profileImg = "/img/profilejeon.jpg";
		 }
		 else if(loginVo.getMemberName().equals("강성연")){
			profileImg = "/img/profilekang.png";
		 }
         else {
            profileImg = "/img/profileg.jpg";
         }
         mv.addObject("profileImg", profileImg);
         
         //전자결재 불러오기
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
       int year = calender.getYear();
       int month = calender.getMonth();
       int day = calender.getDay();
       mv.addObject("currentYear", year);
       mv.addObject("currentMonth", month);
       mv.addObject("currentDay", day);
       mv.addObject("calender",list);

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

      System.out.println("세션 초기화 전 : " + session.getAttribute("member"));
      session.invalidate(); // 세션 초기화
      mv.setViewName("redirect:/login");
      return mv;
   }

}

