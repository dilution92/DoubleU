package com.doubleu.profile.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.vo.MemberVo;


@Controller
public class ProfileURLController {
   
	@Autowired
	ProfileService service;
	
   // profile.jsp
   @RequestMapping(value = "/profileIndex", method = {RequestMethod.GET, RequestMethod.POST})
   public ModelAndView profileIndex(MemberVo vo){
      ModelAndView mv = new ModelAndView();
      List<MemberVo> pList = new ArrayList<MemberVo>();
      pList=service.selectList();
      mv.setViewName("member/profile");
      return mv;
   }
   
   @RequestMapping(value = "/organizationIndex", method = {RequestMethod.POST, RequestMethod.GET}  )
	public ModelAndView organizationIndex() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("member/organization");

		return mv;
	}
}