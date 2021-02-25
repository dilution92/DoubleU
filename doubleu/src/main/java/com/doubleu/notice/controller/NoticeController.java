package com.doubleu.notice.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeVo;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service1;
	
	@Autowired
	FamilyeventService service2;
	
	
	// 사내공지 글쓰기 -> index
	@RequestMapping(value = "/noticeInsertR", method= RequestMethod.POST)
	public ModelAndView noticeInsertR(NoticeVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = service1.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("notice/notice_index");
		return mv;
	}
	
	// 경조사 글쓰기 -> index
	@RequestMapping(value = "/familyeventInsertR", method= RequestMethod.POST)
	public ModelAndView familyeventInsertR(FamilyeventVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = service2.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("notice/familyevent_index");
		
		
		return mv;
	}
	
	
	// 경조사 index view
	@RequestMapping(value = "/familyeventView", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView familyeventView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView();
		FamilyeventVo vo = service2.view(no);
		mv.addObject("obj", vo);
		mv.setViewName("notice/familyevent_view");
		return mv;
	}
   
   // 경조사 index update
   @RequestMapping(value = "/familyeventUpdateR", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventUpdate(FamilyeventVo vo){
      ModelAndView mv = new ModelAndView();
	  String msg = service2.update(vo);
	  System.out.println(msg);
      mv.setViewName("/notice/familyevent_update");
      return mv;
   }
	
}
