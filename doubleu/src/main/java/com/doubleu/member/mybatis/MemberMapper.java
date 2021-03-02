package com.doubleu.member.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.member.vo.MemberVo;
import com.doubleu.profile.vo.ProfileVo;
import com.doubleu.profile.vo.WorkVo;

@Repository
@Mapper
public interface MemberMapper {
	public List<MemberVo> selectOne(int no); 
	public int updateMember(MemberVo vo);
	public void memberUpdate(MemberVo vo);
}