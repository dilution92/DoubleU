package com.doubleu.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.service.CreateDesicionMakerService;
import com.doubleu.approval.service.SelectChooseService;
import com.doubleu.approval.service.SelectFormType;
import com.doubleu.approval.service.SelectOutgoingService;
import com.doubleu.approval.service.SelectViewService;
import com.doubleu.approval.service.UploadService;
import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.approval.vo.DecisionMakerVo;
import com.doubleu.approval.vo.FormVo;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.SelectPage;
import com.doubleu.approval.vo.FormPetitionVo;
import com.doubleu.approval.vo.FormVacationVo;

@RestController
public class MainController {
	@Autowired
	ApprovalDao service;
	@Autowired
	UploadService uploadService;
	@Autowired
	CreateDesicionMakerService decisionMakerService;
	@Autowired
	SelectOutgoingService outgoingService;
	@Autowired
	SelectChooseService chooseService;
	@Autowired
	SelectViewService viewService;
	@Autowired
	SelectFormType CheckFormType;  
	
	//indexPage select
	@RequestMapping(value = "/approvalIndex")
	public ModelAndView mainHeader(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mainJob = "select/approval_select.jsp";
		
		//발신
		Map<String, Object> outgoingMap = outgoingService.selectOutgoing(req);
		mv.addObject("outgoingList", outgoingMap.get("list"));
		mv.addObject("outgoingPage", outgoingMap.get("page"));
		
		/* Map<String, Object> receptionMap = service.receptionSelect(page); */
		mv.addObject("mainJob", mainJob);
		mv.setViewName("ElectronicApproval/approval_index");
		return mv;
	}
	
