package com.doubleu.approval.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.doubleu.approval.vo.DecisionMakerVo;

@Service
public class CreateDesicionMakerService {

	public List<DecisionMakerVo> getMakerList(HttpServletRequest req) {
		List<DecisionMakerVo> list = new ArrayList<>();
		String makerPositionStr = req.getParameter("makerPositionArr");
		String makerNameStr = req.getParameter("makerNameArr");
		String makerOrderStr = req.getParameter("makerOrderArr");
		String makerComment = "";
		
		
		String[] makerPosition = makerPositionStr.split(",");
		String[] makerName = makerNameStr.split(",");
		String[] makerOrder = makerOrderStr.split(",");
		
		int listSize = makerOrder.length;
		
		for(int i = 0; i < listSize; i++) {
			DecisionMakerVo decisionMaker = new DecisionMakerVo();
			
			decisionMaker.setMakerPosition(makerPosition[i]);
			decisionMaker.setMakerName(makerName[i]);
			decisionMaker.setMakerOrder(makerOrder[i]);
			decisionMaker.setMakerComment(makerComment);
			list.add(decisionMaker);
		}
		
		return list;
	}
}
