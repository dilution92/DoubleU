package com.doubleu.approval.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.approval.mybatis.ApprovalDao;
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
	
}

