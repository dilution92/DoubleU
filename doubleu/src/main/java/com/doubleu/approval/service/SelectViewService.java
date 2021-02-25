package com.doubleu.approval.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.approval.vo.DecisionMakerVo;
import com.doubleu.approval.vo.FormVo;
import com.doubleu.login.vo.LoginVo;

@Service
public class SelectViewService {

	@Autowired
	ApprovalDao dao;

	public FormVo select(HttpServletRequest req) {
		FormVo formVo = new FormVo();
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		String formType = req.getParameter("formType");
		formVo.setFormNo(formNo);
		formVo.setFormType(formType);

		formVo = dao.selectView(formVo);
		
		return formVo;
	}
	
	public DecisionMakerVo selectMaker(HttpServletRequest req) {
		DecisionMakerVo vo = new DecisionMakerVo();
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		HttpSession session = req.getSession();
		LoginVo memberVo = (LoginVo) session.getAttribute("member");
		int memberNo = memberVo.getMemberNo();
		vo.setFormNo(formNo);
		vo.setMemberNo(memberNo);
		vo = dao.selectMaker(vo);
		return vo;
	}
}

