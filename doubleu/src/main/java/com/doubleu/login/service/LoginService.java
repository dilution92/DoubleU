package com.doubleu.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.login.mybatis.LoginDao;
import com.doubleu.login.vo.LoginVo;

@Service
public class LoginService {
		
	@Autowired
	LoginDao dao;
	
	public LoginVo loginCheck(LoginVo vo, HttpSession session) {
		
		System.out.println("LoginService");
		vo = dao.selectLogin(vo);
		
		return vo;
	}
}
