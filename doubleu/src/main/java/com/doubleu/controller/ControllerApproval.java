package com.doubleu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.ApprovalFormVo;

@Controller
public class ControllerApproval {

	
	@RequestMapping(value = "/approvalInsert", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView insert(ApprovalFormVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("insert 도착");
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv; 
	}
	
	@RequestMapping(value = "/approvalTempInsert", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView tempInsert(ApprovalFormVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("tempInsert 도착");
		
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
	@RequestMapping(value = "/approvalGoSelect", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Goselect 도착");

		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
}
