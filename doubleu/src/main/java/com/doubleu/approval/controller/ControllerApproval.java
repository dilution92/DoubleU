package com.doubleu.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.ApprovalFormVo;
import com.doubleu.approval.vo.FormPetition;

@RestController
public class ControllerApproval {

	@Autowired
	ApprovalDao service;
	
	
	@RequestMapping(value = "/approvalInsert", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView insert(ApprovalFormVo vo, FormPetition petitionVo) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		vo.setFormPetition(petitionVo);
		
		
		System.out.println(vo.getEventDate());
		System.out.println(vo.getDrafterName());
		
		System.out.println("insert 도착");
		msg = service.insert(vo);
		
		System.out.println(msg);
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		//  클라언트 요청 컨트롤 > 서비스 > 다오 > 마이바티스 > 다오로 반환 > 서비스 반환 > 컨트롤로 리턴 > 뷰로 리턴 
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
