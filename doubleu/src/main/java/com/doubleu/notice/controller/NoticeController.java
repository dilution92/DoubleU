package com.doubleu.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/familyeventIndexR", method= RequestMethod.POST)
	public ModelAndView familyeventIndexR(FamilyeventVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = service2.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("notice/familyevent_index");
		return mv;
	}
}
