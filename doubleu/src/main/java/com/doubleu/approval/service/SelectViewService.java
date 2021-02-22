package com.doubleu.approval.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.DecisionMakerVo;
import com.doubleu.approval.vo.FormVo;

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
		int memberNo = 2;
		if(req.getParameter("memberNo") != null) {
			memberNo = Integer.parseInt(req.getParameter("memberNo"));
		}
		vo.setFormNo(formNo);
		vo.setMemberNo(memberNo);
		vo = dao.selectMaker(vo);
		
		return vo;
	}
}

