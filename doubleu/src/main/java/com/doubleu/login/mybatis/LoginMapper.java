package com.doubleu.login.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.login.vo.LoginVo;

@Repository
@Mapper
public interface LoginMapper {
	public LoginVo selectLogin();
}