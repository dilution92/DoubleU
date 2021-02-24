package com.doubleu.approval.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;

@Service
public class SelectMemberService {

	@Autowired
	ApprovalDao dao;
	
	public Map<String, Object> selectMember(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<>();
		IndexPage page = new IndexPage();
		String findStr = "";
		int nowPage = 1;
		String findType = "";
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		
		page.setNowPage(nowPage);
		page.setFindStr(findStr);
		page.setFindType(findType);
		System.out.println(findType);
		map = dao.selectMember(page);
		
		return map;
	}
}

