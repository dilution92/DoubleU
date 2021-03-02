package com.doubleu.member.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.member.service.MemberService;
import com.doubleu.member.vo.MemberVo;

@RestController
public class ModifyURLController  {
	@Autowired
	MemberService service;
	@RequestMapping(value = "/memberModifyIndex", method= RequestMethod.GET)
	public ModelAndView memberModify(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		//msg = service.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("member/modify");
		return mv;
	}
	
	
	
}
