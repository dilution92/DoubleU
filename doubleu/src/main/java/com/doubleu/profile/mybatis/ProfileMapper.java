package com.doubleu.profile.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.calender.vo.CalenderVo;
import com.doubleu.profile.vo.MemberVo;


@Repository
@Mapper
public interface ProfileMapper {
	public int update(MemberVo vo);
	public List<MemberVo> select();
	public int selectProfileTotalCount();

	public int insert(MemberVo vo);

}

