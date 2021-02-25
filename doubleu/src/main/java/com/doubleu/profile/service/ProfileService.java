package com.doubleu.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.profile.mybatis.ProfileMapper;
import com.doubleu.profile.vo.MemberVo;


public interface ProfileService {
	public String insert(MemberVo vo);
	public List<MemberVo> selectList(); 
}
