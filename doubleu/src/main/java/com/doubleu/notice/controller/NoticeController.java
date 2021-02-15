package com.doubleu.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.vo.NoticeVo;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service;
	@RequestMapping(value = "/noticeInsertR", method= RequestMethod.POST)
	public ModelAndView noticeInsertR(NoticeVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = service.insert(vo);
		mv.setViewName("notice/notice_index");
		return mv;
	}
}
