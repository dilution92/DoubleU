package com.doubleu.approval.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;

@Service

public class SelectReceiverService {

	@Autowired
	ApprovalDao dao;

	public Map<String, Object> selectReceiver(HttpServletRequest req) {
		System.out.println("selectReceiver-service메소드 시작....");
		Map<String, Object> map = new HashMap<String, Object>();
		IndexPage page = new IndexPage();
		int memberNo = 2;
		int nowReceiverPage = 1;
		
		System.out.println(req.getParameter("nowReceiverPage"));
		if(req.getParameter("nowReceiverPage")!=null || req.getParameter("nowReceiverPage")!=null) { 
			System.out.println("1체크");
			nowReceiverPage = Integer.parseInt(req.getParameter("nowReceiverPage")); 
		}
		if(req.getParameter("memberNo")!=null) {
			System.out.println("2체크");
			memberNo = Integer.parseInt(req.getParameter("memberNo"));
		}
		page.setMemberNo(memberNo);
		page.setNowPage(nowReceiverPage);
		System.out.println("nowReceiverPage : " + nowReceiverPage);
		map = dao.selectReceiver(page);
		System.out.println("selectReceiver-service메소드 종료....");
		return map;
	}

}
