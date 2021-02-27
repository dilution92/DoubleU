package com.doubleu.calender.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.calender.vo.CalenderVo;

@Repository
@Mapper
public interface CalenderMapper {
	public int insert(CalenderVo vo);
	public List<CalenderVo> selectList();
	public CalenderVo selectOne(int id);
}
