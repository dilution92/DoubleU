package com.doubleu.approval.service;

import java.util.HashMap;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.doubleu.approval.vo.FormVo;
@Service
public class SelectFormType {

	public Map<String, Object> checkFormType(FormVo vo) {
		Map<String,Object> map = new HashMap<>();
		String mainJob = null;
		String eventDate = null;
		
		String formDate = convertDate(vo.getFormDate());
		vo.setFormDate(formDate);
		switch(vo.getFormType()) {
		case "업무기안" : 
			mainJob = "view/approval_view_work.jsp";
			break;
		case "업무협조" : 
			mainJob = "view/approval_view_work.jsp";
			break;
		case "품의서" : 
			mainJob = "view/approval_view_petition.jsp";
			break;
		case "구매품의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			break;
		case "사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			break;
		case "휴가신청서" : 
			if(vo.getFormVacationVo().getStartDate() != null) {
				String startDate = convertDate(vo.getFormVacationVo().getStartDate());
				vo.getFormVacationVo().setStartDate(startDate);
			}
			if(vo.getFormVacationVo().getStartDate() != null) {
				String endDate = convertDate(vo.getFormVacationVo().getEndDate());
				vo.getFormVacationVo().setEndDate(endDate);
			}
			mainJob = "view/approval_view_vacation.jsp";
			break;
		case "지각/결근사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			break;
		case "지출결의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			break;
		}
		if(vo.getFormDate() != null) {
			eventDate = convertDate(vo.getFormDate());
			vo.setEventDate(eventDate);
		}
		map.put("convertVo", vo);
		map.put("mainJob", mainJob);
		return map;
	}
	
	public String convertDate(String dateStr) {
		String[] array = dateStr.split(" ");
		String date = array[0];
		return date;
	}
} 

