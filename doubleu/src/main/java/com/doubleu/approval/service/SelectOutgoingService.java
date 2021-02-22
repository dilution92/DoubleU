package com.doubleu.approval.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;

@Service
public class SelectOutgoingService {

	@Autowired
	ApprovalDao dao;
	public Map<String, Object> selectOutgoing(HttpServletRequest req) {
		Map<String,Object> map = new HashMap<String,Object>();
		IndexPage page = new IndexPage();
		String mainJob = "select/approval_select.jsp";
		int memberNo = 2;
		String findStr = " ";
		int nowOutgoingPage = 1;
		if(req.getParameter("nowOutgoingPage") != null) {
			nowOutgoingPage = Integer.parseInt(req.getParameter("nowOutgoingPage"));
		}
		if(req.getParameter("memberNo") != null) {
			memberNo = Integer.parseInt(req.getParameter("memberNo"));
		}
		System.out.println("nowOutgoingPage: " + nowOutgoingPage);
		System.out.println("findStr: "+ findStr);
		page.setMemberNo(memberNo);
		page.setNowPage(nowOutgoingPage);
		map = dao.selectOutgoing(page);
		return map;
				
				
				
				
	}
	
}
