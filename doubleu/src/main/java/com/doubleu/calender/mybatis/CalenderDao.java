package com.doubleu.calender.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.calender.vo.CalenderVo;

@Service
@Transactional
public class CalenderDao {

	@Autowired
	CalenderMapper mapper;
	
	public String insert(CalenderVo vo) {
		System.out.println("service 시작");
		String msg = "정상적으로 등록되었습니다.";
		int cnt = mapper.insert(vo);
		System.out.println("service 종료");
		return msg;
	}

	public List<CalenderVo> selectList() {
		List<CalenderVo> cList = mapper.selectList();
		return cList;
	}
	
	
}
