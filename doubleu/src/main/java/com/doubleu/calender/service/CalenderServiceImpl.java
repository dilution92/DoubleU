package com.doubleu.calender.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;

import com.doubleu.calender.mybatis.CalenderMapper;
import com.doubleu.calender.vo.CalenderVo;

@Service
public class CalenderServiceImpl implements CalenderService {

	@Autowired
	CalenderMapper mapper;
	
	@Override
	public String insert(CalenderVo vo) {
		System.out.println("service 시작");
		String msg = "정상적으로 등록되었습니다.";
		int cnt = mapper.insert(vo);
		System.out.println("service 종료");
		return msg;
	}

	@Override
	public List<CalenderVo> selectList() {
		List<CalenderVo> cList = new ArrayList<>();
		return cList;
	}
	
	
}
