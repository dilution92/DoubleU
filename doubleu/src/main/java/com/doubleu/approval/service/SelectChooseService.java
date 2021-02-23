package com.doubleu.approval.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.SelectPage;
import com.doubleu.login.vo.LoginVo;

@Service
public class SelectChooseService {

	
	@Autowired
	ApprovalDao dao;
	public Map<String, Object> selectOutgoing(HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String findState = req.getParameter("findState");
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		SelectPage page = new SelectPage(); 
		int nowChooseSelectPage = 1;
		int memberNo = memberVo.getMemberNo();
		String findStr = "";
		String findType = "";
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		if(req.getParameter("nowChooseSelectPage") != null) {
			nowChooseSelectPage = Integer.parseInt(req.getParameter("nowChooseSelectPage"));
		}
		page.setFindStr(findStr);
		page.setFindType(findType);
		page.setMemberNo(memberNo);
		page.setFindState(findState);
		page.setNowPage(nowChooseSelectPage);
		
		map = dao.selectOutgoingChoose(page);
		
		return map;
	}
	
	public Map<String, Object> selectRecevier(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();
		String findState = req.getParameter("findState");
		HttpSession session = req.getSession();
		SelectPage page = new SelectPage();
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		int memberNo = memberVo.getMemberNo();
		int nowChooseSelectPage = 1;
		String findStr = "";
		String findType = "";
		
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		if(req.getParameter("nowChooseSelectPage") != null) {
			nowChooseSelectPage = Integer.parseInt(req.getParameter("nowChooseSelectPage"));
		}
		page.setFindStr(findStr);
		page.setFindType(findType);
		page.setNowPage(nowChooseSelectPage);
		page.setMemberNo(memberNo);
		page.setFindState(findState);

		map = dao.selectReceiverChoose(page);
		return map;
	}
}
