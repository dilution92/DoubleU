package com.doubleu.calender.service;

import java.util.List;

import com.doubleu.calender.vo.CalenderVo;

public interface CalenderService {
	
	public String insert(CalenderVo vo);
	public List<CalenderVo> selectList(); //userid를 파라미터로
}
