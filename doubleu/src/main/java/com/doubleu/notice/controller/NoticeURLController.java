package com.doubleu.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeURLController {
	
	@RequestMapping(value = "/noticeIndex", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeIndex(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notice/notice_index");
		return mv;
	}
	
	@RequestMapping(value = "/noticeInsert", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeInsert(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notice/notice_insert");
		return mv;
	}
}