	//결재 form insert
	@RequestMapping(value = "/approvalInsertR", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView insert( FormVo vo,
								FormPetitionVo petitionVo, 
								FormVacationVo vacationVo, 
								@RequestParam("approvalFile") List<MultipartFile> mul,
								HttpServletRequest req
								) {
		System.out.println("/approvalInsertR.....................(start)");
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		//직원 번호 주입 형변환 후 주입
		int employeeNo = Integer.parseInt(req.getParameter("employeeNo"));
		vo.setEmployeeNo(employeeNo);
		vo.setApprovalState("(발신)상신");
		//결재권자 list 작성
		int decisionMakerCnt = Integer.parseInt(req.getParameter("decisionMakerCnt"));
		if(decisionMakerCnt > 0) {
			List<DecisionMakerVo> desitionMakerList = decisionMakerService.getMakerList(req);
			vo.setDecisionMakersList(desitionMakerList);
		}
		
		//첨부파일 
		List<AttFileVo> attList = uploadService.upload(mul);
		vo.setAttFileList(attList);
		
		//결재 양식이 공통 범위보다 많은 정보를 담아야 할 경우.
		if(vo.getFormType().equals("품의서") || vo.getFormType().equals("구매품의서")) {
			System.out.println(petitionVo.getFormPurpose()+"123");
			vo.setFormPetitionVo(petitionVo);
		}
		else if(vo.getFormType().equals("휴가신청서")) {
			vo.setFormVacationVo(vacationVo);
		}
		
		msg = service.insert(vo);
		
		System.out.println(msg);
		System.out.println("/approvalInsertR.......................(end)");
		mv.setViewName("redirect:/approvalIndex");
		//  클라언트 요청 컨트롤 > 서비스 > 다오 > 마이바티스 > 다오로 반환 > 서비스 반환 > 컨트롤로 리턴 > 뷰로 리턴 
		return mv; 
	}
	
	@RequestMapping(value = "/approvalTempInsert", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView tempInsert( FormVo vo,
									FormPetitionVo petitionVo, 
									FormVacationVo vacationVo, 
									@RequestParam("approvalFile") List<MultipartFile> mul,
									HttpServletRequest req
									) {
		ModelAndView mv = new ModelAndView();
		System.out.println("tempInsert 도착");
		String msg = null;
		
		//직원 번호 주입 형변환 후 주입
		int employeeNo = Integer.parseInt(req.getParameter("employeeNo"));
		vo.setEmployeeNo(employeeNo);
		vo.setApprovalState("(발신)임시저장");
		//결재권자 list 작성
		int decisionMakerCnt = Integer.parseInt(req.getParameter("decisionMakerCnt"));
		if(decisionMakerCnt > 0) {
			List<DecisionMakerVo> desitionMakerList = decisionMakerService.getMakerList(req);
			vo.setDecisionMakersList(desitionMakerList);
		}
		
		//첨부파일 
		List<AttFileVo> attList = uploadService.upload(mul);
		vo.setAttFileList(attList);
		
		//결재 양식이 공통 범위보다 많은 정보를 담아야 할 경우.
		if(vo.getFormType().equals("품의서") || vo.getFormType().equals("구매품의서")) {
			vo.setFormPetitionVo(petitionVo);
		}
		else if(vo.getFormType().equals("휴가신청서")) {
			vo.setFormVacationVo(vacationVo);
		}
		msg = service.insert(vo);
		
		System.out.println(msg);
		System.out.println("/tempInsert.......................(end)");
		mv.setViewName("redirect:/approvalIndex");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoSelect", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Goselect 도착");

		mv.setViewName("redirect:/approvalIndex");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoList")
	public ModelAndView goList(HttpServletRequest req) {
		System.out.println("approvalGoList.....................(start)");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> selectChooseMap = null;
		String findState = req.getParameter("findState");
		String listName = null;
		String mainJob = "select/approval_select_formState.jsp";

		switch(findState) {
		case "(발신)상신" :
			selectChooseMap = chooseService.selectOutgoing(req);
			listName = "상신한 문서";
			mv.addObject("listName", listName);
			break;
		case "(발신)임시저장" :
			selectChooseMap = chooseService.selectOutgoing(req);
			listName = "임시저장된 문서";
			mv.addObject("listName", listName);
			break;
		case "(발신)승인" :
			selectChooseMap = chooseService.selectOutgoing(req);
			listName = "승인완료된 문서";
			mv.addObject("listName", listName);
			break;
		case "(발신)반려" :
			selectChooseMap = chooseService.selectOutgoing(req);
			listName = "반려된 문서";
			mv.addObject("listName", listName);
			break;
			
		case "(수신)결재예정" :
			listName = "결재할 문서";
			mv.addObject("listName", listName);
			break;
		case "(수신)승인" :
			listName = "승인한 문서";
			mv.addObject("listName", listName);
			break;
		case "(수신)반려" :
			listName = "반려한 문서";
			mv.addObject("listName", listName);
			break;
		}
		mv.addObject("mainJob", mainJob);
		mv.addObject("findState", findState);
		mv.addObject("list", selectChooseMap.get("list"));
		mv.addObject("page", selectChooseMap.get("page"));
		mv.setViewName("ElectronicApproval/approval_index");
		System.out.println("approvalGoList.....................(end)");
		return mv;
	}
	
	@RequestMapping(value = "/approvalSelectView")
	public ModelAndView goView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Map<String,Object> formMap = new HashMap<>();
		String formType = req.getParameter("formType");
		FormVo vo = viewService.select(req);
		formMap = CheckFormType.checkFormType(vo);
		vo = (FormVo) (formMap.get("convertVo"));
		System.out.println("일시" + vo.getEventDate());
		System.out.println("시작" + vo.getFormVacationVo().getStartDate());
		System.out.println("끝" + vo.getFormVacationVo().getEndDate());
		mv.addObject("mainJob", (String)(formMap.get("mainJob")));
		mv.addObject("vo", vo);
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
	
	
	@RequestMapping(value = "/approvalUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView goUpdate(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		String formType = req.getParameter("formType");
		
		System.out.println("/approvalUpdate.......................start");
		System.out.println("문서번호:" + formNo);
		System.out.println("결재 양식:" + formType);
		String mainJob = null;

		FormVo vo = viewService.select(req);
		
		switch(formType) {
		case "업무기안" : 
			mainJob = "update/approval_update_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		
		case "업무협조" : 
			mainJob = "update/approval_update_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "품의서" : 
			mainJob = "update/approval_update_petition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "구매품의서" : 
			mainJob = "update/approval_update_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "사유서" : 
			mainJob = "update/approval_update_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "휴가신청서" : 
			mainJob = "update/approval_update_vacation.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지각/결근사유서" : 
			mainJob = "update/approval_update_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지출결의서" : 
			mainJob = "update/approval_update_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		}
		mv.addObject("vo", vo);
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
	
	@RequestMapping(value = "/approvalUpdateR", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateR( FormVo vo,
								FormPetitionVo petitionVo, 
								FormVacationVo vacationVo, 
								@RequestParam("approvalFile") List<MultipartFile> mul,
								HttpServletRequest req
								) {
		System.out.println("approvalUpdate start..");
		ModelAndView mv = new ModelAndView();
		int employeeNo = Integer.parseInt(req.getParameter("employeeNo"));
		String msg = null;
		System.out.println(petitionVo.getFormNo());
		System.out.println(vacationVo.getFormNo());
		vo.setApprovalState("(발신)상신");

		
		if(vo.getFormType().equals("품의서") || vo.getFormType().equals("구매품의서")) {
			msg = service.updatePetition(petitionVo);
			System.out.println(msg);
		}
		
		else if(vo.getFormType().equals("휴가신청서")) {
			msg = service.updateVacation(vacationVo);
			System.out.println(msg);
		}
		
		int decisionMakerCnt = Integer.parseInt(req.getParameter("decisionMakerCnt"));
		if(decisionMakerCnt > 0) {
			List<DecisionMakerVo> decisionMakerList = decisionMakerService.getMakerList(req);
			msg = service.deleteDicisionMakers(decisionMakerList.get(0).getFormNo());
			System.out.println(msg);
			msg = service.insertDicisionMakers(decisionMakerList);
		}
		msg = service.updateR(vo);
		
		mv.setViewName("redirect:/approvalIndex");
		return mv;
	}
}
