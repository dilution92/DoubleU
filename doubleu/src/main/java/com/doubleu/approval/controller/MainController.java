package com.doubleu.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.approval.vo.DecisionMakerVo;
import com.doubleu.approval.vo.FormVo;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.FormPetitionVo;
import com.doubleu.approval.vo.FormVacationVo;

@RestController
public class MainController {
	@Autowired
	ApprovalDao service;
	
	@Autowired
	UploadController uploadController;
	
	@Autowired
	CreateDesicionMakerController desicionMakerController;
	
	//indexPage select
	@RequestMapping(value = "/approvalIndex")
	public ModelAndView mainHeader(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		IndexPage page = new IndexPage();
		String mainJob = "select/approval_select.jsp";
		int employeeNo = Integer.parseInt(req.getParameter("employeeNo"));
		String findStr = "";
		int nowPage = 1;
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("nowPage") != null) {
			findStr = req.getParameter("nowPage");
		}
		
		page.setEmployeeNo(employeeNo);
		page.setFindStr(findStr);
		page.setNowPage(nowPage);
		
		Map<String, Object> outgoingMap = service.outgoingSelect(page);
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
		
		
		//결재권자 list 작성
		List<DecisionMakerVo> desitionMakerList = desicionMakerController.getMakerList(req);
		vo.setMakersList(desitionMakerList);
		
		//첨부파일 
		List<AttFileVo> attList = uploadController.upload(mul);
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
		mv.setViewName("/ElectronicApproval/approval_index");
		//  클라언트 요청 컨트롤 > 서비스 > 다오 > 마이바티스 > 다오로 반환 > 서비스 반환 > 컨트롤로 리턴 > 뷰로 리턴 
		return mv; 
	}
	
	@RequestMapping(value = "/approvalTempInsert", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView tempInsert(FormVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("tempInsert 도착");
		
		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoSelect", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Goselect 도착");

		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
}
