package com.doubleu.profile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.service.WorkService;
import com.doubleu.profile.vo.ProfileVo;
import com.doubleu.profile.vo.WorkVo;


@Controller
public class ProfileURLController {

	@Autowired
	ProfileService service1;

	@Autowired
	WorkService service2;

	//profile_index.jsp
	@RequestMapping(value = "/profileIndex", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView profileIndex(){
		ModelAndView mv = new ModelAndView();
		List<ProfileVo> contentList1 = service1.selectProfile();
		mv.addObject("contentList1", contentList1);
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
			List<WorkVo> contentList2 = service2.selectWork();
			mv.addObject("contentList2", contentList2);
			mv.setViewName("/member/workStatus"); 
			return mv; 
		}

}