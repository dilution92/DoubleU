package com.doubleu.profile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.service.VacationService;
import com.doubleu.profile.vo.ProfileVo;


@Controller
public class ProfileURLController {

	@Autowired
	ProfileService service1;

	/*
	 * @Autowired VacationService service2;
	 */

	//profile_index.jsp
	@RequestMapping(value = "/profileIndex", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView profileIndex(){
		ModelAndView mv = new ModelAndView();
		List<ProfileVo> contentList = service1.select();
		mv.addObject("contentList", contentList);
		mv.setViewName("/member/profile_index");
		return mv;
	}
	//organization.jsp
		@RequestMapping(value = "/organizationIndex", method = {RequestMethod.POST, RequestMethod.GET}) 
		public ModelAndView organizationIndex(){ 
			ModelAndView mv = new ModelAndView(); 
			mv.setViewName("/member/organization"); 
			return mv; 
		}
		
	//vacationStatus.jsp
	@RequestMapping(value = "/vacationIndex", method = {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView vacationIndex(){ 
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("/member/vacationStatus"); 
		return mv; 
	}
	
	//workStatus.jsp
		@RequestMapping(value = "/workIndex", method = {RequestMethod.POST, RequestMethod.GET}) 
		public ModelAndView workIndex(){ 
			ModelAndView mv = new ModelAndView(); 
			mv.setViewName("/member/workStatus"); 
			return mv; 
		}

}