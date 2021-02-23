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
		int nowChooseSelectPage = 1;
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		int memberNo = memberVo.getMemberNo();
		if(req.getParameter("nowChooseSelectPage") != null) {
			nowChooseSelectPage = Integer.parseInt(req.getParameter("nowChooseSelectPage"));
		}
		SelectPage page = new SelectPage(); 
		page.setMemberNo(memberNo);
		page.setFindState(findState);
		page.setNowPage(nowChooseSelectPage);
		
		map = dao.selectOutgoingChoose(page);
		
		return map;
	}
	
}
