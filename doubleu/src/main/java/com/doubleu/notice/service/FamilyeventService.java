package com.doubleu.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.notice.mybatis.FamilyeventMapper;
import com.doubleu.notice.vo.FamilyeventVo;

@Service
public class FamilyeventService {
	@Autowired
	FamilyeventMapper mapper;
	
	public String insert(FamilyeventVo vo) {
		String msg = "정상 입력 됨";
		int cnt = mapper.insert(vo);
		return msg;
	}
}
