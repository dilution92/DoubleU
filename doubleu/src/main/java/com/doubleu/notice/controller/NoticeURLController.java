package com.doubleu.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeURLController {
   
   // notice_index.jsp
   @RequestMapping(value = "/noticeIndex", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeIndex(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/notice_index");
      return mv;
   }
   
   // notice_insert.jsp
   @RequestMapping(value = "/noticeInsert", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeInsert(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/notice_insert");
      return mv;
   }
   
   // notice_view.jsp
   @RequestMapping(value = "/noticeView", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeView(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/notice_view");
      return mv;
   }
   
   // familyevent_index.jsp
   @RequestMapping(value = "/familyeventIndex", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventIndex(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/familyevent_index");
      return mv;
   }
   
   // familyevent_insert.jsp
   @RequestMapping(value = "/familyeventInsert", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventInsert(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/familyevent_insert");
      return mv;
   }
   
   // familyevent_view.jsp
   @RequestMapping(value = "/familyeventView", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventView(){
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/notice/familyevent_view");
      return mv;
   }
}