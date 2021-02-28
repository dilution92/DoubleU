package com.doubleu.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.profile.mybatis.ProfileMapper;
import com.doubleu.profile.vo.ProfileVo;

@Service
public class ProfileService {
	@Autowired
	ProfileMapper mapper;
	
	public List<ProfileVo> selectProfile(){
		System.out.println("select 시작");
		List<ProfileVo> list = mapper.selectProfile();
		System.out.println("select mapper 반환");
		return list;
	}
}
