package com.doubleu.login.mybatis;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginDao {
	
	@Autowired
	LoginMapper mapper;
	
}
