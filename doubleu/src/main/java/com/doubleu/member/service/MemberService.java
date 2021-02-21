package com.doubleu.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.member.mybatis.MemberMapper;
import com.doubleu.member.vo.MemberVo;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public String insert(MemberVo vo) {
		System.out.println("시작");
		String msg = "입력되었습니다";
		int cnt = mapper.insert(vo);
		System.out.println("종료");
		return msg;
	}
}

