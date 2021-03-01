package com.doubleu.email.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.login.vo.LoginVo;



@Service
public class EmailMainService {
	
	@Autowired
	EmailDao dao;
	
	public int selectSendEmail(
			HttpServletRequest req, 
			HttpSession session) {
			
			LoginVo loginVo = new LoginVo();
			loginVo = (LoginVo) session.getAttribute("member");	
			
			int mailBox = 3;
			String emailAddress = loginVo.getMemberEmail();
			
			
			EmailMainVo vo = new EmailMainVo();
			vo.setEmailAddress(emailAddress);
			vo.setEmailMailBox(mailBox);
			
			int cnt = dao.selectSendEmail(vo);
			System.out.println(vo);
			
			return cnt;
		}
	
}
