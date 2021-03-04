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
	public void memberUpdate(MemberVo vo);
	public List<MemberVo> selectManage(); 
	public List<MemberVo> selectBusiness();
	public List<MemberVo> selectIT();
	public List<MemberVo> selectDevelop();
}