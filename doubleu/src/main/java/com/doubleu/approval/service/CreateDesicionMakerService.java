package com.doubleu.approval.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.doubleu.approval.vo.DecisionMakerVo;

@Service
public class CreateDesicionMakerService {

	public List<DecisionMakerVo> getMakerList(HttpServletRequest req) {
		System.out.println("getMakerList메소드 시작....");
		List<DecisionMakerVo> list = new ArrayList<>();
		int formNo = 0;
		if(req.getParameter("formNo") != "") {
			System.out.println("ifans");
			formNo = Integer.parseInt(req.getParameter("formNo"));
		}
		String makerPositionStr = req.getParameter("makerPositionArr");
		String makerNameStr = req.getParameter("makerNameArr");
		String makerOrderStr = req.getParameter("makerOrderArr");
		String makerNoStr = req.getParameter("makerNoArr");
		String makerComment = "";
		
		
		String[] makerPosition = makerPositionStr.split(",");
		String[] makerName = makerNameStr.split(",");
		String[] makerOrder = makerOrderStr.split(",");
		String[] makerNo = makerNoStr.split(",");
		int listSize = makerOrder.length;
		
		for(int i = 0; i < listSize; i++) {
			System.out.println("for문 진입");
			DecisionMakerVo decisionMaker = new DecisionMakerVo();
			System.out.println(makerPosition[i]);
			System.out.println(makerName[i]);
			System.out.println(makerOrder[i]);
			System.out.println(makerNo[i]);
			
			if(formNo != 0) {
				decisionMaker.setFormNo(formNo);
			}
			decisionMaker.setMakerPosition(makerPosition[i]);
			decisionMaker.setMakerName(makerName[i]);
			decisionMaker.setMakerOrder(makerOrder[i]);
			decisionMaker.setMemberNo(Integer.parseInt(makerNo[i]));
			decisionMaker.setMakerComment(makerComment);
			list.add(decisionMaker);
			System.out.println("for문 종료");
		}
		
		return list;
	}
}
