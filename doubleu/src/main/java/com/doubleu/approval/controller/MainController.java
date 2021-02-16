package com.doubleu.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	//결재 form insert
	@RequestMapping(value = "/approvalInsertR", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView insert( FormVo vo,
								FormPetitionVo petitionVo, 
								FormVacationVo vacationVo, 
								@RequestParam("approvalFile") List<MultipartFile> mul,
								HttpServletRequest req
								) {
		System.out.println("insert 도착");
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		//결재권자 list 작성
		List<DecisionMakerVo> desitionMakerList = desicionMakerController.getMakerList(req);
		vo.setMakersList(desitionMakerList);
		
		//첨부파일 
		List<AttFileVo> attList = uploadController.upload(mul);
		vo.setAttFileList(attList);
		
		//결재 양식이 공통 범위보다 많은 정보를 담아야 할 경우.
		if(vo.getFormType() == "품의서" || vo.getFormType() == "구매품의서") {
			vo.setFormPetitionVo(petitionVo);
		}
		else if(vo.getFormType().equals("휴가신청서")) {
			vo.setFormVacationVo(vacationVo);
		}
		
		msg = service.insert(vo);
		
		System.out.println(msg);
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

		mv.setViewName("/ElectronicApproval/E_Approval_home");
		return mv;
	}
}
