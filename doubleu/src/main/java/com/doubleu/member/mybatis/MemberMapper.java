package com.doubleu.member.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.member.vo.MemberVo;

@Repository
@Mapper
public interface MemberMapper {
	public int insert(MemberVo vo);
}