package com.doubleu.calender.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.calender.vo.CalenderParticiptant;
import com.doubleu.calender.vo.CalenderVo;

@Repository
@Mapper
public interface CalenderMapper {
	public int insert(CalenderVo vo);
	public List<CalenderVo> selectList(int id);
	public CalenderVo selectOne(int id);
//	public List<CalenderParticiptant> selectPartiList(int no);
	public int update(CalenderVo vo);
//	public int updateParti(List<CalenderParticiptant> pList);
	public int delete(CalenderVo vo);
	public List<CalenderVo> selectMain(CalenderVo vo);
}
