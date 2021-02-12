package com.doubleu.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ControllerApprovalGoLink {

	
	@RequestMapping(value = "/approvalGoHome")
	public ModelAndView mainHeader() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ElectronicApproval/E_Approval_home");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoList")
	public ModelAndView goList(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String selectName = req.getParameter("selectName");
		String mainJob = "E_Approval_select_choose.jsp";
		
		switch(selectName) {
		case "0" :
			selectName = "상신한 문서함";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "1" :
			selectName = "임시저장된 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "2" :
			selectName = "승인완료된 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "3" :
			selectName = "반려된 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "4" :
			selectName = "결재할 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "5" :
			selectName = "승인한 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		case "6" :
			selectName = "반려한 문서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("selectName", selectName);
			break;
		}
		
		mv.setViewName("ElectronicApproval/E_Approval_home");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoFormType")
	public ModelAndView goFormType(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int formTypeNo = Integer.parseInt(req.getParameter("formTypeNo"));
		String mainJob = null;
		String formName = null;
		
		switch(formTypeNo) {
		case 0 :
			
			
			mainJob = "E_Approval_form_work.jsp";
			formName = "업무 기안";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 1 :
			mainJob = "E_Approval_form_work.jsp";
			formName = "업무 협조";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 2 :
			mainJob = "E_Approval_form_petition.jsp";
			formName = "품의서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 3 :
			mainJob = "E_Approval_form_purchasePetition.jsp";
			formName = "구매품의서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 4 :
			mainJob = "E_Approval_form_explanatory.jsp";
			formName = "사유서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 5 :
			mainJob = "E_Approval_form_vacation.jsp";
			formName = "휴가 신청서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 6 :
			mainJob = "E_Approval_form_explanatory.jsp";
			formName = "지각/결근 사유서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case 7 :
			mainJob = "E_Approval_form_purchasePetition.jsp";
			formName = "지출결의서";
			
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		}
		
		mv.addObject("formTypeNo", formTypeNo);
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoView")
	public ModelAndView goView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		int formType = formNo;
		int formState = formNo;
		String mainJob = null;
		switch(formType) {
		
		case 0 : 
			mainJob = "E_Approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		
		case 1 : 
			mainJob = "E_Approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 2 : 
			mainJob = "E_Approval_view_petition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 3 : 
			mainJob = "E_Approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 4 : 
			mainJob = "E_Approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 5 : 
			mainJob = "E_Approval_view_vacation.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 6 : 
			mainJob = "E_Approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case 7 : 
			mainJob = "E_Approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		}
		
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
	
	@RequestMapping(value = "/newPage")
	public ModelAndView newPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ElectronicApproval/E_Approval_choose_decisionMakers");
		return mv;
		
	}
	
}
