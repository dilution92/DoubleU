package com.doubleu.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.member.mybatis.MemberMapper;
import com.doubleu.member.vo.MemberVo;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public String update(MemberVo vo) throws Exception{
		//updateMember(vo);
		System.out.println("종료");
		return "member_list.do";
	}
}

