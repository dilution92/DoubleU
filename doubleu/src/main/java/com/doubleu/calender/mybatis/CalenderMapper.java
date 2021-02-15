package com.doubleu.calender.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.calender.vo.CalenderVo;

@Repository
@Mapper
public interface CalenderMapper {
	public int insert(CalenderVo vo);
}
