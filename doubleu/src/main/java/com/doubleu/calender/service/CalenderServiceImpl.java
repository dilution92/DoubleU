package com.doubleu.calender.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.calender.mybatis.CalenderMapper;
import com.doubleu.calender.vo.CalenderVo;

@Service
public class CalenderServiceImpl implements CalenderService {

	@Autowired
	CalenderMapper mapper;
	
	@Override
	public String insert(CalenderVo vo) {
		String msg = "정상적으로 등록되었습니다.";
		int cnt = mapper.insert(vo);
		return msg;
	}
	
	
}
