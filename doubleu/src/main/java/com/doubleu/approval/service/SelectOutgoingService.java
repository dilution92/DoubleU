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
public class SelectOutgoingService {

	@Autowired
	ApprovalDao dao;
	public Map<String, Object> selectOutgoing(HttpServletRequest req, HttpSession session) {
		System.out.println("selectOutgoing메소드 시작.....");
		Map<String,Object> map = new HashMap<String,Object>();
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		IndexPage page = new IndexPage();
		int memberNo = memberVo.getMemberNo();
		int nowOutgoingPage = 1;
		String findStr = "";
		String findType = "";

		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		if(req.getParameter("nowOutgoingPage") != null) {
			nowOutgoingPage = Integer.parseInt(req.getParameter("nowOutgoingPage"));
		}
		
		System.out.println("findStr: "+ findStr);
		System.out.println("findType: "+ findType);
		page.setFindStr(findStr);
		page.setFindType(findType);
		page.setMemberNo(memberNo);
		page.setNowPage(nowOutgoingPage);
		map = dao.selectOutgoing(page);
		System.out.println("selectOutgoing메소드 종료.....");
		return map;
				
				
				
				
	}
	
}
