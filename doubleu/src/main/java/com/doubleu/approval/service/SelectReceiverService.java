package com.doubleu.approval.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.login.vo.LoginVo;

@Service

public class SelectReceiverService {

	@Autowired
	ApprovalDao dao;

	public Map<String, Object> selectReceiver(HttpServletRequest req, HttpSession session) {
		System.out.println("selectReceiver-service메소드 시작....");
		Map<String, Object> map = new HashMap<String, Object>();
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		int memberNo = memberVo.getMemberNo();
		IndexPage page = new IndexPage();
		int nowReceiverPage = 1;
		
		System.out.println(req.getParameter("nowReceiverPage"));
		if(req.getParameter("nowReceiverPage")!=null || req.getParameter("nowReceiverPage")!=null) { 
			System.out.println("1체크");
			nowReceiverPage = Integer.parseInt(req.getParameter("nowReceiverPage")); 
		}
		page.setMemberNo(memberNo);
		page.setNowPage(nowReceiverPage);
		System.out.println("nowReceiverPage : " + nowReceiverPage);
		map = dao.selectReceiver(page);
		System.out.println("selectReceiver-service메소드 종료....");
		return map;
	}

}
