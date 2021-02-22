package com.doubleu.login.mybatis;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.login.vo.LoginVo;


@Service
@Transactional
public class LoginDao {
	
	@Autowired
	LoginMapper mapper;
	
	// 로그인
	public LoginVo selectLogin(LoginVo vo) {
		
		vo = mapper.loginCheck(vo);
		return vo;
	}
}
