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
		IndexPage page = new IndexPage();
		int memberNo = memberVo.getMemberNo();
		int nowReceiverPage = 1;
		String findStr = "";
		String findType = "";

		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		
		System.out.println(req.getParameter("nowReceiverPage"));
		if(req.getParameter("nowReceiverPage")!=null || req.getParameter("nowReceiverPage")!=null) { 
			nowReceiverPage = Integer.parseInt(req.getParameter("nowReceiverPage")); 
		}
		System.out.println("findStr: "+ findStr);
		System.out.println("findType: "+ findType);
		page.setFindStr(findStr);
		page.setFindType(findType);
		page.setMemberNo(memberNo);
		page.setNowPage(nowReceiverPage);
		System.out.println("nowReceiverPage : " + nowReceiverPage);
		map = dao.selectReceiver(page);
		System.out.println("selectReceiver-service메소드 종료....");
		return map;
	}

}
