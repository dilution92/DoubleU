package com.doubleu.email.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import com.doubleu.email.vo.EmailMainVo;

@Service
public class EmailDetailService {
	public List<EmailMainVo> selectDetail(HttpServletRequest req) {
		
		List<EmailMainVo> list = new ArrayList<>();
		
		String SendName = req.getParameter("searchSendName");
		String ContentsName = req.getParameter("searchContentsName");
		String DateOneName = req.getParameter("searchDateOneName");
		String DateTwoName = req.getParameter("searchDateTwoName");
		
		
		
		
		list.add(null);
		
		return list;
		
	}
}
