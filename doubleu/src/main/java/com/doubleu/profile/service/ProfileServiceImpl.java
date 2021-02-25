package com.doubleu.profile.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.profile.mybatis.ProfileMapper;
import com.doubleu.profile.vo.MemberVo;



@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	ProfileMapper mapper;

	@Override
	public String insert(MemberVo vo) {
		System.out.println("service 시작");
		String msg = "정상적으로 등록되었습니다.";
		int cnt = mapper.insert(vo);
		System.out.println("service 종료");
		return msg;
	}
	
	@Override
	public List<MemberVo> selectList() {
		List<MemberVo> pList = new ArrayList<>();
		return pList;
	}
}
