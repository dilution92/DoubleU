package com.doubleu.approval.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.SelectPage;

@RestController
public class URLController {

	@Autowired
	ApprovalDao service;
	
	
	@RequestMapping(value = "/approvalGoList")
	public ModelAndView goList(HttpServletRequest req) {
		System.out.println("approvalGoList.....................(start)");
		
		ModelAndView mv = new ModelAndView();
		String findState = req.getParameter("findState");
		String listName = null;
		String findStr = "";
		String mainJob = "select/approval_select_formState.jsp";
		HttpSession session = req.getSession();
		
		String employeeNoStr = (String) session.getAttribute("employeeNo");
		int employeeNo = Integer.parseInt(employeeNoStr);
		System.out.println(employeeNo);
		
		int nowPage = 1;
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		SelectPage page = new SelectPage(); 
		page.setEmployeeNo(employeeNo);
		page.setFindType(findState);
		page.setNowPage(nowPage);
		
		Map<String, Object> chooseMap = service.chooseSelect(page);
		
		switch(findState) {
		case "(발신)상신" :
			listName = "상신한 문서함";
			mv.addObject("selectName", listName);
			break;
		case "(발신)임시저장" :
			listName = "임시저장된 문서";
			mv.addObject("selectName", listName);
			break;
		case "(발신)승인" :
			listName = "승인완료된 문서";
			mv.addObject("selectName", listName);
			break;
		case "(발신)반려" :
			listName = "반려된 문서";
			mv.addObject("selectName", listName);
			break;
		case "(수신)결재예정" :
			listName = "결재할 문서";
			mv.addObject("selectName", listName);
			break;
		case "(수신)승인" :
			listName = "승인한 문서";
			mv.addObject("selectName", listName);
			break;
		case "(수신)반려" :
			listName = "반려한 문서";
			mv.addObject("selectName", listName);
			break;
		}
		mv.addObject("mainJob", mainJob);
		mv.setViewName("ElectronicApproval/approval_index");
		System.out.println("approvalGoList.....................(end)");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoFormType")
	public ModelAndView goFormType(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String formType = req.getParameter("formType");
		String mainJob = null;
		String formName = null;

		
		switch(formType) {
		case "업무기안" :
			mainJob = "insert/approval_insert_work.jsp";
			formName = "업무 기안";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "업무협조" :
			mainJob = "insert/approval_insert_work.jsp";
			formName = "업무 협조";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "품의서" :
			mainJob = "insert/approval_insert_petition.jsp";
			formName = "품의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "구매품의서" :
			mainJob = "insert/approval_insert_purchasePetition.jsp";
			formName = "구매품의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "사유서" :
			mainJob = "insert/approval_insert_explanatory.jsp";
			formName = "사유서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "휴가신청서" :
			mainJob = "insert/approval_insert_vacation.jsp";
			formName = "휴가 신청서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "지각/결근사유서" :
			mainJob = "insert/approval_insert_explanatory.jsp";
			formName = "지각/결근 사유서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "지출결의서" :
			mainJob = "insert/approval_insert_purchasePetition.jsp";
			formName = "지출결의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		}
		
		mv.addObject("btns", "approval_insert_btns.jsp");
		mv.addObject("formType", formType);
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoView")
	public ModelAndView goView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		String formType = null;
		int formState = formNo;
		String mainJob = null;
		switch(formType) {
		
		case "업무기안" : 
			mainJob = "view/approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		
		case "업무협조" : 
			mainJob = "view/approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "품의서" : 
			mainJob = "view/approval_view_petition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "구매품의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "휴가신청서" : 
			mainJob = "view/approval_view_vacation.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지각/결근사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지출결의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		}
		
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
	
	@RequestMapping(value = "/approvalChoosePage")
	public ModelAndView newPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ElectronicApproval/insert/approval_choose_decisionMakers");
		return mv;
		
	}
	@RequestMapping(value = "/ApprovalBtns")
	public ModelAndView formBtns() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ElectronicApproval/E_Approval_Form_btns");
		return mv;
	}
}
