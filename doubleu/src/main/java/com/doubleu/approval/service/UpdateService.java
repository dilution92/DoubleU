package com.doubleu.approval.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.DecisionMakerVo;

@Service

public class UpdateService {

	@Autowired
	ApprovalDao dao;
	
	public String updateDecisionState(DecisionMakerVo makerVo) {
		System.out.println("updateService 메소드 도착.....");
		String msg = "정상적으로 등록되었습니다.";
		
		if(makerVo.getDecisionState() == 1) {
			msg = dao.updateDecisionApproval(makerVo);
		}
		else {
			msg = dao.updateDecisionReject(makerVo);
		}
		return msg;
	}
}
