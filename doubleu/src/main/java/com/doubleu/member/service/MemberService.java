package com.doubleu.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.member.mybatis.MemberMapper;
import com.doubleu.member.vo.MemberVo;
import com.doubleu.profile.vo.WorkVo;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public List<MemberVo> selectOne(int no) {
		return mapper.selectOne(no);
	}
	public void memberUpdate(MemberVo vo){
		System.out.println("update 시작");
		mapper.memberUpdate(vo);
		System.out.println("updateMember 완료");
	}
	
	public List<MemberVo> selectManage() {
		return mapper.selectManage();
	}
	
	public List<MemberVo> selectBusiness() {
		return mapper.selectBusiness();
	}
	public List<MemberVo> selectIT() {
		return mapper.selectIT();
	}
	
	public List<MemberVo> selectDevelop() {
		return mapper.selectDevelop();
	}
}


