package com.doubleu.notice.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.notice.vo.NoticePage;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeVo;

@Controller
public class NoticeURLController {
   
	@Autowired
	NoticeService service1;
	
	@Autowired
	FamilyeventService service2;

	
/* -------------------- 공지사항 -------------------- */
	
   // notice_index.jsp
   @RequestMapping(value = "/noticeIndex", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeIndex(NoticePage page, HttpSession session){
      ModelAndView mv = new ModelAndView();

      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);
      
      service1.updatePost();
      Map<String, Object> map = service1.selectPaging(page);

      System.out.println(page);
      List<NoticeVo> contentList1 = service1.select();

      mv.addObject("loginName", loginName);
      mv.addObject("contentList1", contentList1);
      mv.addObject("page", map.get("page"));
      mv.addObject("list", map.get("pageList"));
      mv.setViewName("/notice/notice_index");
      return mv;
   }
   
   // notice_insert.jsp
   @RequestMapping(value = "/noticeInsert", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeInsert(HttpSession session){
      ModelAndView mv = new ModelAndView();
      
      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);

      mv.addObject("loginName", loginName);
      mv.setViewName("/notice/notice_insert");
      return mv;
   }

	/*
	 * // notice_view.jsp
	 * 
	 * @RequestMapping(value = "/noticeView", method = {RequestMethod.POST,
	 * RequestMethod.GET}) public ModelAndView noticeView(){ ModelAndView mv = new
	 * ModelAndView(); mv.setViewName("/notice/notice_view"); return mv; }
	 */
   
   // notice_update.jsp
   @RequestMapping(value = "/noticeUpdate", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeUpdate(@RequestParam int no, HttpSession session){
      ModelAndView mv = new ModelAndView();
      
      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);

      NoticeVo vo = service1.view(no);
	  
      mv.addObject("loginName", loginName);
	  mv.addObject("obj", vo);
      mv.setViewName("/notice/notice_update");
      return mv;
   }

/* -------------------- 경조사 -------------------- */
   
   // familyevent_index.jsp
   @RequestMapping(value = "/familyeventIndex", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventIndex(NoticePage page, HttpSession session){
      ModelAndView mv = new ModelAndView();
      
      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);
      
      Map<String, Object> map = service2.selectPaging(page);
      
      System.out.println(page);
      List<FamilyeventVo> contentList = service2.select();
      
      mv.addObject("loginName", loginName);
      mv.addObject("contentList", contentList);
      mv.addObject("page", map.get("page"));
      mv.addObject("list", map.get("pageList"));
      mv.setViewName("/notice/familyevent_index");
      return mv;
   }
   
   // familyevent_insert.jsp
   @RequestMapping(value = "/familyeventInsert", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventInsert(HttpSession session){
	  
      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("loginName", loginName);
      mv.setViewName("/notice/familyevent_insert");
      return mv;
   }
   
   // familyevent_update
   @RequestMapping(value = "/familyeventUpdate", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventUpdate(@RequestParam int no, HttpSession session){
	   
      LoginVo loginVo = (LoginVo) session.getAttribute("member");
      String loginName = loginVo.getMemberName();
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ loginName);
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("loginName", loginName);

      FamilyeventVo vo = service2.view(no);
	  mv.addObject("obj", vo);
      mv.setViewName("/notice/familyevent_update");
      return mv;
   }
}